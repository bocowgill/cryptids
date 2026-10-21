"""A typed, non-executing compiler-schedule language and its Lean translation.

The model generates arbitrary expression trees in this language, not policy IDs.
No eval, exec, candidate imports, generated Python execution or generated Lean tactics.
"""
import ast
import itertools


class Plan:
    def __init__(self, code):
        if len(code) > 4000:
            raise ValueError("Candidate exceeds 4000 characters")
        tree = ast.parse(code)
        if len(list(ast.walk(tree))) > 150:
            raise ValueError("Candidate exceeds 150 AST nodes")
        if len(tree.body) != 1 or not isinstance(tree.body[0], ast.Assign):
            raise ValueError("Use exactly one PLAN = expression assignment")
        statement = tree.body[0]
        if (len(statement.targets) != 1 or not isinstance(statement.targets[0], ast.Name)
                or statement.targets[0].id != "PLAN"):
            raise ValueError("Only PLAN may be assigned")
        self.tree = statement.value
        self.lean = self.compile(self.tree, "plan")

    @staticmethod
    def call(node, name, arity):
        return (isinstance(node, ast.Call) and isinstance(node.func, ast.Name)
                and node.func.id == name and len(node.args) == arity and not node.keywords)

    def compile(self, node, kind):
        if isinstance(node, ast.BinOp) and isinstance(node.op, ast.Add):
            op = " + " if kind == "nat" else " ++ "
            return "(" + self.compile(node.left, kind) + op + self.compile(node.right, kind) + ")"
        if kind == "plan":
            if isinstance(node, ast.List) and not node.elts:
                return "[]"
            if self.call(node, "writes", 2):
                return "(R.writes " + self.compile(node.args[0], "bits") + " " + self.compile(node.args[1], "dir") + ")"
            if self.call(node, "moves", 2):
                return "(R.moves " + self.compile(node.args[0], "dir") + " " + self.compile(node.args[1], "nat") + ")"
        if kind == "bits":
            if isinstance(node, ast.Name) and node.id == "bits":
                return "bits"
            if isinstance(node, ast.List) and all(isinstance(x, ast.Constant) and type(x.value) is int
                                                and x.value in (0, 1) for x in node.elts):
                return "[" + ", ".join(str(x.value) for x in node.elts) + "]"
            if self.call(node, "reverse", 1) or self.call(node, "reversed", 1):
                return "(" + self.compile(node.args[0], "bits") + ").reverse"
            if self.call(node, "list", 1):
                return self.compile(node.args[0], "bits")
            if (isinstance(node, ast.Subscript) and isinstance(node.slice, ast.Slice)
                    and node.slice.lower is None and node.slice.upper is None
                    and isinstance(node.slice.step, ast.UnaryOp)
                    and isinstance(node.slice.step.op, ast.USub)
                    and isinstance(node.slice.step.operand, ast.Constant)
                    and type(node.slice.step.operand.value) is int and node.slice.step.operand.value == 1):
                return "(" + self.compile(node.value, "bits") + ").reverse"
        if kind == "nat":
            if isinstance(node, ast.Constant) and type(node.value) is int and 0 <= node.value <= 16:
                return str(node.value)
            if self.call(node, "len", 1):
                return "(" + self.compile(node.args[0], "bits") + ").length"
            if isinstance(node, ast.BinOp) and isinstance(node.op, ast.Mult):
                if not any(isinstance(x, ast.Constant) for x in (node.left, node.right)):
                    raise ValueError("Multiplication requires a literal factor")
                return "(" + self.compile(node.left, "nat") + " * " + self.compile(node.right, "nat") + ")"
        if kind == "dir" and isinstance(node, ast.Constant) and node.value in ("L", "R"):
            return ".left" if node.value == "L" else ".right"
        raise ValueError("Unsupported " + kind + " expression: " + ast.dump(node, include_attributes=False))

    def interpret(self, node, kind, bits):
        """Independent list semantics. Never delegates to Python eval or executes candidates."""
        if isinstance(node, ast.BinOp) and isinstance(node.op, ast.Add):
            return self.interpret(node.left, kind, bits) + self.interpret(node.right, kind, bits)
        if kind == "plan":
            if isinstance(node, ast.List):
                return []
            if self.call(node, "writes", 2):
                values = self.interpret(node.args[0], "bits", bits)
                direction = self.interpret(node.args[1], "dir", bits)
                return [(b, direction) for b in values]
            if self.call(node, "moves", 2):
                count = self.interpret(node.args[1], "nat", bits)
                if count > 100000:
                    raise ValueError("Expanded fixture schedule too long")
                return [(None, self.interpret(node.args[0], "dir", bits))] * count
        if kind == "bits":
            if isinstance(node, ast.Name):
                return bits
            if isinstance(node, ast.List):
                return [x.value for x in node.elts]
            if isinstance(node, ast.Subscript):
                return self.interpret(node.value, "bits", bits)[::-1]
            values = self.interpret(node.args[0], "bits", bits)
            return values if self.call(node, "list", 1) else values[::-1]
        if kind == "nat":
            if isinstance(node, ast.Constant):
                return node.value
            if isinstance(node, ast.BinOp):
                return self.interpret(node.left, kind, bits) * self.interpret(node.right, kind, bits)
            return len(self.interpret(node.args[0], "bits", bits))
        return -1 if node.value == "L" else 1

    def length(self, n):
        def length(node, kind):
            if isinstance(node, ast.BinOp):
                left, right = length(node.left, kind), length(node.right, kind)
                return left * right if isinstance(node.op, ast.Mult) else left + right
            if isinstance(node, ast.List):
                return len(node.elts)
            if kind == "plan":
                return length(node.args[0], "bits") if self.call(node, "writes", 2) else length(node.args[1], "nat")
            if kind == "bits":
                if isinstance(node, ast.Name):
                    return n
                return length(node.value if isinstance(node, ast.Subscript) else node.args[0], "bits")
            if isinstance(node, ast.Constant):
                return node.value
            return length(node.args[0], "bits")
        return length(self.tree, "plan")

    def fixtures(self):
        checked = 0
        for n in range(7):
            for values in itertools.product((0, 1), repeat=n):
                bits = list(values)
                schedule = self.interpret(self.tree, "plan", bits)
                if len(schedule) != self.length(n):
                    raise ValueError("Independent cost mismatch")
                tape, head = {}, 0
                for write, direction in schedule:
                    if write is not None:
                        tape[head] = write
                    head += direction
                actual = {cell - head: bit for cell, bit in tape.items() if bit}
                expected = {i: bit for i, bit in enumerate(bits) if bit}
                if actual != expected:
                    raise ValueError("Tape/head counterexample: " + repr(dict(bits=bits,
                        head=head, expected=expected, actual=actual)))
                checked += 1
        return {"binary_inputs": checked, "maximum_length": 6, "proof": False}

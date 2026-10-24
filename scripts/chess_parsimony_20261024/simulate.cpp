// Bounded ordinary step simulator, independent of the printer's construction.
#include <cstdint>
#include <fstream>
#include <iostream>
#include <stdexcept>
#include <string>
#include <vector>
struct Row { unsigned char write, right; uint32_t target; };
int census(const char* path) {
  std::ifstream in(path, std::ios::binary);
  if (!in) throw std::runtime_error("census open failed");
  uint64_t cells = 0, missing = 0; uint32_t maximum = 0;
  while (true) {
    unsigned char b[6]; in.read(reinterpret_cast<char*>(b), 6);
    if (in.gcount() == 0 && in.eof()) break;
    if (in.gcount() != 6) throw std::runtime_error("census short record");
    uint32_t t = b[2] | (uint32_t(b[3]) << 8) | (uint32_t(b[4]) << 16)
                 | (uint32_t(b[5]) << 24);
    if (b[0] == 2) {
      if (b[1] != 0 || t != 0) throw std::runtime_error("census invalid halt");
      ++missing;
    } else {
      if (b[0] > 1 || b[1] > 1) throw std::runtime_error("census invalid action");
      if (t > maximum) maximum = t;
    }
    ++cells;
  }
  if (cells == 0 || cells % 2 != 0) throw std::runtime_error("census incomplete state");
  if (maximum >= cells / 2) throw std::runtime_error("census invalid target");
  std::cout << "{\"states\":" << cells / 2 << ",\"cells\":" << cells
    << ",\"missing_cells\":" << missing << ",\"bytes\":" << cells * 6
    << ",\"maximum_target\":" << maximum << "}\n";
  return 0;
}
int main(int argc, char** argv) {
  try {
    if (argc == 3 && std::string(argv[1]) == "--census") return census(argv[2]);
    if (argc != 7) throw std::runtime_error("table states out error cap prefix");
    uint32_t states = std::stoul(argv[2]), out = std::stoul(argv[3]);
    uint32_t error = std::stoul(argv[4]); uint64_t cap = std::stoull(argv[5]);
    std::string prefix = argv[6]; std::ifstream in(argv[1], std::ios::binary);
    std::vector<Row> table;
    for (uint64_t i = 0; i < 2ull * states; ++i) {
      unsigned char b[6]; if (!in.read(reinterpret_cast<char*>(b), 6))
        throw std::runtime_error("short table");
      uint32_t target = b[2] | (uint32_t(b[3]) << 8) | (uint32_t(b[4]) << 16)
                       | (uint32_t(b[5]) << 24);
      if (b[0] > 2 || b[1] > 1 || (b[0] != 2 && target >= states))
        throw std::runtime_error("invalid row");
      table.push_back({b[0], b[1], target});
    }
    char extra; if (in.get(extra)) throw std::runtime_error("extra table bytes");
    std::vector<unsigned char> pos(1, 0), neg(1, 0);
    int64_t head = 0, low = 0, high = 0; uint32_t state = 0;
    uint64_t steps = 0; std::string status = "step_cap";
    while (steps < cap) {
      if (state == out) { status = "boundary"; break; }
      if (state == error) { status = "error"; break; }
      auto& side = head < 0 ? neg : pos;
      uint64_t index = head < 0 ? uint64_t(-head - 1) : uint64_t(head);
      if (index >= 10000000) throw std::runtime_error("tape bound");
      if (index >= side.size()) side.resize(index + 1, 0);
      const Row& row = table[2ull * state + side[index]];
      if (row.write == 2) { status = "halt"; break; }
      side[index] = row.write; head += row.right ? 1 : -1; state = row.target;
      if (head < low) low = head;
      if (head > high) high = head;
      ++steps;
    }
    if (state == out) status = "boundary";
    auto cell = [&](int64_t i) -> unsigned char {
      if (i < 0) { uint64_t k = -i-1; return k < neg.size() ? neg[k] : 0; }
      return uint64_t(i) < pos.size() ? pos[i] : 0;
    };
    std::ofstream tape(prefix + ".tape", std::ios::binary);
    uint64_t ones = 0;
    for (int64_t i = low; i <= high; ++i) { auto b = cell(i); tape.put(b); ones += b; }
    std::cout << "{\"status\":\"" << status << "\",\"steps\":" << steps
      << ",\"state\":" << state << ",\"head\":" << head << ",\"low\":" << low
      << ",\"high\":" << high << ",\"ones\":" << ones << "}\n";
    return 0;
  } catch (const std::exception& e) { std::cerr << e.what() << '\n'; return 1; }
}

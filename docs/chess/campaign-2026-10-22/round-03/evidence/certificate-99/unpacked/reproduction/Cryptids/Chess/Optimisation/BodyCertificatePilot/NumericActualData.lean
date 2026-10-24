module
public import Cryptids.Chess.Optimisation.BodyCertificatePilot.NumericSourceAdapter

@[expose] public section
namespace Chess.Optimisation.BodyCertificatePilot
open Turing ConjectureMachines ConjectureMachines.Compilation
set_option maxRecDepth 1000000
set_option Elab.async false
set_option compiler.extract_closed false
open FieldCompiler RawLabelPilot RawChunkPilot
namespace NumericActualDataPilot
def label_355 : Fin 4042 := ⟨355, by decide +kernel⟩
noncomputable def raw_355 : RawOp :=
  RawOp.load
    bounded_4_3
    ⟨#[
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩
    ], rfl⟩
    354
noncomputable def syntax_355 : Syntax 4042 :=
  SourceRecipePilot.syntaxOf raw_355
noncomputable def trace_355_3 : NumericTreePilot.Trace :=
  (.unary 3
    (.move .left 2)
    (.unary 2
      (.move .left 1)
      (.unary 1
        (.load
          ⟨#[
            ⟨0, by decide +kernel⟩,
            ⟨0, by decide +kernel⟩,
            ⟨0, by decide +kernel⟩,
            ⟨0, by decide +kernel⟩,
            ⟨0, by decide +kernel⟩,
            ⟨0, by decide +kernel⟩,
            ⟨0, by decide +kernel⟩,
            ⟨0, by decide +kernel⟩,
            ⟨0, by decide +kernel⟩,
            ⟨0, by decide +kernel⟩], rfl⟩
          0
        )
        (.leaf 0
          (.go
            ⟨#[
              ⟨354, by decide +kernel⟩,
              ⟨354, by decide +kernel⟩,
              ⟨354, by decide +kernel⟩,
              ⟨354, by decide +kernel⟩,
              ⟨354, by decide +kernel⟩,
              ⟨354, by decide +kernel⟩,
              ⟨354, by decide +kernel⟩,
              ⟨354, by decide +kernel⟩,
              ⟨354, by decide +kernel⟩,
              ⟨354, by decide +kernel⟩], rfl⟩
          )
        )
      )
    )
  )
noncomputable def trace_355_8 : NumericTreePilot.Trace :=
  (.unary 8
    (.move .left 7)
    (.unary 7
      (.move .left 6)
      (.unary 6
        (.move .left 5)
        (.unary 5
          (.move .left 4)
          (.unary 4
            (.move .left 3)
            trace_355_3
          )
        )
      )
    )
  )
noncomputable def trace_355_13 : NumericTreePilot.Trace :=
  (.unary 13
    (.move .left 12)
    (.unary 12
      (.move .left 11)
      (.unary 11
        (.move .left 10)
        (.unary 10
          (.move .left 9)
          (.unary 9
            (.move .left 8)
            trace_355_8
          )
        )
      )
    )
  )
noncomputable def trace_355_18 : NumericTreePilot.Trace :=
  (.unary 18
    (.move .left 17)
    (.unary 17
      (.move .left 16)
      (.unary 16
        (.load
          ⟨#[
            ⟨3, by decide +kernel⟩,
            ⟨3, by decide +kernel⟩,
            ⟨3, by decide +kernel⟩,
            ⟨3, by decide +kernel⟩,
            ⟨3, by decide +kernel⟩,
            ⟨3, by decide +kernel⟩,
            ⟨3, by decide +kernel⟩,
            ⟨3, by decide +kernel⟩,
            ⟨3, by decide +kernel⟩,
            ⟨3, by decide +kernel⟩], rfl⟩
          15
        )
        (.leaf 15
          (.go
            ⟨#[
              ⟨354, by decide +kernel⟩,
              ⟨354, by decide +kernel⟩,
              ⟨354, by decide +kernel⟩,
              ⟨354, by decide +kernel⟩,
              ⟨354, by decide +kernel⟩,
              ⟨354, by decide +kernel⟩,
              ⟨354, by decide +kernel⟩,
              ⟨354, by decide +kernel⟩,
              ⟨354, by decide +kernel⟩,
              ⟨354, by decide +kernel⟩], rfl⟩
          )
        )
      )
    )
  )
noncomputable def trace_355_23 : NumericTreePilot.Trace :=
  (.unary 23
    (.move .left 22)
    (.unary 22
      (.move .left 21)
      (.unary 21
        (.move .left 20)
        (.unary 20
          (.move .left 19)
          (.unary 19
            (.move .left 18)
            trace_355_18
          )
        )
      )
    )
  )
noncomputable def trace_355_28 : NumericTreePilot.Trace :=
  (.unary 28
    (.move .left 27)
    (.unary 27
      (.move .left 26)
      (.unary 26
        (.move .left 25)
        (.unary 25
          (.move .left 24)
          (.unary 24
            (.move .left 23)
            trace_355_23
          )
        )
      )
    )
  )
noncomputable def trace_355_35 : NumericTreePilot.Trace :=
  (.unary 35
    (.move .left 34)
    (.unary 34
      (.move .left 33)
      (.unary 33
        (.load
          ⟨#[
            ⟨0, by decide +kernel⟩,
            ⟨0, by decide +kernel⟩,
            ⟨0, by decide +kernel⟩,
            ⟨0, by decide +kernel⟩,
            ⟨0, by decide +kernel⟩,
            ⟨0, by decide +kernel⟩,
            ⟨0, by decide +kernel⟩,
            ⟨0, by decide +kernel⟩,
            ⟨0, by decide +kernel⟩,
            ⟨0, by decide +kernel⟩], rfl⟩
          32
        )
        (.leaf 32
          (.go
            ⟨#[
              ⟨354, by decide +kernel⟩,
              ⟨354, by decide +kernel⟩,
              ⟨354, by decide +kernel⟩,
              ⟨354, by decide +kernel⟩,
              ⟨354, by decide +kernel⟩,
              ⟨354, by decide +kernel⟩,
              ⟨354, by decide +kernel⟩,
              ⟨354, by decide +kernel⟩,
              ⟨354, by decide +kernel⟩,
              ⟨354, by decide +kernel⟩], rfl⟩
          )
        )
      )
    )
  )
noncomputable def trace_355_40 : NumericTreePilot.Trace :=
  (.unary 40
    (.move .left 39)
    (.unary 39
      (.move .left 38)
      (.unary 38
        (.move .left 37)
        (.unary 37
          (.move .left 36)
          (.unary 36
            (.move .left 35)
            trace_355_35
          )
        )
      )
    )
  )
noncomputable def trace_355_45 : NumericTreePilot.Trace :=
  (.unary 45
    (.move .left 44)
    (.unary 44
      (.move .left 43)
      (.unary 43
        (.move .left 42)
        (.unary 42
          (.move .left 41)
          (.unary 41
            (.move .left 40)
            trace_355_40
          )
        )
      )
    )
  )
noncomputable def trace_355_50 : NumericTreePilot.Trace :=
  (.unary 50
    (.move .left 49)
    (.unary 49
      (.move .left 48)
      (.unary 48
        (.load
          ⟨#[
            ⟨1, by decide +kernel⟩,
            ⟨1, by decide +kernel⟩,
            ⟨1, by decide +kernel⟩,
            ⟨1, by decide +kernel⟩,
            ⟨1, by decide +kernel⟩,
            ⟨1, by decide +kernel⟩,
            ⟨1, by decide +kernel⟩,
            ⟨1, by decide +kernel⟩,
            ⟨1, by decide +kernel⟩,
            ⟨1, by decide +kernel⟩], rfl⟩
          47
        )
        (.leaf 47
          (.go
            ⟨#[
              ⟨354, by decide +kernel⟩,
              ⟨354, by decide +kernel⟩,
              ⟨354, by decide +kernel⟩,
              ⟨354, by decide +kernel⟩,
              ⟨354, by decide +kernel⟩,
              ⟨354, by decide +kernel⟩,
              ⟨354, by decide +kernel⟩,
              ⟨354, by decide +kernel⟩,
              ⟨354, by decide +kernel⟩,
              ⟨354, by decide +kernel⟩], rfl⟩
          )
        )
      )
    )
  )
noncomputable def trace_355_55 : NumericTreePilot.Trace :=
  (.unary 55
    (.move .left 54)
    (.unary 54
      (.move .left 53)
      (.unary 53
        (.move .left 52)
        (.unary 52
          (.move .left 51)
          (.unary 51
            (.move .left 50)
            trace_355_50
          )
        )
      )
    )
  )
noncomputable def trace_355_60 : NumericTreePilot.Trace :=
  (.unary 60
    (.move .left 59)
    (.unary 59
      (.move .left 58)
      (.unary 58
        (.move .left 57)
        (.unary 57
          (.move .left 56)
          (.unary 56
            (.move .left 55)
            trace_355_55
          )
        )
      )
    )
  )
noncomputable def trace_355_65 : NumericTreePilot.Trace :=
  (.unary 65
    (.move .right 64)
    (.branch 64
      (.branch
        ⟨#[
          false,
          false,
          false,
          false,
          false,
          true,
          true,
          true,
          true,
          true], rfl⟩
        31
        63
      )
      (.unary 31
        (.move .right 30)
        (.branch 30
          (.branch
            ⟨#[
              false,
              false,
              false,
              false,
              false,
              true,
              true,
              true,
              true,
              true], rfl⟩
            14
            29
          )
          (.unary 14
            (.move .right 13)
            trace_355_13
          )
          (.unary 29
            (.move .right 28)
            trace_355_28
          )
        )
      )
      (.unary 63
        (.move .right 62)
        (.branch 62
          (.branch
            ⟨#[
              false,
              false,
              false,
              false,
              false,
              true,
              true,
              true,
              true,
              true], rfl⟩
            46
            61
          )
          (.unary 46
            (.move .right 45)
            trace_355_45
          )
          (.unary 61
            (.move .right 60)
            trace_355_60
          )
        )
      )
    )
  )
noncomputable def trace_355_69 : NumericTreePilot.Trace :=
  (.unary 69
    (.move .left 68)
    (.unary 68
      (.move .left 67)
      (.unary 67
        (.load
          ⟨#[
            ⟨0, by decide +kernel⟩,
            ⟨0, by decide +kernel⟩,
            ⟨0, by decide +kernel⟩,
            ⟨0, by decide +kernel⟩,
            ⟨0, by decide +kernel⟩,
            ⟨0, by decide +kernel⟩,
            ⟨0, by decide +kernel⟩,
            ⟨0, by decide +kernel⟩,
            ⟨0, by decide +kernel⟩,
            ⟨0, by decide +kernel⟩], rfl⟩
          66
        )
        (.leaf 66
          (.go
            ⟨#[
              ⟨354, by decide +kernel⟩,
              ⟨354, by decide +kernel⟩,
              ⟨354, by decide +kernel⟩,
              ⟨354, by decide +kernel⟩,
              ⟨354, by decide +kernel⟩,
              ⟨354, by decide +kernel⟩,
              ⟨354, by decide +kernel⟩,
              ⟨354, by decide +kernel⟩,
              ⟨354, by decide +kernel⟩,
              ⟨354, by decide +kernel⟩], rfl⟩
          )
        )
      )
    )
  )
noncomputable def trace_355_74 : NumericTreePilot.Trace :=
  (.unary 74
    (.move .left 73)
    (.unary 73
      (.move .left 72)
      (.unary 72
        (.move .left 71)
        (.unary 71
          (.move .left 70)
          (.unary 70
            (.move .left 69)
            trace_355_69
          )
        )
      )
    )
  )
noncomputable def trace_355_79 : NumericTreePilot.Trace :=
  (.unary 79
    (.move .left 78)
    (.unary 78
      (.move .left 77)
      (.unary 77
        (.move .left 76)
        (.unary 76
          (.move .left 75)
          (.unary 75
            (.move .left 74)
            trace_355_74
          )
        )
      )
    )
  )
noncomputable def trace_355_84 : NumericTreePilot.Trace :=
  (.unary 84
    (.move .left 83)
    (.unary 83
      (.move .left 82)
      (.unary 82
        (.load
          ⟨#[
            ⟨2, by decide +kernel⟩,
            ⟨2, by decide +kernel⟩,
            ⟨2, by decide +kernel⟩,
            ⟨2, by decide +kernel⟩,
            ⟨2, by decide +kernel⟩,
            ⟨2, by decide +kernel⟩,
            ⟨2, by decide +kernel⟩,
            ⟨2, by decide +kernel⟩,
            ⟨2, by decide +kernel⟩,
            ⟨2, by decide +kernel⟩], rfl⟩
          81
        )
        (.leaf 81
          (.go
            ⟨#[
              ⟨354, by decide +kernel⟩,
              ⟨354, by decide +kernel⟩,
              ⟨354, by decide +kernel⟩,
              ⟨354, by decide +kernel⟩,
              ⟨354, by decide +kernel⟩,
              ⟨354, by decide +kernel⟩,
              ⟨354, by decide +kernel⟩,
              ⟨354, by decide +kernel⟩,
              ⟨354, by decide +kernel⟩,
              ⟨354, by decide +kernel⟩], rfl⟩
          )
        )
      )
    )
  )
noncomputable def trace_355_89 : NumericTreePilot.Trace :=
  (.unary 89
    (.move .left 88)
    (.unary 88
      (.move .left 87)
      (.unary 87
        (.move .left 86)
        (.unary 86
          (.move .left 85)
          (.unary 85
            (.move .left 84)
            trace_355_84
          )
        )
      )
    )
  )
noncomputable def trace_355_94 : NumericTreePilot.Trace :=
  (.unary 94
    (.move .left 93)
    (.unary 93
      (.move .left 92)
      (.unary 92
        (.move .left 91)
        (.unary 91
          (.move .left 90)
          (.unary 90
            (.move .left 89)
            trace_355_89
          )
        )
      )
    )
  )
noncomputable def trace_355_101 : NumericTreePilot.Trace :=
  (.unary 101
    (.move .left 100)
    (.unary 100
      (.move .left 99)
      (.unary 99
        (.load
          ⟨#[
            ⟨4, by decide +kernel⟩,
            ⟨4, by decide +kernel⟩,
            ⟨4, by decide +kernel⟩,
            ⟨4, by decide +kernel⟩,
            ⟨4, by decide +kernel⟩,
            ⟨4, by decide +kernel⟩,
            ⟨4, by decide +kernel⟩,
            ⟨4, by decide +kernel⟩,
            ⟨4, by decide +kernel⟩,
            ⟨4, by decide +kernel⟩], rfl⟩
          98
        )
        (.leaf 98
          (.go
            ⟨#[
              ⟨354, by decide +kernel⟩,
              ⟨354, by decide +kernel⟩,
              ⟨354, by decide +kernel⟩,
              ⟨354, by decide +kernel⟩,
              ⟨354, by decide +kernel⟩,
              ⟨354, by decide +kernel⟩,
              ⟨354, by decide +kernel⟩,
              ⟨354, by decide +kernel⟩,
              ⟨354, by decide +kernel⟩,
              ⟨354, by decide +kernel⟩], rfl⟩
          )
        )
      )
    )
  )
noncomputable def trace_355_106 : NumericTreePilot.Trace :=
  (.unary 106
    (.move .left 105)
    (.unary 105
      (.move .left 104)
      (.unary 104
        (.move .left 103)
        (.unary 103
          (.move .left 102)
          (.unary 102
            (.move .left 101)
            trace_355_101
          )
        )
      )
    )
  )
noncomputable def trace_355_111 : NumericTreePilot.Trace :=
  (.unary 111
    (.move .left 110)
    (.unary 110
      (.move .left 109)
      (.unary 109
        (.move .left 108)
        (.unary 108
          (.move .left 107)
          (.unary 107
            (.move .left 106)
            trace_355_106
          )
        )
      )
    )
  )
noncomputable def trace_355_116 : NumericTreePilot.Trace :=
  (.unary 116
    (.move .left 115)
    (.unary 115
      (.move .left 114)
      (.unary 114
        (.load
          ⟨#[
            ⟨0, by decide +kernel⟩,
            ⟨0, by decide +kernel⟩,
            ⟨0, by decide +kernel⟩,
            ⟨0, by decide +kernel⟩,
            ⟨0, by decide +kernel⟩,
            ⟨0, by decide +kernel⟩,
            ⟨0, by decide +kernel⟩,
            ⟨0, by decide +kernel⟩,
            ⟨0, by decide +kernel⟩,
            ⟨0, by decide +kernel⟩], rfl⟩
          113
        )
        (.leaf 113
          (.go
            ⟨#[
              ⟨354, by decide +kernel⟩,
              ⟨354, by decide +kernel⟩,
              ⟨354, by decide +kernel⟩,
              ⟨354, by decide +kernel⟩,
              ⟨354, by decide +kernel⟩,
              ⟨354, by decide +kernel⟩,
              ⟨354, by decide +kernel⟩,
              ⟨354, by decide +kernel⟩,
              ⟨354, by decide +kernel⟩,
              ⟨354, by decide +kernel⟩], rfl⟩
          )
        )
      )
    )
  )
noncomputable def trace_355_121 : NumericTreePilot.Trace :=
  (.unary 121
    (.move .left 120)
    (.unary 120
      (.move .left 119)
      (.unary 119
        (.move .left 118)
        (.unary 118
          (.move .left 117)
          (.unary 117
            (.move .left 116)
            trace_355_116
          )
        )
      )
    )
  )
noncomputable def trace_355_126 : NumericTreePilot.Trace :=
  (.unary 126
    (.move .left 125)
    (.unary 125
      (.move .left 124)
      (.unary 124
        (.move .left 123)
        (.unary 123
          (.move .left 122)
          (.unary 122
            (.move .left 121)
            trace_355_121
          )
        )
      )
    )
  )
noncomputable def trace_355_131 : NumericTreePilot.Trace :=
  (.unary 131
    (.move .right 130)
    (.branch 130
      (.branch
        ⟨#[
          false,
          false,
          false,
          false,
          false,
          true,
          true,
          true,
          true,
          true], rfl⟩
        97
        129
      )
      (.unary 97
        (.move .right 96)
        (.branch 96
          (.branch
            ⟨#[
              false,
              false,
              false,
              false,
              false,
              true,
              true,
              true,
              true,
              true], rfl⟩
            80
            95
          )
          (.unary 80
            (.move .right 79)
            trace_355_79
          )
          (.unary 95
            (.move .right 94)
            trace_355_94
          )
        )
      )
      (.unary 129
        (.move .right 128)
        (.branch 128
          (.branch
            ⟨#[
              false,
              false,
              false,
              false,
              false,
              true,
              true,
              true,
              true,
              true], rfl⟩
            112
            127
          )
          (.unary 112
            (.move .right 111)
            trace_355_111
          )
          (.unary 127
            (.move .right 126)
            trace_355_126
          )
        )
      )
    )
  )
noncomputable def trace_355_136 : NumericTreePilot.Trace :=
  (.unary 136
    (.move .right 135)
    (.unary 135
      (.move .right 134)
      (.unary 134
        (.move .right 133)
        (.unary 133
          (.move .right 132)
          (.branch 132
            (.branch
              ⟨#[
                false,
                false,
                false,
                false,
                false,
                true,
                true,
                true,
                true,
                true], rfl⟩
              65
              131
            )
            trace_355_65
            trace_355_131
          )
        )
      )
    )
  )
noncomputable def trace_355_141 : NumericTreePilot.Trace :=
  (.unary 141
    (.move .right 140)
    (.unary 140
      (.move .right 139)
      (.unary 139
        (.move .right 138)
        (.unary 138
          (.move .right 137)
          (.unary 137
            (.move .right 136)
            trace_355_136
          )
        )
      )
    )
  )
noncomputable def fragment_355 : NumericTreePilot.Fragment :=
  ⟨142, 141, trace_355_141,
    []⟩
def label_445 : Fin 4042 := ⟨445, by decide +kernel⟩
noncomputable def raw_445 : RawOp :=
  RawOp.write
    bounded_4_3
    ⟨#[
      bounded_5_1,
      bounded_5_1,
      bounded_5_2,
      bounded_5_3,
      bounded_5_4
    ], rfl⟩
    441
noncomputable def syntax_445 : Syntax 4042 :=
  SourceRecipePilot.syntaxOf raw_445
noncomputable def trace_445_1 : NumericTreePilot.Trace :=
  (.unary 1
    (.move .left 0)
    (.leaf 0
      (.go
        ⟨#[
          ⟨441, by decide +kernel⟩,
          ⟨441, by decide +kernel⟩,
          ⟨441, by decide +kernel⟩,
          ⟨441, by decide +kernel⟩,
          ⟨441, by decide +kernel⟩,
          ⟨441, by decide +kernel⟩,
          ⟨441, by decide +kernel⟩,
          ⟨441, by decide +kernel⟩,
          ⟨441, by decide +kernel⟩,
          ⟨441, by decide +kernel⟩], rfl⟩
      )
    )
  )
noncomputable def trace_445_6 : NumericTreePilot.Trace :=
  (.unary 6
    (.move .left 5)
    (.unary 5
      (.move .left 4)
      (.unary 4
        (.move .left 3)
        (.unary 3
          (.move .left 2)
          (.unary 2
            (.move .left 1)
            trace_445_1
          )
        )
      )
    )
  )
noncomputable def trace_445_11 : NumericTreePilot.Trace :=
  (.unary 11
    (.move .left 10)
    (.unary 10
      (.move .left 9)
      (.unary 9
        (.move .left 8)
        (.unary 8
          (.move .left 7)
          (.unary 7
            (.move .left 6)
            trace_445_6
          )
        )
      )
    )
  )
noncomputable def trace_445_16 : NumericTreePilot.Trace :=
  (.unary 16
    (.write
      ⟨#[
        true,
        true,
        true,
        true,
        true,
        true,
        true,
        true,
        true,
        true], rfl⟩
      15
    )
    (.unary 15
      (.move .right 14)
      (.unary 14
        (.write
          ⟨#[
            false,
            false,
            false,
            false,
            false,
            false,
            false,
            false,
            false,
            false], rfl⟩
          13
        )
        (.unary 13
          (.move .right 12)
          (.unary 12
            (.write
              ⟨#[
                false,
                false,
                false,
                false,
                false,
                false,
                false,
                false,
                false,
                false], rfl⟩
              11
            )
            trace_445_11
          )
        )
      )
    )
  )
noncomputable def trace_445_21 : NumericTreePilot.Trace :=
  (.unary 21
    (.move .right 20)
    (.unary 20
      (.move .right 19)
      (.unary 19
        (.move .right 18)
        (.unary 18
          (.move .right 17)
          (.unary 17
            (.move .right 16)
            trace_445_16
          )
        )
      )
    )
  )
noncomputable def trace_445_28 : NumericTreePilot.Trace :=
  (.unary 28
    (.move .left 27)
    (.unary 27
      (.move .left 26)
      (.leaf 26
        (.go
          ⟨#[
            ⟨441, by decide +kernel⟩,
            ⟨441, by decide +kernel⟩,
            ⟨441, by decide +kernel⟩,
            ⟨441, by decide +kernel⟩,
            ⟨441, by decide +kernel⟩,
            ⟨441, by decide +kernel⟩,
            ⟨441, by decide +kernel⟩,
            ⟨441, by decide +kernel⟩,
            ⟨441, by decide +kernel⟩,
            ⟨441, by decide +kernel⟩], rfl⟩
        )
      )
    )
  )
noncomputable def trace_445_33 : NumericTreePilot.Trace :=
  (.unary 33
    (.move .left 32)
    (.unary 32
      (.move .left 31)
      (.unary 31
        (.move .left 30)
        (.unary 30
          (.move .left 29)
          (.unary 29
            (.move .left 28)
            trace_445_28
          )
        )
      )
    )
  )
noncomputable def trace_445_38 : NumericTreePilot.Trace :=
  (.unary 38
    (.write
      ⟨#[
        false,
        false,
        false,
        false,
        false,
        false,
        false,
        false,
        false,
        false], rfl⟩
      37
    )
    (.unary 37
      (.move .left 36)
      (.unary 36
        (.move .left 35)
        (.unary 35
          (.move .left 34)
          (.unary 34
            (.move .left 33)
            trace_445_33
          )
        )
      )
    )
  )
noncomputable def trace_445_43 : NumericTreePilot.Trace :=
  (.unary 43
    (.move .right 42)
    (.unary 42
      (.write
        ⟨#[
          true,
          true,
          true,
          true,
          true,
          true,
          true,
          true,
          true,
          true], rfl⟩
        41
      )
      (.unary 41
        (.move .right 40)
        (.unary 40
          (.write
            ⟨#[
              false,
              false,
              false,
              false,
              false,
              false,
              false,
              false,
              false,
              false], rfl⟩
            39
          )
          (.unary 39
            (.move .right 38)
            trace_445_38
          )
        )
      )
    )
  )
noncomputable def trace_445_48 : NumericTreePilot.Trace :=
  (.unary 48
    (.move .right 47)
    (.unary 47
      (.move .right 46)
      (.unary 46
        (.move .right 45)
        (.unary 45
          (.move .right 44)
          (.unary 44
            (.move .right 43)
            trace_445_43
          )
        )
      )
    )
  )
noncomputable def trace_445_55 : NumericTreePilot.Trace :=
  (.unary 55
    (.move .left 54)
    (.unary 54
      (.move .left 53)
      (.unary 53
        (.move .left 52)
        (.leaf 52
          (.go
            ⟨#[
              ⟨441, by decide +kernel⟩,
              ⟨441, by decide +kernel⟩,
              ⟨441, by decide +kernel⟩,
              ⟨441, by decide +kernel⟩,
              ⟨441, by decide +kernel⟩,
              ⟨441, by decide +kernel⟩,
              ⟨441, by decide +kernel⟩,
              ⟨441, by decide +kernel⟩,
              ⟨441, by decide +kernel⟩,
              ⟨441, by decide +kernel⟩], rfl⟩
          )
        )
      )
    )
  )
noncomputable def trace_445_60 : NumericTreePilot.Trace :=
  (.unary 60
    (.move .left 59)
    (.unary 59
      (.move .left 58)
      (.unary 58
        (.move .left 57)
        (.unary 57
          (.move .left 56)
          (.unary 56
            (.move .left 55)
            trace_445_55
          )
        )
      )
    )
  )
noncomputable def trace_445_65 : NumericTreePilot.Trace :=
  (.unary 65
    (.move .right 64)
    (.unary 64
      (.write
        ⟨#[
          false,
          false,
          false,
          false,
          false,
          false,
          false,
          false,
          false,
          false], rfl⟩
        63
      )
      (.unary 63
        (.move .left 62)
        (.unary 62
          (.move .left 61)
          (.unary 61
            (.move .left 60)
            trace_445_60
          )
        )
      )
    )
  )
noncomputable def trace_445_70 : NumericTreePilot.Trace :=
  (.unary 70
    (.move .right 69)
    (.unary 69
      (.move .right 68)
      (.unary 68
        (.write
          ⟨#[
            false,
            false,
            false,
            false,
            false,
            false,
            false,
            false,
            false,
            false], rfl⟩
          67
        )
        (.unary 67
          (.move .right 66)
          (.unary 66
            (.write
              ⟨#[
                true,
                true,
                true,
                true,
                true,
                true,
                true,
                true,
                true,
                true], rfl⟩
              65
            )
            trace_445_65
          )
        )
      )
    )
  )
noncomputable def trace_445_75 : NumericTreePilot.Trace :=
  (.unary 75
    (.move .right 74)
    (.unary 74
      (.move .right 73)
      (.unary 73
        (.move .right 72)
        (.unary 72
          (.move .right 71)
          (.unary 71
            (.move .right 70)
            trace_445_70
          )
        )
      )
    )
  )
noncomputable def trace_445_82 : NumericTreePilot.Trace :=
  (.unary 82
    (.move .left 81)
    (.unary 81
      (.move .left 80)
      (.unary 80
        (.move .left 79)
        (.unary 79
          (.move .left 78)
          (.leaf 78
            (.go
              ⟨#[
                ⟨441, by decide +kernel⟩,
                ⟨441, by decide +kernel⟩,
                ⟨441, by decide +kernel⟩,
                ⟨441, by decide +kernel⟩,
                ⟨441, by decide +kernel⟩,
                ⟨441, by decide +kernel⟩,
                ⟨441, by decide +kernel⟩,
                ⟨441, by decide +kernel⟩,
                ⟨441, by decide +kernel⟩,
                ⟨441, by decide +kernel⟩], rfl⟩
            )
          )
        )
      )
    )
  )
noncomputable def trace_445_87 : NumericTreePilot.Trace :=
  (.unary 87
    (.move .left 86)
    (.unary 86
      (.move .left 85)
      (.unary 85
        (.move .left 84)
        (.unary 84
          (.move .left 83)
          (.unary 83
            (.move .left 82)
            trace_445_82
          )
        )
      )
    )
  )
noncomputable def trace_445_92 : NumericTreePilot.Trace :=
  (.unary 92
    (.write
      ⟨#[
        true,
        true,
        true,
        true,
        true,
        true,
        true,
        true,
        true,
        true], rfl⟩
      91
    )
    (.unary 91
      (.move .right 90)
      (.unary 90
        (.write
          ⟨#[
            false,
            false,
            false,
            false,
            false,
            false,
            false,
            false,
            false,
            false], rfl⟩
          89
        )
        (.unary 89
          (.move .left 88)
          (.unary 88
            (.move .left 87)
            trace_445_87
          )
        )
      )
    )
  )
noncomputable def trace_445_97 : NumericTreePilot.Trace :=
  (.unary 97
    (.move .right 96)
    (.unary 96
      (.move .right 95)
      (.unary 95
        (.move .right 94)
        (.unary 94
          (.write
            ⟨#[
              true,
              true,
              true,
              true,
              true,
              true,
              true,
              true,
              true,
              true], rfl⟩
            93
          )
          (.unary 93
            (.move .right 92)
            trace_445_92
          )
        )
      )
    )
  )
noncomputable def trace_445_102 : NumericTreePilot.Trace :=
  (.unary 102
    (.move .right 101)
    (.unary 101
      (.move .right 100)
      (.unary 100
        (.move .right 99)
        (.unary 99
          (.move .right 98)
          (.unary 98
            (.move .right 97)
            trace_445_97
          )
        )
      )
    )
  )
noncomputable def trace_445_108 : NumericTreePilot.Trace :=
  (.unary 108
    (.move .left 107)
    (.unary 107
      (.move .left 106)
      (.unary 106
        (.move .left 105)
        (.unary 105
          (.move .left 104)
          (.leaf 104
            (.go
              ⟨#[
                ⟨441, by decide +kernel⟩,
                ⟨441, by decide +kernel⟩,
                ⟨441, by decide +kernel⟩,
                ⟨441, by decide +kernel⟩,
                ⟨441, by decide +kernel⟩,
                ⟨441, by decide +kernel⟩,
                ⟨441, by decide +kernel⟩,
                ⟨441, by decide +kernel⟩,
                ⟨441, by decide +kernel⟩,
                ⟨441, by decide +kernel⟩], rfl⟩
            )
          )
        )
      )
    )
  )
noncomputable def trace_445_113 : NumericTreePilot.Trace :=
  (.unary 113
    (.move .left 112)
    (.unary 112
      (.move .left 111)
      (.unary 111
        (.move .left 110)
        (.unary 110
          (.move .left 109)
          (.unary 109
            (.move .left 108)
            trace_445_108
          )
        )
      )
    )
  )
noncomputable def trace_445_118 : NumericTreePilot.Trace :=
  (.unary 118
    (.write
      ⟨#[
        false,
        false,
        false,
        false,
        false,
        false,
        false,
        false,
        false,
        false], rfl⟩
      117
    )
    (.unary 117
      (.move .right 116)
      (.unary 116
        (.write
          ⟨#[
            true,
            true,
            true,
            true,
            true,
            true,
            true,
            true,
            true,
            true], rfl⟩
          115
        )
        (.unary 115
          (.move .left 114)
          (.unary 114
            (.move .left 113)
            trace_445_113
          )
        )
      )
    )
  )
noncomputable def trace_445_123 : NumericTreePilot.Trace :=
  (.unary 123
    (.move .right 122)
    (.unary 122
      (.move .right 121)
      (.unary 121
        (.move .right 120)
        (.unary 120
          (.write
            ⟨#[
              false,
              false,
              false,
              false,
              false,
              false,
              false,
              false,
              false,
              false], rfl⟩
            119
          )
          (.unary 119
            (.move .right 118)
            trace_445_118
          )
        )
      )
    )
  )
noncomputable def trace_445_128 : NumericTreePilot.Trace :=
  (.unary 128
    (.move .right 127)
    (.unary 127
      (.move .right 126)
      (.unary 126
        (.move .right 125)
        (.unary 125
          (.move .right 124)
          (.unary 124
            (.move .right 123)
            trace_445_123
          )
        )
      )
    )
  )
noncomputable def trace_445_133 : NumericTreePilot.Trace :=
  (.branch 133
    (.branch
      ⟨#[
        true,
        false,
        false,
        false,
        false,
        true,
        false,
        false,
        false,
        false], rfl⟩
      25
      132
    )
    (.unary 25
      (.move .right 24)
      (.unary 24
        (.move .right 23)
        (.unary 23
          (.move .right 22)
          (.unary 22
            (.move .right 21)
            trace_445_21
          )
        )
      )
    )
    (.branch 132
      (.branch
        ⟨#[
          false,
          true,
          false,
          false,
          false,
          false,
          true,
          false,
          false,
          false], rfl⟩
        51
        131
      )
      (.unary 51
        (.move .right 50)
        (.unary 50
          (.move .right 49)
          (.unary 49
            (.move .right 48)
            trace_445_48
          )
        )
      )
      (.branch 131
        (.branch
          ⟨#[
            false,
            false,
            true,
            false,
            false,
            false,
            false,
            true,
            false,
            false], rfl⟩
          77
          130
        )
        (.unary 77
          (.move .right 76)
          (.unary 76
            (.move .right 75)
            trace_445_75
          )
        )
        (.branch 130
          (.branch
            ⟨#[
              false,
              false,
              false,
              true,
              false,
              false,
              false,
              false,
              true,
              false], rfl⟩
            103
            129
          )
          (.unary 103
            (.move .right 102)
            trace_445_102
          )
          (.unary 129
            (.move .right 128)
            trace_445_128
          )
        )
      )
    )
  )
noncomputable def fragment_445 : NumericTreePilot.Fragment :=
  ⟨134, 133, trace_445_133,
    [
      15,
      13,
      11,
      41,
      39,
      37,
      67,
      65,
      63,
      93,
      91,
      89,
      119,
      117,
      115]⟩
def label_356 : Fin 4042 := ⟨356, by decide +kernel⟩
noncomputable def raw_356 : RawOp :=
  RawOp.move
    Dir.left
    355
noncomputable def syntax_356 : Syntax 4042 :=
  SourceRecipePilot.syntaxOf raw_356
noncomputable def trace_356_3 : NumericTreePilot.Trace :=
  (.unary 3
    (.move .left 2)
    (.unary 2
      (.move .left 1)
      (.unary 1
        (.move .left 0)
        (.leaf 0
          (.go
            ⟨#[
              ⟨355, by decide +kernel⟩,
              ⟨355, by decide +kernel⟩,
              ⟨355, by decide +kernel⟩,
              ⟨355, by decide +kernel⟩,
              ⟨355, by decide +kernel⟩,
              ⟨355, by decide +kernel⟩,
              ⟨355, by decide +kernel⟩,
              ⟨355, by decide +kernel⟩,
              ⟨355, by decide +kernel⟩,
              ⟨355, by decide +kernel⟩], rfl⟩
          )
        )
      )
    )
  )
noncomputable def trace_356_8 : NumericTreePilot.Trace :=
  (.unary 8
    (.move .left 7)
    (.unary 7
      (.move .left 6)
      (.unary 6
        (.move .left 5)
        (.unary 5
          (.move .left 4)
          (.unary 4
            (.move .left 3)
            trace_356_3
          )
        )
      )
    )
  )
noncomputable def trace_356_13 : NumericTreePilot.Trace :=
  (.unary 13
    (.move .left 12)
    (.unary 12
      (.move .left 11)
      (.unary 11
        (.move .left 10)
        (.unary 10
          (.move .left 9)
          (.unary 9
            (.move .left 8)
            trace_356_8
          )
        )
      )
    )
  )
noncomputable def fragment_356 : NumericTreePilot.Fragment :=
  ⟨14, 13, trace_356_13,
    []⟩
noncomputable def bad_callback_355 : RawOp :=
  RawOp.load
    bounded_4_3
    ⟨#[
      ⟨#[
        bounded_5_1,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩
    ], rfl⟩
    354
noncomputable def bad_targets_445 : NumericTreePilot.Fragment :=
  { fragment_445 with targets :=
    [
      16,
      13,
      11,
      41,
      39,
      37,
      67,
      65,
      63,
      93,
      91,
      89,
      119,
      117,
      115] }
noncomputable def bad_write_445 : NumericTreePilot.Node :=
  (.write
    ⟨#[
      true,
      false,
      false,
      false,
      false,
      false,
      false,
      false,
      false,
      false], rfl⟩
    11
  )
end NumericActualDataPilot

end Chess.Optimisation.BodyCertificatePilot
run_cmd Lean.logInfo "Untrusted numeric actual-source literals loaded"

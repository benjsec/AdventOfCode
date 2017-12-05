import sequtils
import strutils


const
    test_input: string = "0 3 0 1 -3"

proc count_steps(input: string): int =
    var 
        instr: seq[int] = splitWhitespace(input).mapIt(parseInt(it))
        idx: int = 0
        tmp_idx: int
        steps: int = 0

    while idx in 0..<len(instr):
        tmp_idx = instr[idx]
        # echo "idx: ", idx, "    steps: ", steps, "    instr: ", tmp_idx
        instr[idx] += 1
        idx = idx + tmp_idx
        steps += 1

    return steps

assert count_steps(test_input) == 5

echo "Total number of steps is ", count_steps(test_input)
# Advent of Code 2017 Day 6 Part 1

import sequtils
import strutils


proc dist_blocks(mem: seq[int]): seq[int] = 

    var 
        mutable: seq[int] = mem
        blocks: int = max(mem)
        idx: int = mem.find(blocks)

    # echo mutable
    # echo "Blocks: ", blocks
    # echo "Start index:", idx

    mutable[idx] = 0

    while blocks > 0:
        idx += 1
        if idx > high(mutable):
            idx = 0
        mutable[idx] = mutable[idx] + 1
        blocks -= 1
    return mutable

proc calc_steps(input: string): int =
    var
        current: seq[int] = map(splitWhitespace(input), proc(x: string): int = parseInt(x))
        memory: seq[seq[int]] = newSeq[seq[int]]()

    for i in 1..100000:
        # Use for loop to provide a top limit
        memory.add(current)
        current = dist_blocks(current)
        if memory.contains(current):
            return i
    return -1


assert calc_steps("0 2 7 0") == 5

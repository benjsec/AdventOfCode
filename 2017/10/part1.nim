# Advent of Code Day 10 part 1 - hex grid

import strutils
import math

proc calc_steps(input: string): int =
    var
        north, west: int = 0
    for step in input.split(","):
        case step:
            of "n":
                north += 2
            of "nw":
                north += 1
                west += 1
            of "sw":
                north -= 1
                west += 1
            of "s":
                north -= 2
            of "se":
                north -= 1
                west -= 1
            of "ne":
                north += 1
                west -= 1
            else:
                discard
        return abs(north) + abs(west)

echo calc_steps("nw, nw, nw")
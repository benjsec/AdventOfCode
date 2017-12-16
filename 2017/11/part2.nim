# Advent of Code Day 10 part 1 - hex grid

# With thanks to http://devmag.org.za/2013/08/31/geometry-with-hex-coordinates/
# for helping me understand hex grid coordinates


import sequtils
import strutils


proc `+`(s1: seq[int], s2: seq[int]): seq[int] =
    assert len(s1) == len(s2)
    result = newSeqWith(len(s1), 0)
    for idx in low(s1)..high(s1):
        result[idx] = s1[idx] + s2[idx]


proc calc_steps(input: string): int =
    var
        coords: seq[int] = @[0, 0, 0]
    for step in input.split(","):
        case step.strip():
            of "n":
                coords = coords + @[1, 0, 0]
            of "ne":
                coords = coords + @[1, -1, 0]
            of "se":
                coords = coords + @[0, -1, 0]
            of "s":
                coords = coords + @[-1, 0, 0]
            of "sw":
                coords = coords + @[-1, 1, 0]
            of "nw":
                coords = coords + @[0, 1, 0]
            else:
                discard
        coords[2] = -(coords[0] + coords[1])
        result = max(result, toInt((abs(coords[0]) + abs(coords[1]) + abs(coords[2]) ) / 2))

echo calc_steps("nw, nw, nw") == 3
echo calc_steps("ne,ne,sw,sw") == 2
echo calc_steps("ne,ne,s,s") == 2
echo calc_steps("se,sw,se,sw,sw") == 3

var puzzle: string = """se,s,ne,sw,sw,sw,sw,sw,ne,sw,nw,nw,nw,nw,ne,n,nw,nw,n,sw,n,n,n,n,n,ne,nw,ne,n,sw,n,ne,ne,ne,ne,sw,ne,nw,n,ne,ne,ne,sw,ne,ne,s,se,ne,se,se,se,s,se,se,se,se,se,se,se,se,ne,se,se,ne,se,s,s,se,se,se,s,se,s,s,se,s,s,s,s,se,ne,se,se,s,s,sw,s,s,n,sw,s,s,s,s,s,s,s,s,s,s,s,s,s,sw,s,s,s,s,s,n,s,nw,s,s,s,s,s,se,s,sw,se,sw,s,sw,sw,nw,s,s,se,s,s,s,sw,s,se,sw,sw,sw,sw,ne,s,sw,sw,s,sw,nw,sw,sw,sw,sw,s,sw,sw,sw,se,sw,sw,sw,s,sw,n,sw,sw,s,nw,sw,sw,ne,n,se,sw,sw,sw,nw,sw,n,nw,sw,nw,se,sw,sw,nw,sw,n,sw,sw,nw,sw,sw,nw,n,nw,nw,nw,n,n,nw,sw,n,nw,se,nw,nw,nw,n,sw,nw,nw,nw,ne,sw,nw,s,nw,nw,nw,nw,nw,nw,nw,nw,ne,n,nw,nw,nw,se,nw,n,nw,nw,se,nw,nw,nw,nw,nw,nw,nw,nw,nw,nw,nw,nw,nw,se,nw,nw,n,s,se,s,s,s,n,n,n,ne,nw,n,s,n,n,nw,nw,n,n,nw,nw,n,n,n,nw,n,n,n,nw,n,n,nw,n,n,n,nw,nw,n,se,n,nw,n,s,nw,se,se,nw,nw,n,n,nw,n,nw,nw,nw,nw,n,n,nw,n,ne,n,n,n,n,n,n,n,n,n,n,n,n,s,n,se,n,n,ne,se,n,n,n,ne,n,n,n,n,s,n,ne,n,ne,ne,n,n,se,nw,n,se,n,n,ne,n,n,n,n,n,ne,sw,nw,n,sw,ne,n,n,n,n,sw,n,n,sw,n,n,n,ne,n,n,n,nw,sw,ne,nw,n,s,s,nw,nw,n,sw,n,sw,ne,ne,ne,ne,ne,nw,n,n,nw,n,ne,se,ne,ne,s,se,n,n,n,n,ne,n,s,n,ne,s,n,ne,ne,ne,n,ne,n,n,se,n,se,n,ne,ne,n,n,se,ne,ne,ne,n,ne,ne,ne,ne,ne,ne,ne,ne,n,se,n,ne,ne,ne,ne,ne,se,ne,ne,ne,ne,ne,ne,ne,ne,ne,ne,ne,ne,s,ne,sw,n,ne,ne,ne,ne,ne,sw,se,n,ne,n,n,ne,se,n,ne,s,ne,se,ne,ne,ne,s,s,nw,ne,se,sw,ne,ne,ne,ne,ne,ne,ne,se,se,nw,ne,ne,ne,s,ne,ne,ne,ne,ne,n,ne,ne,ne,se,ne,ne,sw,ne,se,ne,sw,ne,se,s,se,ne,ne,se,se,ne,sw,se,ne,ne,ne,se,sw,ne,ne,ne,ne,se,ne,n,se,ne,se,ne,se,se,se,ne,n,se,sw,se,ne,sw,ne,ne,ne,ne,ne,ne,se,se,ne,ne,s,ne,se,se,se,ne,se,se,se,sw,se,n,se,se,se,n,se,ne,se,n,se,se,se,ne,ne,sw,s,se,ne,nw,se,s,ne,ne,se,sw,ne,nw,s,se,ne,se,se,s,nw,ne,ne,se,se,s,nw,ne,ne,se,ne,nw,ne,se,nw,ne,se,s,s,n,se,se,ne,ne,ne,se,s,se,se,s,se,se,se,se,se,se,se,se,se,se,ne,se,se,n,se,nw,sw,se,se,se,ne,nw,ne,s,se,se,se,se,se,se,se,se,ne,se,se,se,se,se,se,s,se,se,se,se,n,se,se,sw,se,se,se,se,se,se,se,se,se,n,se,ne,sw,nw,se,se,se,se,se,s,se,se,s,se,se,se,se,se,se,s,s,se,sw,n,se,s,se,se,s,s,n,se,nw,se,se,se,se,se,s,sw,se,se,se,s,se,se,sw,se,ne,s,se,se,ne,se,se,s,se,s,se,n,se,s,s,se,se,s,s,se,se,se,s,s,se,nw,sw,n,se,se,s,se,s,s,s,s,se,se,se,s,sw,se,se,se,se,ne,s,se,se,n,nw,se,s,ne,s,se,se,se,n,n,se,se,s,s,sw,se,n,s,se,nw,s,ne,s,s,s,sw,se,s,se,s,s,s,ne,s,s,s,s,se,s,s,se,n,s,nw,se,s,sw,s,s,sw,s,s,nw,se,nw,s,se,nw,s,s,se,se,se,s,se,n,se,s,se,s,se,s,s,s,s,nw,s,n,s,s,sw,s,se,s,s,s,s,ne,s,n,s,s,s,s,se,s,s,se,s,nw,se,s,nw,se,s,s,s,s,nw,s,s,s,s,s,s,se,se,s,s,s,s,s,s,s,s,s,sw,se,n,s,n,s,nw,se,s,s,s,s,nw,s,ne,sw,s,sw,s,s,ne,n,s,n,sw,s,s,s,s,s,s,s,nw,sw,n,n,n,s,s,ne,s,s,s,s,s,s,s,s,sw,s,s,s,ne,ne,s,s,s,s,s,s,s,s,s,s,s,s,ne,nw,s,s,s,s,se,s,s,s,s,s,s,s,s,se,se,sw,nw,sw,s,s,n,s,s,sw,s,sw,s,se,s,n,sw,s,s,ne,sw,ne,se,s,s,s,s,nw,sw,s,s,s,s,s,s,s,s,s,se,ne,n,n,s,s,s,s,sw,s,s,s,s,s,s,s,sw,s,s,sw,nw,sw,ne,s,s,sw,s,ne,ne,se,sw,s,s,sw,s,s,sw,s,sw,n,s,s,s,s,n,s,s,s,s,s,s,s,s,ne,sw,s,n,ne,s,s,sw,s,s,sw,s,s,sw,s,nw,s,s,sw,se,s,s,sw,se,s,s,sw,s,sw,sw,s,s,s,s,sw,nw,sw,sw,sw,s,sw,sw,sw,sw,sw,s,sw,nw,ne,sw,sw,n,s,se,s,s,s,s,sw,s,s,s,s,ne,s,s,s,sw,sw,s,s,s,s,n,sw,sw,s,sw,s,sw,sw,sw,sw,se,sw,sw,s,s,sw,s,s,n,sw,sw,s,sw,s,s,s,s,sw,sw,s,sw,sw,s,sw,sw,ne,sw,sw,ne,s,sw,sw,sw,s,sw,ne,sw,sw,sw,sw,ne,sw,s,sw,sw,s,s,s,sw,s,sw,sw,n,se,s,sw,sw,sw,n,s,s,s,n,s,sw,sw,s,sw,sw,s,ne,sw,ne,sw,sw,s,s,sw,sw,sw,sw,ne,n,s,sw,sw,sw,sw,sw,ne,sw,ne,s,se,sw,sw,sw,se,sw,ne,sw,sw,ne,sw,s,sw,ne,n,sw,sw,sw,nw,sw,n,s,sw,ne,sw,s,sw,sw,s,sw,sw,sw,sw,nw,s,nw,nw,sw,sw,n,n,ne,s,sw,s,sw,sw,sw,sw,sw,sw,sw,sw,sw,s,sw,s,sw,sw,sw,sw,sw,sw,sw,sw,n,sw,sw,n,sw,sw,s,sw,sw,sw,sw,sw,ne,s,sw,sw,sw,sw,sw,sw,sw,sw,sw,sw,sw,sw,sw,se,sw,sw,nw,sw,sw,sw,ne,sw,n,s,ne,n,sw,sw,s,sw,sw,sw,sw,sw,sw,sw,n,sw,sw,sw,sw,sw,s,n,sw,sw,nw,sw,sw,sw,ne,s,sw,sw,sw,sw,nw,nw,sw,nw,nw,sw,sw,nw,sw,sw,sw,sw,sw,nw,nw,nw,n,ne,sw,sw,sw,se,sw,sw,sw,sw,sw,sw,nw,sw,sw,sw,sw,ne,sw,sw,sw,sw,sw,s,nw,sw,sw,sw,nw,nw,nw,sw,sw,sw,sw,sw,se,ne,sw,sw,sw,sw,sw,nw,sw,sw,sw,sw,sw,sw,sw,sw,nw,nw,sw,ne,sw,sw,nw,sw,sw,se,nw,sw,ne,sw,sw,sw,sw,n,sw,sw,sw,sw,sw,sw,nw,s,nw,nw,nw,sw,n,se,sw,ne,s,sw,sw,se,sw,n,sw,sw,sw,sw,nw,sw,sw,sw,nw,sw,sw,sw,nw,ne,sw,n,sw,sw,s,nw,sw,sw,sw,sw,nw,sw,sw,ne,sw,nw,n,ne,n,sw,nw,sw,nw,nw,nw,sw,ne,n,sw,sw,sw,nw,sw,sw,sw,sw,sw,nw,nw,sw,nw,sw,se,sw,s,sw,nw,sw,nw,nw,sw,sw,ne,nw,sw,nw,sw,sw,sw,s,n,nw,nw,sw,sw,s,nw,sw,sw,nw,sw,sw,sw,sw,nw,nw,nw,ne,sw,se,n,n,n,nw,ne,nw,nw,sw,nw,se,nw,sw,n,sw,sw,nw,sw,sw,sw,sw,sw,ne,se,sw,sw,nw,sw,sw,nw,sw,nw,nw,nw,nw,sw,sw,nw,sw,ne,nw,sw,ne,sw,sw,sw,nw,ne,sw,nw,nw,nw,se,se,se,sw,n,nw,nw,nw,sw,sw,se,sw,nw,nw,nw,nw,sw,nw,nw,sw,nw,nw,sw,nw,n,nw,se,nw,nw,nw,nw,se,nw,sw,nw,nw,nw,ne,nw,ne,s,nw,sw,nw,nw,nw,nw,sw,nw,se,nw,sw,nw,s,sw,nw,ne,ne,sw,sw,nw,nw,nw,ne,sw,s,s,ne,nw,nw,n,nw,sw,sw,nw,n,nw,nw,nw,ne,nw,se,sw,nw,s,s,nw,nw,nw,se,sw,nw,s,nw,nw,n,sw,nw,sw,nw,nw,sw,nw,nw,sw,nw,nw,ne,sw,sw,nw,nw,sw,sw,nw,nw,nw,nw,sw,n,s,ne,se,n,nw,sw,sw,s,sw,nw,nw,nw,nw,nw,nw,nw,nw,nw,nw,sw,se,nw,s,nw,nw,sw,nw,se,sw,sw,n,nw,nw,ne,ne,nw,nw,nw,nw,n,nw,nw,nw,nw,nw,nw,nw,sw,nw,nw,nw,nw,nw,nw,sw,nw,nw,sw,nw,nw,s,ne,nw,s,nw,sw,nw,n,s,nw,nw,nw,ne,nw,sw,s,n,nw,n,ne,nw,nw,ne,ne,nw,se,sw,nw,n,nw,sw,nw,nw,nw,n,s,s,nw,ne,nw,s,nw,nw,nw,sw,nw,nw,nw,sw,s,s,ne,nw,ne,sw,sw,sw,nw,ne,nw,sw,nw,nw,se,n,nw,nw,sw,nw,sw,nw,nw,n,nw,n,nw,s,nw,n,sw,nw,nw,nw,nw,nw,nw,nw,nw,se,nw,nw,n,sw,nw,nw,nw,nw,ne,nw,sw,nw,se,nw,nw,nw,nw,ne,nw,nw,nw,nw,ne,s,nw,nw,nw,nw,nw,nw,nw,ne,nw,nw,nw,nw,s,nw,nw,nw,nw,sw,nw,nw,nw,se,nw,nw,nw,nw,nw,nw,nw,n,nw,n,nw,nw,sw,n,nw,nw,nw,nw,nw,nw,s,nw,s,n,se,nw,nw,nw,nw,s,nw,ne,nw,se,n,nw,n,s,nw,nw,sw,nw,nw,nw,nw,nw,sw,nw,nw,nw,nw,nw,nw,nw,nw,n,nw,nw,nw,n,ne,nw,nw,s,nw,nw,nw,nw,sw,nw,nw,nw,n,nw,nw,nw,nw,nw,se,nw,nw,s,se,nw,ne,nw,n,n,s,nw,se,nw,n,nw,nw,nw,nw,sw,nw,nw,n,ne,nw,nw,n,nw,nw,nw,sw,nw,n,ne,se,se,nw,nw,nw,nw,nw,nw,n,n,nw,nw,nw,s,n,nw,nw,nw,nw,nw,n,n,nw,n,nw,nw,n,nw,n,nw,nw,nw,nw,nw,nw,nw,nw,nw,se,n,n,nw,nw,nw,nw,nw,nw,n,n,sw,nw,n,n,nw,sw,n,nw,s,nw,nw,n,nw,nw,nw,se,n,nw,nw,nw,s,n,n,nw,nw,n,n,sw,nw,n,nw,nw,nw,nw,nw,se,n,nw,nw,nw,nw,nw,nw,nw,nw,nw,n,ne,ne,nw,nw,nw,ne,n,nw,se,nw,sw,nw,n,nw,ne,n,nw,n,n,n,n,n,n,n,n,nw,nw,sw,n,n,nw,nw,n,nw,nw,ne,nw,se,s,nw,sw,nw,nw,nw,nw,nw,nw,n,ne,n,nw,n,nw,n,nw,nw,nw,n,nw,nw,nw,nw,nw,s,nw,nw,n,s,se,n,sw,se,n,n,n,n,nw,nw,nw,n,nw,sw,nw,nw,nw,nw,nw,ne,se,n,n,nw,n,nw,nw,n,se,nw,n,n,nw,n,ne,n,nw,n,n,n,ne,ne,n,nw,nw,nw,sw,se,n,n,nw,s,nw,sw,nw,n,nw,n,s,se,n,nw,nw,n,nw,se,n,se,nw,n,se,s,n,nw,nw,n,nw,n,n,ne,nw,n,sw,n,nw,nw,nw,nw,n,n,n,sw,nw,nw,ne,nw,n,nw,n,sw,nw,nw,n,nw,n,n,n,nw,n,n,n,se,nw,nw,n,nw,n,ne,sw,se,nw,nw,nw,ne,nw,n,se,n,nw,n,n,nw,sw,ne,nw,n,n,ne,nw,nw,sw,nw,s,n,nw,n,nw,nw,nw,nw,sw,s,nw,sw,nw,n,n,n,nw,nw,nw,n,n,sw,s,ne,s,nw,n,n,nw,n,n,n,n,n,ne,n,n,nw,n,nw,n,nw,n,n,se,n,ne,n,n,n,nw,sw,n,n,nw,sw,nw,n,n,nw,n,ne,sw,nw,nw,n,n,n,n,sw,n,nw,nw,n,n,n,n,nw,nw,n,nw,n,n,n,ne,sw,n,s,n,n,n,sw,nw,ne,nw,n,n,nw,n,nw,nw,n,s,nw,nw,s,n,ne,nw,n,sw,nw,n,n,n,n,n,ne,n,se,n,n,n,n,n,se,n,nw,n,n,nw,sw,n,nw,n,nw,nw,sw,ne,nw,nw,n,nw,nw,n,n,n,nw,sw,n,n,sw,n,n,se,n,s,n,sw,nw,n,n,nw,se,nw,nw,n,n,n,n,n,nw,nw,n,n,ne,nw,nw,n,n,n,n,sw,n,se,se,n,n,n,nw,ne,n,nw,nw,n,sw,nw,s,n,ne,n,n,n,nw,nw,se,n,n,n,n,nw,n,n,n,n,n,n,n,n,n,n,ne,n,n,n,nw,n,nw,n,nw,n,n,n,n,nw,ne,n,n,nw,s,n,n,nw,sw,n,n,nw,n,n,nw,n,n,n,n,nw,n,n,sw,nw,n,n,n,n,nw,n,n,n,nw,n,n,n,n,n,n,n,n,n,s,n,n,n,nw,n,n,n,n,n,n,n,s,n,n,n,n,s,n,n,n,n,n,sw,n,sw,n,nw,n,ne,sw,n,n,n,n,nw,n,n,n,n,n,n,n,n,n,n,ne,n,sw,n,n,n,n,ne,n,n,n,n,n,n,n,n,n,n,n,n,n,ne,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,sw,n,n,n,n,n,n,n,n,n,n,n,n,s,n,sw,sw,n,n,n,sw,n,se,n,n,n,n,n,se,n,s,n,n,n,n,n,n,n,nw,n,n,n,n,s,ne,n,n,se,n,se,n,n,n,n,n,ne,n,n,n,n,n,nw,n,n,s,n,n,n,ne,n,n,se,n,ne,n,n,n,n,n,n,sw,n,n,se,n,n,n,n,n,n,n,n,n,n,ne,n,nw,ne,n,n,sw,n,n,n,nw,ne,n,n,n,s,ne,n,n,n,n,n,ne,n,n,ne,n,n,n,n,n,se,n,ne,n,n,s,n,n,n,ne,n,n,nw,n,nw,ne,n,se,n,n,n,sw,ne,n,n,n,s,sw,n,n,ne,n,n,n,n,ne,ne,n,s,ne,n,ne,n,nw,n,n,ne,n,n,n,ne,se,n,ne,sw,ne,se,nw,se,n,s,n,n,ne,n,n,se,n,n,ne,n,n,ne,ne,nw,se,n,n,n,n,n,n,n,n,n,ne,nw,ne,s,sw,n,n,n,ne,n,n,n,n,n,ne,ne,n,n,n,n,n,ne,ne,ne,n,se,ne,n,ne,n,n,n,n,n,n,s,n,n,ne,n,n,n,n,sw,se,ne,ne,n,n,se,ne,sw,n,n,ne,n,n,n,n,n,ne,n,n,n,n,n,n,ne,se,s,ne,n,ne,ne,n,n,s,ne,n,s,ne,ne,ne,n,n,n,n,ne,n,n,ne,nw,n,n,n,n,n,n,n,ne,n,n,n,n,nw,n,nw,n,n,n,sw,ne,n,n,ne,ne,n,nw,s,sw,sw,n,n,s,n,n,n,n,n,ne,n,ne,n,n,n,n,ne,n,n,se,ne,sw,nw,n,ne,ne,ne,se,ne,n,ne,n,n,n,n,ne,n,n,n,n,n,n,n,sw,ne,n,nw,ne,n,s,ne,ne,n,ne,n,n,ne,s,n,ne,n,n,ne,se,n,n,n,ne,ne,n,nw,n,n,se,n,n,n,n,se,n,s,s,n,nw,se,ne,se,n,ne,n,n,n,n,n,nw,ne,n,n,n,ne,n,ne,n,n,ne,ne,n,n,ne,n,sw,ne,n,n,n,sw,n,n,ne,ne,n,n,nw,n,n,n,n,n,ne,ne,se,n,nw,n,ne,ne,n,n,n,se,n,ne,sw,n,n,ne,ne,ne,ne,n,n,ne,ne,ne,ne,n,n,sw,n,sw,ne,se,ne,ne,n,ne,nw,n,ne,ne,n,ne,ne,n,n,n,s,ne,ne,n,se,n,ne,nw,sw,nw,se,ne,ne,n,s,sw,ne,ne,s,ne,n,n,ne,n,se,n,sw,ne,n,ne,ne,n,ne,ne,s,s,n,ne,se,n,n,n,ne,sw,n,n,n,sw,n,s,ne,n,nw,ne,s,n,se,ne,n,n,s,ne,ne,ne,se,ne,ne,ne,n,n,n,sw,ne,n,n,ne,n,ne,n,s,ne,n,n,sw,ne,n,sw,s,n,n,s,ne,se,n,nw,n,n,se,ne,se,n,n,s,se,n,ne,n,n,ne,n,ne,sw,ne,n,ne,s,nw,n,n,n,n,ne,ne,n,ne,n,n,n,n,sw,ne,ne,ne,se,ne,sw,n,n,n,sw,sw,n,ne,sw,se,ne,se,ne,nw,ne,n,ne,sw,ne,n,ne,n,ne,n,ne,sw,sw,n,n,s,n,ne,sw,ne,ne,ne,n,ne,n,ne,n,ne,n,n,ne,ne,n,ne,ne,n,ne,se,ne,ne,n,ne,ne,se,ne,ne,ne,se,n,n,ne,ne,se,ne,n,se,n,n,n,ne,ne,n,n,ne,ne,n,n,ne,ne,ne,sw,ne,s,ne,ne,ne,nw,ne,n,ne,ne,nw,n,n,ne,ne,ne,sw,ne,ne,n,nw,ne,n,ne,s,sw,ne,n,n,n,ne,se,ne,ne,ne,n,ne,se,ne,n,sw,n,n,s,ne,ne,se,n,n,ne,ne,ne,s,s,ne,sw,sw,n,ne,se,ne,ne,sw,ne,ne,ne,ne,s,ne,ne,ne,ne,ne,nw,n,ne,ne,sw,ne,ne,n,ne,ne,nw,sw,n,ne,n,n,s,ne,ne,ne,ne,ne,ne,ne,ne,ne,sw,ne,ne,n,ne,ne,ne,se,ne,s,s,s,s,ne,nw,se,n,ne,ne,n,n,ne,n,ne,ne,se,n,n,ne,ne,n,ne,ne,ne,ne,ne,ne,ne,sw,ne,ne,ne,n,nw,se,n,ne,s,ne,s,ne,ne,ne,ne,se,se,sw,sw,ne,ne,ne,ne,ne,sw,n,se,ne,ne,ne,ne,ne,n,ne,s,ne,ne,ne,ne,ne,ne,s,n,ne,ne,ne,n,n,ne,ne,ne,n,ne,ne,ne,ne,ne,ne,ne,n,sw,ne,ne,ne,ne,ne,n,n,s,se,ne,ne,ne,n,s,n,se,ne,ne,s,se,sw,n,ne,ne,se,ne,ne,ne,ne,sw,ne,n,ne,n,ne,ne,ne,n,ne,n,n,n,s,ne,ne,ne,n,ne,nw,se,ne,ne,ne,ne,n,ne,ne,ne,ne,ne,s,ne,ne,ne,ne,n,se,ne,ne,n,ne,nw,ne,n,ne,ne,ne,sw,ne,s,n,nw,ne,sw,ne,sw,nw,ne,se,s,ne,ne,ne,ne,nw,ne,ne,n,ne,se,n,ne,ne,ne,ne,s,nw,ne,n,ne,ne,ne,ne,n,nw,n,n,ne,ne,ne,ne,n,ne,n,ne,ne,ne,ne,ne,nw,ne,se,ne,ne,ne,s,ne,n,ne,ne,sw,ne,ne,n,ne,ne,ne,n,ne,ne,ne,nw,se,n,ne,se,nw,ne,ne,s,ne,ne,ne,ne,ne,ne,sw,ne,ne,ne,s,ne,ne,ne,ne,ne,ne,ne,sw,nw,ne,ne,sw,nw,ne,ne,n,ne,ne,ne,ne,ne,ne,ne,ne,sw,ne,ne,ne,se,ne,ne,ne,sw,ne,nw,ne,ne,se,ne,ne,ne,ne,ne,ne,ne,ne,ne,s,ne,ne,ne,ne,n,ne,nw,ne,ne,nw,ne,ne,ne,n,ne,n,ne,ne,nw,se,ne,ne,ne,ne,ne,se,ne,ne,ne,ne,ne,se,se,ne,nw,ne,ne,ne,ne,ne,nw,sw,ne,ne,ne,ne,n,n,ne,ne,nw,nw,ne,nw,sw,nw,sw,ne,ne,ne,ne,ne,ne,ne,ne,ne,s,ne,ne,ne,ne,ne,s,ne,ne,ne,ne,s,ne,ne,s,ne,ne,ne,nw,ne,ne,se,ne,se,n,s,ne,ne,ne,ne,n,ne,ne,ne,ne,se,ne,ne,ne,se,ne,ne,ne,ne,ne,ne,se,ne,ne,ne,ne,ne,ne,ne,ne,ne,ne,ne,ne,ne,s,ne,ne,se,ne,ne,ne,ne,se,ne,ne,ne,ne,se,ne,ne,ne,se,s,ne,ne,ne,ne,ne,ne,ne,ne,se,ne,n,ne,ne,ne,s,se,ne,ne,ne,ne,ne,ne,s,ne,ne,ne,sw,ne,ne,ne,ne,se,ne,ne,ne,n,se,ne,ne,ne,ne,ne,ne,ne,ne,ne,ne,se,ne,n,ne,ne,ne,se,ne,se,sw,ne,ne,ne,se,ne,ne,ne,se,ne,ne,se,ne,ne,ne,se,ne,ne,sw,se,ne,ne,ne,se,nw,ne,ne,ne,ne,ne,ne,ne,ne,ne,ne,ne,ne,sw,nw,ne,ne,ne,ne,n,ne,se,ne,ne,sw,ne,ne,ne,s,sw,ne,ne,ne,se,ne,ne,ne,ne,ne,ne,ne,se,ne,ne,nw,ne,ne,s,se,ne,ne,se,nw,sw,n,se,ne,ne,n,ne,ne,ne,ne,ne,n,s,ne,ne,se,ne,se,ne,n,ne,ne,nw,se,se,se,ne,se,ne,ne,ne,se,se,ne,ne,ne,se,n,ne,ne,ne,s,n,n,se,ne,sw,ne,ne,ne,ne,ne,ne,s,se,ne,n,se,s,sw,ne,se,ne,ne,nw,n,ne,se,se,ne,se,ne,ne,ne,ne,ne,ne,se,ne,ne,se,ne,se,ne,ne,ne,sw,nw,n,ne,s,nw,se,nw,se,ne,sw,ne,sw,n,ne,ne,ne,ne,ne,ne,ne,ne,ne,ne,ne,se,se,ne,ne,ne,n,ne,n,ne,ne,se,se,se,ne,se,se,se,ne,nw,ne,ne,se,ne,ne,nw,se,ne,ne,s,ne,se,se,ne,ne,ne,ne,se,ne,se,ne,ne,n,ne,ne,sw,se,se,se,ne,se,ne,ne,se,ne,s,ne,ne,ne,ne,ne,se,se,se,s,ne,se,ne,ne,se,se,ne,ne,se,ne,ne,ne,ne,se,ne,se,se,nw,ne,ne,ne,s,ne,ne,se,ne,n,se,sw,ne,ne,s,ne,se,ne,ne,s,nw,se,n,n,ne,ne,n,sw,se,sw,ne,ne,se,ne,ne,ne,ne,n,se,se,sw,n,se,ne,sw,ne,ne,se,ne,ne,ne,ne,s,n,ne,se,se,ne,ne,ne,se,se,s,ne,ne,ne,se,ne,n,ne,se,ne,ne,se,ne,ne,se,ne,ne,ne,ne,s,se,s,se,se,ne,se,ne,n,ne,se,n,ne,ne,se,ne,n,ne,ne,ne,ne,sw,ne,ne,ne,se,ne,ne,s,ne,sw,nw,se,se,s,s,se,ne,se,ne,s,ne,ne,ne,nw,ne,sw,ne,ne,se,se,se,ne,se,ne,se,ne,se,ne,ne,se,se,se,ne,ne,se,se,ne,se,s,ne,se,ne,nw,se,ne,n,ne,ne,ne,ne,ne,se,se,se,n,se,se,se,ne,ne,ne,se,n,ne,nw,ne,ne,se,ne,ne,ne,n,se,se,se,se,se,n,se,nw,ne,se,ne,ne,se,ne,se,ne,n,ne,ne,se,se,se,ne,se,se,ne,ne,ne,ne,ne,ne,ne,ne,se,se,ne,se,s,sw,ne,se,ne,se,se,ne,s,ne,n,ne,ne,ne,se,s,se,ne,se,ne,ne,ne,se,se,ne,ne,se,ne,ne,ne,ne,se,ne,ne,se,se,n,se,ne,ne,se,ne,sw,se,s,sw,ne,se,se,se,ne,se,ne,ne,ne,s,sw,se,se,ne,sw,ne,se,se,se,ne,ne,se,s,se,se,ne,ne,n,n,ne,ne,ne,ne,ne,ne,se,se,sw,ne,se,ne,ne,se,n,n,se,ne,se,se,nw,ne,se,ne,ne,se,ne,se,sw,sw,ne,ne,se,se,ne,nw,ne,se,se,se,n,se,se,ne,se,ne,se,ne,ne,sw,se,se,n,se,ne,se,se,nw,ne,se,se,ne,se,ne,sw,se,ne,ne,nw,se,se,s,ne,se,ne,ne,ne,se,ne,ne,se,se,ne,ne,se,se,nw,s,se,ne,ne,se,se,se,ne,se,ne,ne,ne,ne,n,ne,se,se,n,se,se,se,se,se,sw,se,se,se,se,se,ne,s,ne,se,ne,ne,se,se,se,se,nw,se,se,ne,ne,s,ne,ne,ne,sw,ne,se,se,se,nw,se,ne,se,ne,se,n,se,ne,se,se,ne,se,ne,nw,se,se,se,ne,ne,nw,ne,ne,se,se,se,ne,sw,se,ne,se,se,ne,ne,se,se,ne,se,ne,se,ne,se,se,ne,se,nw,ne,ne,se,se,ne,ne,ne,nw,sw,ne,ne,ne,ne,se,ne,se,ne,ne,n,se,n,n,se,se,ne,ne,se,sw,n,se,ne,se,ne,ne,se,se,se,se,se,se,ne,se,se,se,n,se,se,sw,se,s,se,se,ne,se,se,se,ne,sw,se,ne,ne,n,n,se,se,ne,ne,s,n,ne,nw,se,se,ne,se,se,se,ne,se,ne,ne,ne,ne,nw,se,se,se,se,se,se,ne,se,ne,se,ne,ne,ne,se,se,se,ne,se,se,se,ne,se,ne,se,se,nw,se,se,se,s,se,se,se,se,se,se,ne,se,se,se,ne,sw,sw,s,ne,se,ne,nw,ne,ne,se,ne,se,ne,se,se,se,ne,se,se,ne,sw,se,sw,ne,se,nw,se,sw,se,ne,se,se,ne,ne,se,se,nw,se,sw,s,se,ne,s,se,se,ne,se,ne,ne,se,se,ne,sw,ne,ne,ne,se,se,se,se,ne,ne,ne,se,n,se,se,se,se,nw,se,ne,n,se,ne,s,ne,n,se,se,se,se,ne,n,ne,ne,se,ne,se,se,ne,se,ne,n,se,se,n,se,se,n,se,ne,s,se,ne,ne,ne,ne,ne,ne,ne,se,se,se,se,se,se,se,se,ne,se,se,se,se,se,se,se,n,se,se,se,se,se,se,ne,se,se,se,s,n,se,se,se,se,se,se,ne,se,ne,se,se,se,s,se,se,se,s,ne,sw,s,se,n,s,sw,se,se,se,ne,n,se,se,ne,se,se,se,se,se,se,se,se,sw,ne,nw,se,sw,se,se,se,nw,se,ne,se,se,se,se,se,se,se,se,se,ne,se,ne,n,se,se,se,ne,n,se,se,se,se,se,se,se,se,ne,se,se,ne,se,se,n,se,nw,se,s,se,ne,n,ne,s,se,se,n,se,se,se,se,ne,se,ne,s,ne,se,se,se,nw,se,se,se,ne,se,se,s,ne,sw,se,sw,ne,nw,se,nw,n,se,se,se,se,ne,se,nw,se,ne,se,se,s,se,ne,se,ne,se,se,se,ne,ne,sw,se,se,se,se,se,se,se,se,se,nw,sw,se,ne,se,se,se,se,se,se,se,ne,s,se,se,se,se,se,se,n,se,n,se,se,se,ne,se,se,se,se,se,se,se,se,se,se,se,se,ne,ne,ne,s,se,se,ne,se,se,n,n,ne,nw,se,se,se,ne,se,sw,se,se,ne,se,se,sw,se,se,se,sw,sw,ne,se,s,s,se,se,se,sw,sw,nw,sw,se,se,ne,se,se,se,se,nw,se,se,se,sw,ne,sw,se,ne,se,se,sw,se,se,se,se,ne,n,sw,se,se,se,se,se,se,se,se,n,se,se,se,se,ne,n,se,se,ne,se,se,nw,se,nw,ne,se,se,se,se,n,se,n,se,se,se,se,se,sw,nw,se,se,sw,se,se,se,se,n,se,n,se,n,se,se,se,se,se,se,se,se,se,se,se,nw,se,nw,n,se,se,se,s,se,sw,se,se,se,se,ne,sw,nw,se,nw,se,se,ne,n,n,nw,nw,sw,s,sw,n,sw,sw,sw,sw,s,se,s,s,sw,nw,sw,s,s,s,s,s,se,s,se,s,se,se,se,se,sw,se,se,ne,se,se,se,se,se,se,se,se,s,ne,ne,n,ne,s,sw,s,ne,s,ne,se,sw,ne,ne,s,ne,ne,n,ne,ne,ne,n,ne,ne,ne,ne,sw,se,n,ne,ne,n,n,ne,ne,ne,ne,n,n,n,ne,ne,n,n,n,ne,s,n,n,n,n,n,n,n,n,ne,n,nw,n,n,s,n,n,n,sw,n,sw,n,n,n,n,nw,sw,se,nw,n,nw,nw,n,n,nw,nw,nw,n,nw,nw,nw,nw,n,n,nw,nw,nw,nw,n,nw,nw,nw,n,nw,nw,nw,n,sw,nw,nw,nw,nw,sw,nw,nw,nw,nw,nw,sw,nw,nw,nw,sw,nw,nw,n,nw,sw,nw,sw,nw,nw,s,s,s,sw,nw,sw,nw,n,nw,sw,nw,sw,se,se,nw,sw,nw,s,sw,sw,sw,nw,s,ne,sw,sw,s,sw,s,sw,se,nw,sw,sw,sw,nw,sw,nw,sw,sw,ne,sw,n,sw,sw,sw,sw,sw,sw,sw,sw,sw,sw,sw,s,s,sw,sw,ne,sw,sw,sw,s,sw,sw,s,sw,sw,sw,sw,sw,sw,n,s,sw,nw,sw,sw,s,sw,s,sw,sw,sw,sw,sw,s,sw,s,s,se,s,s,s,s,s,sw,s,nw,sw,s,sw,s,ne,se,nw,sw,s,ne,s,s,sw,n,se,s,s,s,s,s,s,s,s,s,s,nw,s,s,s,s,s,s,s,sw,s,n,s,sw,ne,s,s,s,sw,s,s,s,s,s,ne,n,n,s,ne,s,s,nw,s,s,s,s,ne,s,s,s,s,nw,n,s,s,s,s,s,se,se,ne,n,s,s,s,se,s,s,s,se,se,ne,s,n,se,se,s,s,s,sw,s,s,s,s,sw,s,s,s,s,s,s,se,sw,se,s,s,s,se,s,s,s,sw,se,s,s,s,se,s,se,n,se,se,se,s,nw,se,se,n,nw,se,se,se,s,se,n,s,s,s,se,se,s,se,n,ne,se,se,se,se,se,se,se,n,nw,se,s,n,se,se,se,se,se,se,s,s,s,se,se,se,se,nw,s,se,se,nw,se,n,se,se,s,nw,se,se,se,nw,se,se,se,ne,se,nw,se,se,se,se,se,se,se,se,se,se,se,ne,se,n,se,se,se,se,se,se,se,sw,se,se,se,sw,nw,se,se,se,se,ne,se,ne,nw,ne,se,ne,se,se,se,se,se,se,se,s,s,se,se,se,sw,n,se,se,ne,ne,se,se,nw,nw,se,se,se,s,s,se,s,se,se,se,ne,se,se,ne,se,se,se,se,nw,ne,se,ne,ne,ne,se,se,ne,n,se,n,se,ne,se,se,ne,se,se,ne,se,n,ne,ne,ne,ne,se,ne,ne,se,se,s,ne,se,se,n,se,ne,ne,se,ne,se,se,se,se,ne,se,se,se,ne,ne,ne,ne,s,ne,se,ne,ne,n,se,ne,ne,n,se,ne,ne,se,ne,ne,ne,ne,ne,se,se,ne,n,ne,ne,ne,se,nw,sw,ne,ne,se,ne,sw,se,ne,ne,ne,ne,ne,ne,s,n,ne,ne,ne,ne,ne,n,ne,ne,ne,s,ne,nw,ne,ne,sw,ne,ne,ne,sw,n,ne,sw,sw,s,ne,ne,ne,ne,s,n,ne,ne,ne,ne,ne,ne,ne,ne,ne,ne,ne,ne,ne,ne,ne,ne,ne,sw,s,ne,ne,n,se,sw,ne,ne,ne,ne,ne,ne,n,ne,ne,nw,ne,ne,ne,n,ne,ne,ne,ne,s,ne,n,ne,s,ne,se,ne,ne,s,nw,ne,ne,se,se,n,ne,ne,ne,ne,ne,ne,ne,ne,ne,ne,ne,ne,ne,ne,n,nw,sw,n,n,sw,ne,ne,n,ne,ne,ne,ne,ne,ne,ne,ne,ne,ne,n,ne,ne,ne,ne,se,ne,n,ne,ne,n,ne,n,ne,se,ne,n,n,ne,ne,ne,ne,se,ne,n,ne,ne,n,n,ne,ne,ne,ne,ne,sw,nw,ne,se,n,n,se,n,s,s,n,n,ne,ne,n,ne,n,nw,n,n,ne,nw,n,n,n,n,ne,sw,nw,nw,n,nw,n,n,n,ne,n,sw,ne,ne,n,n,n,ne,ne,ne,ne,n,ne,n,ne,sw,n,n,s,ne,ne,s,n,n,n,n,se,ne,se,ne,n,n,nw,ne,se,ne,n,n,nw,ne,n,ne,n,n,n,n,n,ne,ne,nw,sw,nw,ne,n,n,n,ne,ne,n,nw,se,n,se,n,sw,ne,se,n,ne,ne,sw,n,n,ne,n,n,n,s,nw,n,n,ne,s,ne,n,s,n,n,n,n,n,n,ne,n,n,n,ne,se,n,n,sw,se,s,n,se,s,n,s,ne,n,n,se,ne,n,n,ne,nw,n,n,ne,n,n,n,n,n,nw,n,ne,sw,ne,ne,n,n,s,n,nw,se,n,n,sw,se,n,n,n,n,nw,n,nw,n,sw,n,n,n,n,ne,n,n,n,ne,nw,n,n,n,ne,ne,n,n,n,nw,n,n,n,n,n,sw,n,n,n,n,n,n,n,nw,s,n,n,n,s,nw,nw,s,n,nw,nw,nw,n,ne,n,n,n,nw,n,nw,n,n,sw,n,n,s,nw,n,nw,nw,n,nw,n,n,n,n,n,n,n,s,n,s,n,n,n,n,sw,n,n,sw,n,nw,n,n,nw,nw,nw,n,s,n,n,n,nw,se,n,n,nw,n,nw,n,n,nw,n,s,s,s,n,n,nw,nw,n,n,n,n,n,nw,n,nw,nw,nw,n,nw,nw,nw,sw,nw,n,n,ne,n,nw,n,n,n,s,s,se,sw,nw,nw,n,sw,n,se,n,n,n,n,n,n,nw,n,sw,nw,nw,s,n,n,s,n,n,n,n,nw,nw,nw,nw,nw,ne,n,n,s,ne,nw,n,nw,n,nw,n,n,n,nw,nw,n,se,n,s,n,s,n,n,se,n,sw,nw,n,n,nw,nw,n,nw,nw,nw,n,n,nw,nw,nw,nw,nw,nw,nw,ne,n,nw,nw,n,nw,n,nw,nw,n,nw,nw,nw,n,nw,n,s,nw,n,nw,ne,nw,n,s,n,nw,nw,n,nw,nw,s,ne,nw,nw,nw,n,nw,nw,nw,n,nw,n,nw,nw,s,ne,se,nw,nw,nw,nw,s,nw,ne,n,n,nw,n,n,ne,n,n,nw,s,nw,s,n,nw,nw,nw,se,nw,se,nw,s,n,n,n,n,nw,nw,sw,se,n,nw,sw,sw,nw,nw,nw,sw,ne,nw,nw,nw,se,nw,n,nw,n,ne,s,nw,n,ne,nw,nw,sw,nw,nw,nw,nw,nw,nw,ne,nw,n,nw,n,sw,s,n,nw,nw,n,n,nw,nw,nw,ne,nw,nw,nw,nw,n,n,nw,ne,nw,nw,nw,ne,s,n,nw,nw,nw,n,nw,nw,nw,sw,nw,nw,sw,sw,nw,s,nw,nw,se,nw,ne,ne,nw,nw,nw,nw,nw,se,nw,nw,ne,nw,n,nw,nw,nw,sw,nw,nw,nw,nw,s,nw,s,sw,nw,nw,nw,nw,se,nw,nw,se,nw,nw,nw,nw,s,nw,s,nw,nw,nw,nw,nw,nw,nw,nw,sw,nw,nw,nw,ne,sw,nw,n,nw,s,nw,nw,s,nw,s,nw,sw,nw,nw,sw,ne,nw,nw,nw,nw,n,nw,nw,nw,nw,nw,nw,nw,nw,se,sw,s,nw,sw,nw,s,nw,s,nw,nw,nw,nw,nw,se,n,s,nw,nw,se,s,s,nw,nw,nw,s,nw,nw,n,s,nw,ne,sw,nw,n,se,nw,nw,nw,nw,ne,nw,nw,sw,nw,n,nw,nw,sw,nw,nw,sw,nw,nw,nw,nw,nw,sw,nw,ne,se,nw,sw,sw,nw,nw,nw,nw,nw,sw,nw,n,nw,nw,nw,nw,n,nw,sw,nw,se,s,se,nw,nw,nw,nw,nw,nw,nw,ne,nw,nw,nw,nw,nw,sw,nw,nw,nw,sw,n,nw,se,nw,nw,nw,sw,nw,nw,nw,nw,sw,se,nw,n,nw,sw,nw,sw,ne,nw,n,nw,sw,nw,sw,nw,nw,sw,ne,s,sw,s,nw,n,nw,nw,nw,nw,sw,sw,sw,nw,nw,nw,sw,nw,nw,nw,sw,nw,nw,nw,nw,sw,nw,nw,nw,s,se,nw,n,sw,nw,nw,nw,nw,sw,sw,s,se,ne,nw,se,s,sw,sw,sw,nw,nw,nw,nw,sw,n,sw,s,se,nw,sw,sw,nw,sw,n,sw,sw,nw,nw,sw,sw,n,n,nw,sw,ne,nw,n,ne,sw,sw,nw,sw,sw,sw,nw,nw,nw,nw,nw,se,nw,nw,nw,sw,sw,s,nw,ne,sw,nw,nw,nw,nw,sw,nw,s,sw,nw,nw,sw,sw,se,nw,nw,nw,sw,nw,s,se,sw,n,se,sw,nw,nw,s,nw,nw,sw,nw,sw,n,nw,se,se,sw,sw,sw,nw,sw,nw,nw,sw,sw,sw,sw,n,sw,s,sw,nw,sw,sw,sw,nw,sw,sw,sw,sw,sw,nw,sw,nw,sw,sw,sw,nw,sw,sw,sw,nw,nw,sw,s,sw,nw,sw,n,sw,nw,sw,sw,nw,sw,sw,ne,sw,sw,n,sw,n,nw,s,s,sw,nw,nw,nw,sw,sw,n,ne,sw,sw,se,sw,sw,sw,sw,sw,sw,nw,s,se,nw,sw,sw,sw,nw,sw,nw,sw,sw,sw,ne,sw,ne,sw,sw,sw,ne,sw,sw,sw,sw,sw,nw,sw,nw,sw,nw,sw,sw,nw,sw,sw,ne,sw,nw,sw,s,sw,sw,sw,sw,sw,sw,sw,sw,n,sw,sw,ne,sw,ne,ne,nw,sw,sw,sw,s,nw,sw,sw,sw,s,sw,sw,sw,sw,sw,se,sw,se,sw,sw,sw,nw,sw,n,sw,s,sw,sw,sw,se,sw,sw,sw,sw,sw,nw,n,sw,sw,sw,sw,ne,sw,sw,sw,nw,sw,sw,n,s,sw,s,sw,sw,sw,sw,sw,se,sw,sw,se,nw,n,sw,sw,sw,sw,sw,sw,sw,s,sw,nw,sw,sw,sw,ne,sw,nw,sw,sw,sw,sw,sw,sw,sw,ne,sw,s,sw,sw,sw,s,ne,sw,ne,sw,n,sw,sw,sw,sw,n,sw,sw,sw,sw,sw,se,sw,sw,sw,sw,sw,nw,sw,nw,sw,nw,sw,sw,sw,sw,s,se,sw,sw,n,sw,n,sw,sw,sw,sw,sw,sw,sw,sw,sw,sw,sw,sw,sw,sw,sw,sw,sw,s,nw,sw,sw,ne,sw,ne,sw,sw,sw,sw,sw,sw,sw,sw,sw,sw,nw,sw,sw,sw,sw,s,sw,sw,sw,sw,sw,s,sw,s,sw,sw,sw,sw,sw,sw,s,sw,se,sw,sw,sw,nw,sw,sw,se,ne,sw,ne,sw,ne,n,nw,ne,sw,sw,sw,sw,sw,sw,sw,s,nw,sw,sw,sw,sw,sw,ne,s,sw,sw,sw,sw,sw,sw,sw,sw,n,sw,se,sw,s,sw,sw,sw,sw,sw,sw,sw,sw,sw,s,sw,sw,ne,sw,sw,s,sw,sw,sw,sw,sw,sw,ne,ne,sw,sw,sw,s,sw,s,sw,sw,s,sw,sw,sw,n,sw,s,n,n,sw,sw,s,sw,sw,ne,nw,s,sw,sw,sw,sw,sw,sw,sw,s,sw,sw,sw,sw,sw,sw,sw,sw,sw,s,sw,s,se,ne,sw,sw,s,sw,sw,sw,s,sw,sw,nw,sw,s,sw,sw,s,s,sw,sw,sw,sw,sw,sw,se,sw,ne,ne,sw,nw,ne,sw,n,sw,sw,sw,n,sw,s,s,se,nw,sw,sw,sw,n,sw,sw,s,sw,s,sw,se,sw,nw,s,sw,s,sw,sw,sw,sw,s,ne,sw,sw,sw,sw,ne,n,s,ne,sw,s,s,sw,sw,ne,sw,sw,nw,s,sw,s,s,sw,sw,sw,se,sw,sw,s,sw,sw,s,s,sw,s,ne,sw,sw,ne,s,nw,sw,s,sw,sw,s,sw,sw,sw,s,s,sw,se,sw,sw,s,sw,sw,s,sw,sw,s,sw,se,sw,sw,s,sw,s,sw,se,ne,sw,s,s,s,s,s,sw,sw,sw,sw,sw,sw,s,sw,n,s,sw,s,n,s,sw,ne,sw,s,s,sw,sw,sw,sw,sw,sw,ne,sw,se,s,sw,nw,s,sw,s,sw,s,se,sw,sw,s,se,s,ne,sw,s,sw,sw,sw,sw,nw,s,s,s,sw,sw,nw,sw,n,sw,s,s,sw,s,sw,sw,s,sw,sw,s,sw,s,nw,sw,sw,sw,sw,s,s,sw,s,sw,s,sw,se,sw,nw,s,s,sw,nw,sw,s,sw,sw,sw,sw,se,ne,s,sw,nw,s,sw,s,s,sw,ne,sw,s,s,s,sw,nw,s,ne,s,s,s,se,sw,sw,s,s,s,sw,s,sw,sw,sw,se,s,sw,s,s,s,se,sw,s,s,sw,s,sw,s,se,s,sw,s,se,sw,s,s,sw,sw,s,nw,sw,s,sw,s,s,s,s,sw,sw,sw,s,s,se,nw,s,s,sw,s,s,sw,sw,s,s,s,sw,se,s,ne,s,s,sw,s,s,s,sw,sw,s,s,sw,sw,s,s,sw,sw,sw,s,sw,s,sw,s,s,s,s,ne,sw,s,s,s,sw,n,sw,s,s,s,s,sw,s,s,sw,s,ne,s,s,s,se,s,n,sw,nw,s,sw,s,s,sw,sw,nw,sw,ne,s,sw,sw,s,s,s,s,sw,s,s,s,s,s,n,s,nw,sw,s,s,s,sw,sw,n,sw,sw,sw,s,s,se,s,s,s,sw,sw,s,ne,s,s,s,se,s,s,s,sw,nw,s,n,sw,sw,s,n,sw,s,s,sw,sw,s,s,s,n,s,s,sw,s,s,s,sw,s,s,ne,s,s,sw,s,sw,s,s,s,s,s,s,s,sw,sw,s,s,s,s,s,s,sw,s,s,s,s,s,sw,s,s,sw,s,nw,s,sw,s,s,s,s,s,s,s,s,s,s,n,sw,sw,s,s,s,sw,s,s,s,s,s,s,s,s,s,n,s,s,n,s,s,s,s,s,s,s,s,s,s,s,sw,s,s,s,s,s,sw,s,s,s,s,s,nw,s,s,nw,s,nw,sw,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,nw,s,s,nw,s,s,s,se,s,s,s,s,s,se,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,sw,s,s,s,nw,n,s,s,s,s,s,ne,s,s,n,s,s"""

echo calc_steps(puzzle)
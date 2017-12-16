# Advent of Code Day 10 part 1 - knot hash

import algorithm
import sequtils
import strutils

var 
    list: seq[int]

list = @[ 0, 1, 2, 3, 4 ]

proc rotate[T](list: var seq[T], distance: int=1) =
    var dist: int = distance.mod(len(list))
    list = concat(list[low(list)+dist..high(list)],
                  list[low(list)..<low(list)+dist])

var test_l: seq[int] = @[1, 2, 3]
test_l.rotate()
assert test_l == @[2, 3, 1]
test_l.rotate(2)
assert test_l == @[1, 2, 3]
test_l.rotate(2)
assert test_l == @[3, 1, 2]
test_l.rotate(3)
assert test_l == @[3, 1, 2]

proc twist[T](list: var seq[T], input: seq[int]) =
    var
        rotated: int = 0
        skip: int = 0
    for length in input:
        echo length
        # echo "position $1   skip $2    finish $3" % [$position, $skip, $finish]
        if length > 1:
            echo "Reversing section $1" % [$list[0..<length]]
            list.reverse(0, Natural(length-1))
            echo list
        echo "Rotating by $1" % [$length]
        list.rotate(length+skip)
        echo list
        rotated += length+skip
        skip += 1
    list.rotate(len(list) - rotated.mod(len(list)))

list.twist(@[3, 4, 1, 5])
echo list
assert list[0] * list[1] == 12

var
    puzzle_array: seq[int] = @[]
    puzzle_input: seq[int] = @[88,88,211,106,141,1,78,254,2,111,77,255,90,0,54,205]

for x in 0..255:
    puzzle_array.add(x)

puzzle_array.twist(puzzle_input)
echo puzzle_array[0] * puzzle_array[1]
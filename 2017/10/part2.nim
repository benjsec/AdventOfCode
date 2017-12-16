# Advent of Code Day 10 part 1 - knot hash

import algorithm
import math
import sequtils
import strutils

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

proc twist[T](list: var seq[T], input: seq[int], iterations: int=1) =
    var
        rotated: int = 0
        skip: int = 0
    for length in input.cycle(iterations):
        # echo length
        if length > 1:
            # echo "Reversing section $1" % [$list[0..<length]]
            list.reverse(0, length-1)
            # echo list
        # echo "Rotating by $1" % [$length]
        list.rotate(length+skip)
        # echo list
        rotated += length+skip
        skip += 1
    # Rotate back to original position
    list.rotate(len(list) - rotated.mod(len(list)))

var example_list = @[0, 1, 2, 3, 4]
example_list.twist(@[3, 4, 1, 5], 1)
assert example_list[0] * example_list[1] == 12


proc make_list(input:string): seq[int] =
    result = newSeq[int]()
    for item in input:
        result.add(ord(item))
    return result.concat(@[17, 31, 73, 47, 23])

assert make_list("1,2,3") == @[49,44,50,44,51,17,31,73,47,23]


proc reduce(input: seq[int]): seq[int] =
    # Calculate the dense hash from the sparse hash
    result = newSeq[int]()
    for x in countup(0, len(input)-1, 16):
        let top = max(x+15, high(input))
        result.add(foldl(input[x..top], a xor b))

assert reduce(@[65, 27, 9, 1, 4, 3, 40, 50, 91, 7, 6, 0, 2, 5, 68, 22]) == @[64]


proc asHex(input: seq[int]): string =
    result = ""
    for num in input:
        result.add(toHex(num, 2).toLowerAscii())

assert asHex(@[222, 173, 190, 239]) == "deadbeef"


proc hash(input:string): string =
    var 
        lengths = make_list(input)
        list: seq[int] = @[]
    # for x in 1..256:
    for x in 0..255:
        list.add(x)
    assert len(list) == 256
    echo lengths
    # Make sparse hash
    list.twist(lengths, 64)
    let dense_hash = reduce(list)
    return asHex(dense_hash)

echo hash("")
# echo hash("AoC 2017")

# var
#     puzzle_array: seq[int] = @[]
#     puzzle_input: seq[int] = @[88,88,211,106,141,1,78,254,2,111,77,255,90,0,54,205]

# for x in 0..255:
#     puzzle_array.add(x)

# puzzle_array.twist(puzzle_input)
# echo puzzle_array[0] * puzzle_array[1]
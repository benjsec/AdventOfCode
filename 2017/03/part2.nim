import math
import tables

type 
    coordinate = tuple[x: int, y: int]

proc set(table: TableRef, x: int, y:int, value: int) =
    var coord: coordinate = (x, y)
    table[coord] = value

proc get(table: TableRef, x: int, y: int): int =
    var coord: coordinate = (x, y)
    try:
        return table[coord]
    except KeyError:
        return 0

proc calc(table: TableRef, x:int, y:int) =
    var neighbours: seq[int] = @[]
    for i_X in @[x-1, x+1]:
        for i_Y in @[y-1, y+1]:
            neighbours.add(get(table, i_X, i_Y))
    set(table, x, y) = sum(neighbours)

var spiral: newTable[coordinate, int]()
assert get(spiral, 0, 0) == 0
set(spiral, 0, 0, 1)
assert get(spiral, 0, 0) == 1


# iterator odd_primes(): int {.closure.} =
#     # Iterator to return all odd primes {1, 9, 25, ...}
#     var i: int=1
#     while true:
#         yield i*i
#         i+=2

# proc get_ring(position: int): int =
#     # Given a number in a spiral sequence, return the layer number
#     var layer: int = 0
#     for max_num in odd_primes():
#         if max_num >= position:
#             return layer
#         layer += 1

# proc get_odd_prime(n: int): int =
#     # Return the nth odd prime {1, 9, 25, ...}
#     return ((2*n)-1) ^ 2

# proc rotate(position: int): int =
#     # If a position is not in first quarter return the corresponding position from
#     # the first quarter
#     let ring_num: int = get_ring(position)
#     let num_in_ring: int = get_odd_prime(ring_num+1) - get_odd_prime(ring_num)
#     var res: int = position-1
#     while res > num_in_ring div 4:
#         res -= num_in_ring div 4
#     return res

# proc dist_to_centre(position: int): int =
#     let ring_num: int = get_ring(position)
#     let num_in_ring: int = get_odd_prime(ring_num+1) - get_odd_prime(ring_num)
#     let centre: int = (num_in_ring div 8)
#     return abs(rotate(position)-centre)


# proc spiral_mem_steps(position: int): int=
#     return get_ring(position) + dist_to_centre(position)

# assert get_ring(1) == 0
# for i in 2..9:
#     if get_ring(i) != 1:
#         echo "Testing: ", i, " Expected 1 got ", get_ring(i)
# for i in 10.. 25:
#     if get_ring(i) != 2:
#         echo "Testing: ", i, " Expected 2 got ", get_ring(i)
# assert get_ring(26) == 3
# echo "Ring tests done"

# proc assert_eq(a: int, b: int) =
#     if a != b:
#         echo "Got ", a, " but expected ", b
#         assert false

# assert_eq(dist_to_centre(1), 0)
# assert_eq(dist_to_centre(2), 0)
# assert_eq(dist_to_centre(3), 1)
# assert_eq(dist_to_centre(4), 0)
# assert_eq(dist_to_centre(5), 1)
# assert_eq(dist_to_centre(6), 0)
# assert_eq(dist_to_centre(7), 1)
# assert_eq(dist_to_centre(8), 0)
# assert_eq(dist_to_centre(9), 1)
# assert_eq(dist_to_centre(10), 1)
# assert_eq(dist_to_centre(11), 0)
# assert_eq(dist_to_centre(12), 1)
# assert_eq(dist_to_centre(13), 2)
# assert_eq(dist_to_centre(26), 2)

# echo "Arm tests done"

# echo "1 ", spiral_mem_steps(1) == 0
# echo "2 ", spiral_mem_steps(2) == 1
# echo "6 ", spiral_mem_steps(6) == 1
# echo "5 ", spiral_mem_steps(5) == 2
# echo "9 ", spiral_mem_steps(9) == 2
# echo "15 ", spiral_mem_steps(15) == 2
# echo "19 ", spiral_mem_steps(19) == 2
# echo "10 ", spiral_mem_steps(10) == 3
# echo "18 ", spiral_mem_steps(18) == 3
# echo "13 ", spiral_mem_steps(13) == 4
# echo "25 ", spiral_mem_steps(25) == 4
# echo "1024 ", spiral_mem_steps(1024) == 31

# echo "Puzzle solution is ", spiral_mem_steps(312051), " steps"
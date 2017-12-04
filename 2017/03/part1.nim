import math


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

proc get_ring(position: int): int =
    # Given a number in a spiral sequence, return the layer number
    return int(math.floor(math.sqrt(float32(position)))/2.0)

proc get_odd_prime(n: int): int =
    # Return the nth odd prime {1, 9, 25, ...}
    return ((2*n)-1) ^ 2

proc spiral_mem_steps(position: int): int=
    case position
    of 1: return 0
    of 2, 4, 6, 8: return 1
    of 3, 5, 7, 9, 11, 15, 19, 23: return 2
    of 10, 12, 14, 16, 18, 20, 24 #[et al]#: return 3
    of 13, 17, 21, 25 #[ et al ]#: return 4
    else: discard

# Use examples given to test functions
echo "Test 1: ", spiral_mem_steps(1)==0
echo "Test 12: ", spiral_mem_steps(12)==3
echo "Test 23: ", spiral_mem_steps(23)==2
echo "Test 1024: ", spiral_mem_steps(1024)==31

for i in 1..11:
    echo i, " is in ring ", get_ring(i)
echo 23, " is in ring ", get_ring(23)
echo 1024, " is in ring ", get_ring(1024)
echo "Max steps for ", 23, " is ", math.sqrt(float32(get_odd_prime(get_ring(23))))

for i in 2..6:
    echo get_odd_prime(i)-get_odd_prime(i-1)

echo "Consider 22"
echo "22 is in ring ", get_ring(22)
var ring: int = get_ring(22)
echo "22 is ", 22 - get_odd_prime(ring), "th in it's ring"

# Use rotation to translate bottom half to top half

proc rotate(position: int): int =
    # If a position is in in the bottom `half` return the corresponding position from
    # the `top` half
    let ring_num: int = get_ring(position)
    let num_in_ring: int = get_odd_prime(ring_num) - get_odd_prime(ring_num - 1)
    if position - get_odd_prime(ring_num) > int(float32(num_in_ring)/2.0):
        return position - int(float32(num_in_ring)/2.0)
    else:
        return position

echo "22 rotates to ", rotate(22) ## Should be 14
echo "20 rotates to ", rotate(20) ## Should be 12
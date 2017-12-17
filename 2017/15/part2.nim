import math
import sequtils

let
    A_start: int = 65
    B_start: int = 8921
    count: int = 5

iterator gen_A(): int {.closure.}=
    var value:int = A_start
    for x in 1..count:
        value = (value * 16807) mod 2147483647
        while value mod 4 != 0:
            value = (value * 16807) mod 2147483647
        yield value

iterator gen_B(): int {.closure.}=
    var value:int = B_start
    for x in 1..count:
        value = (value * 48271) mod 2147483647
        while value mod 8 != 0:
            value = (value * 48271) mod 2147483647
        yield value

assert toSeq(gen_A()) == @[1352636452, 1992081072, 530830436, 1980017072, 740335192]
assert toSeq(gen_B()) == @[1233683848, 862516352, 1159784568, 1616057672, 412269392]

proc match(A: int, B: int): int =
    var x, y: int
    x = A and 0xFFFF
    y = B and 0xFFFF
    return if x==y: 1
        else: 0

assert match(245556042, 1431495498) == 1
assert match(1092455, 430625591) == 0

proc match(A: seq[int], B: seq[int]): seq[int] =
    assert len(A) == len(B)
    result = newSeq[int](len(A))
    for i in low(A)..high(A):
        result[i] = match(A[i], B[i])

assert match(toSeq(gen_A()), toSeq(gen_B())) == @[0, 0, 0, 0, 0]


iterator zip[T1, T2](inp1: iterator(): T1, inp2: iterator(): T2): (T1, T2) {.noSideEffect.} =
    ## Inline iteration on 2 closure iterators at the same time
    ## Input is first copied to avoid side-effects

    let it1 = inp1
    let it2 = inp2
    while true:
        let val1 = it1()
        let val2 = it2()
        if finished(it1) or finished(it2):
            break
        yield (val1, val2)


proc score(): int =
    for x, y in zip(gen_A, gen_B):
        result += match(x, y)


# assert score() == 1
echo score()


# for x in gen_A(65):
#     assert x == 1092455
#     assert x == 1181022009
#     break
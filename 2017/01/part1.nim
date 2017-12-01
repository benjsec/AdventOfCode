var inp: seq[int]

type 
    Test = tuple[inp: seq[int], outp: int]

var
    t1: Test
t1 = (inp: @[1, 1, 2, 2], outp: 3)

inp = @[1, 1, 2, 2]
let expected = 3

proc sum_match(list: seq): int =
    var outp = 0
    for idx in list.low()..<list.high():
        if list[idx] == list[idx+1]:
            outp+=list[idx]
    if list[0] == list[high(list)]:
        outp+=list[0]
    return outp

if sum_match(t1.inp) == t1.outp:
  echo "PASS"
else:
  echo "FAIL"
echo "Calculated total ", sum_match(t1.inp)
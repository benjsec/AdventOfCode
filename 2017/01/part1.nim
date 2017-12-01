from strutils import parseInt

type 
    Test = tuple[inp: string, outp: int]

var tests: seq[Test]

tests = @[]
tests.add((inp: "1122", outp: 3))
tests.add((inp: "1111", outp: 4))
tests.add((inp: "1234", outp: 0))
tests.add((inp: "91212129", outp: 9))

proc sum_match(list: string): int =
    # Return the sum of digits in a string where the digit
    # matches the following digit.
    for idx in list.low()..<list.high():
        if list[idx] == list[idx+1]:
            # This seems a really long way around...
            result += int(list[idx])-int('0')
    if list[0] == list[high(list)]:
        result += int(list[0])-int('0')

for t in tests:
    if sum_match(t.inp) == t.outp:
        echo "PASS"
    else:
        echo "FAIL"
        echo "Calculated total ", sum_match(t.inp)

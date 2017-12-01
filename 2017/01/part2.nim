type 
    Test = tuple[inp: string, outp: int]

var tests: seq[Test]

tests = @[]
tests.add((inp: "1212", outp: 6))
tests.add((inp: "1221", outp: 0))
tests.add((inp: "123425", outp: 4))
tests.add((inp: "123123", outp: 12))
tests.add((inp: "12131415", outp: 4))

proc sum_match(list: string): int =
    # Return the sum of digits in a string where the digit
    # matches the digit in the opposite position.
    var idx2: int
    let offset = int(len(list)/2)
    
    for idx in list.low()..list.high():
        idx2 = idx+offset
        if idx2 > list.high():
            idx2 -= len(list)
        # echo "idx: ", idx, " idx2: ", idx2
        # echo "n1: ", list[idx], " n2: ", list[idx2]
        if list[idx] == list[idx2]:
            # This seems a really long way around...
            result += int(list[idx])-int('0')

for t in tests:
    var outp: int = sum_match(t.inp)
    if outp == t.outp:
        echo "PASS"
    else:
        echo "FAIL"
        echo "Calculated total ", outp

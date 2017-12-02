import math
from strutils import parseInt, split, splitWhitespace, splitLines
from sequtils import map

var
    row1: string = "5 1 9 5"
    row2: string = "7 5 3"
    row3: string = "2 4 6 8"

var
    table: string = """
        5 1 9 5
        7 5 3
        2 4 6 8"""

proc row_diff(row: string): int =
    var rownums: seq[int]
    rownums = map(splitWhitespace(row), proc(x: string): int = parseInt(x))
    return max(rownums) - min(rownums)

proc checksum(table: string): int =
    return math.sum(map(splitLines(table), proc(x: string): int = row_diff(x)))

echo "Diff: ", row_diff(row1)
echo "Diff: ", row_diff(row2)
echo "Diff: ", row_diff(row3)
if checksum(table) == 18:
    echo "PASS"
else:
    echo "FAIL"
    echo "Checksum: ", checksum(table)
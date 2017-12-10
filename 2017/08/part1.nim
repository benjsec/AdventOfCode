# Day 8 part 1

import strutils
import tables

var example: string = """
b inc 5 if a > 1
a inc 1 if b < 5
c dec -10 if a >= 1
c inc -20 if c == 10"""


proc action(r: var CountTable, statement: string) =
    var
        address, direction, amount: string 
        mult: int = 1
    (address, direction, amount) = statement.split()
    if direction == "dec":
        mult = -1
    r.inc(address, mult * parseInt(amount))


proc condition(r: var CountTable, input: string): bool =
    var 
        address, comparator, value_str: string
        value: int
    (address, comparator, value_str) = input.split()
    value = parseInt(value_str)

    case comparator:
        of ">":
            return r.getOrDefault(address) > value
        of ">=":
            return r.getOrDefault(address) >= value
        of "==":
            return r.getOrDefault(address) == value
        of "<":
            return r.getOrDefault(address) < value
        of "<=":
            return r.getOrDefault(address) <= value
        of "!=":
            return r.getOrDefault(address) != value
        else:
            return false


proc parse(r: var CountTable, input: string) =
    var 
        action, condition: string

    (action, condition) = input.split("if")
    if r.condition(condition):
        r.action(action)


proc parse_all(input: string): int = 
    var r: CountTable[string]
    r = initCountTable[string](rightSize(26))
    for line in input.splitLines():
        r.parse(line)
    return r.largest()[1]


assert parse_all(example) == 1

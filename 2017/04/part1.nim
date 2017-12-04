# AdventOfCode 2017 Day 4 Part 1

import math
import strutils
import sets

const
    phrase1: string = "aa bb cc dd ee"
    phrase2: string = "aa bb cc dd aa"
    phrase3: string = "aa bb cc dd aaa"


proc check_phrase(phrase: string): bool =
    let words: seq[string] = splitWhitespace(phrase)
    let wordset: HashSet[string] = toSet(words)
    return len(words) == len(wordset)

assert(check_phrase(phrase1) == true)
assert(check_phrase(phrase2) == true)
echo "Phrase3: ", check_phrase(phrase3) == true
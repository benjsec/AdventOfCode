import hashes
import strutils
import Tables

const
    example: string = """
        pbga (66)
        xhth (57)
        ebii (61)
        havc (66)
        ktlj (57)
        fwft (72) -> ktlj, cntj, xhth
        qoyq (66)
        padx (45) -> pbga, havc, qoyq
        tknk (41) -> ugml, padx, fwft
        jptl (61)
        ugml (68) -> gyxo, ebii, jptl
        gyxo (61)
        cntj (57)"""

type    
    Program = tuple
        name: string
        weight: int
        children: seq[string]
        parents: seq[string]

proc newProgram(name: string, weight: int, children: seq[string]=nil): Program =
    (name: name,
     weight: weight,
     children: if children==nil: newSeq[string]()
               else: children,
     parents: newSeq[string]())

var
    stack = initTable[string, Program]()
    prog1: Program = newProgram("abcd", 1)
    prog2: Program = newProgram("efgh", 1, @["abcd"])

proc add_program(stack: var Table, prog: Program) =
    if stack.hasKey(prog.name):
        stack[prog.name].weight = prog.weight
        stack[prog.name].children.add(prog.children)
    else:
        stack[prog.name] = prog
    for i, child in prog.children:        
        if not stack.hasKey(child):
            stack[child] = newProgram(child, -1)
        stack[child].parents.add(prog.name)

proc find_head(stack: var Table): string =
    for prog in stack.values():
        if len(prog.parents) == 0:
            return prog.name

iterator read_input(input: string): Program =
    for line in input.splitLines():
        var
            name: string = line.splitWhitespace[0]
            weight: int = parseInt(
                            strip(line.splitWhitespace[1], chars = {'(', ')'}))
            children: seq[string] = newSeq[string]()
        if "->" in line:
            for c in line.split("->")[1].split(","):
                children.add(c.strip(chars=Whitespace))
        yield newProgram(name, weight, children)

for p in read_input(example):
    stack.add_program(p)
echo "Head of stack is ", stack.find_head()
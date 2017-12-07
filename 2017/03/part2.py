import numpy

class Spiral:
    def __init__(self, size=10):
        self.matrix = numpy.zeros((size, size))
        self.offset = size//2

    def __getitem__(self, coord):
        x, y = coord
        x += self.offset
        y += self.offset
        return self.matrix[x, y]

    def __setitem__(self, coord, val):
        x, y = coord
        x += self.offset
        y += self.offset
        self.matrix[x, y] = val

    def calc(self, coord):
        x, y = coord
        # Set current space to zero first to make list comprehension easier
        self[x, y] = 0
        self[x, y] = sum([self[xi, yi] for yi in range(x-1, x+1) for xi in range(y-1, y+1)])

if __name__=="__main__":
    s = Spiral()
    s[0, 0] = 1
    assert s[0, 0] == 1
    assert s[0, 1] == 0
    s.calc((0, 1))
    assert s[0, 1] == 1
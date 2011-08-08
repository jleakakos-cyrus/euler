output = []

def readTriangle(filename):
	global triangleSize
	f = open(filename, 'r')
	triangle = [[int(v) for v in line.split()] for line in f.read().splitlines()]
	return triangle

triangle =  readTriangle('problem18.txt')
print(triangle)
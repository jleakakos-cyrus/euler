# Problem 18
# Find the maximum total from top to bottom of the large triangle.                             

def readTriangle(filename):
	global triangleSize
	f = open(filename, 'r')
	triangle = f.read()
	triangle = triangle.splitlines()
	triangle = [[int(v) for v in line.split()] for line in triangle]
	return triangle

def problem67():
	triangle = readTriangle('problem67.txt')
	size = len(triangle)
	rev = list(range(size))[0::][::-1]
	for row in rev:
		for column in list(range(row)):
			triangle[row-1][column] += max(triangle[row][column], triangle[row][column+1])
	return triangle[0][0]
	
if __name__ == '__main__':
	print(problem67())
# Problem 42
# How many words are triangle words?


FILENAME = 'problem42.txt'

def readFile(fileName):
	mmm = []
	f = open(fileName, 'r')
	k = f.read().rsplit(',')
	for stuff in k:
		mmm.append(stuff.replace('"', ''))
	return mmm

def valueOfName(name):
	nameSum = 0
	for letter in name:
		nameSum += (ord(letter) - 64)
	return nameSum

def triangleNumber(term):
	return int(.5 * term * (term + 1))

def problem42(filename):
	nameSums = []
	largest = 0
	for name in readFile(filename):
		value = valueOfName(name)
		nameSums.append(value)
		if (value > largest):
			largest = value
	index = 1
	triangle = 0
	triangleList = []
	while (triangle < largest):
		triangle = triangleNumber(index)
		triangleList.append(triangle)
		index += 1
	numTriangleWords = 0
	for wordSum in nameSums:
		if (triangleList.count(wordSum) == 1):
			numTriangleWords += 1
	return numTriangleWords
	

if __name__ == '__main__':
	print problem42(FILENAME)
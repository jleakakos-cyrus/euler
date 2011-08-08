# Problem 22
# What is the total of all the name scores in the file?

FILENAME = 'problem22.txt'

def readFile(fileName):
	mmm = []
	f = open(fileName, 'r')
	k = f.read().rsplit(',')
	for stuff in k:
		mmm.append(stuff.replace('"', ''))
	return mmm

def valueOfName(name, namesList):
	nameSum = 0
	for letter in name:
		nameSum += (ord(letter) - 64) * (namesList.index(name) + 1)
	return nameSum

def problem22(filename):
	namesList = readFile(filename)
	namesList.sort()
	namesSum = 0
	for name in namesList:
		namesSum += valueOfName(name, namesList)
	return namesSum

if __name__ == '__main__':
	print problem22(FILENAME)
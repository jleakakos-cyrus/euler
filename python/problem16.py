# Problem 16
# What is the sum of the digits of the number 2^1000?

from math import pow
test = 15
NUM = 1000

def calculateSum(number):
	newNumber = str(int(pow(2, number)))
	sum = 0
	for character in newNumber:
		sum += int(character)
	return sum


if __name__ == '__main__':
	print calculateSum(test)
	print calculateSum(NUM)
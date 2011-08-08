# Problem 25
# What is the first term in the Fibonacci sequence to contain 1000 digits?


def fibonacci(value, fiboSequence=[]):
	if (value == 1):
		return [1]
	elif (value == 2):
		return [1, 1]
	if (len(fiboSequence) == 0):
		fiboSequence.append(1)
		fiboSequence.append(1)
	v1 = fiboSequence[len(fiboSequence)-2]
	v2 = fiboSequence[len(fiboSequence)-1]
	index = len(fiboSequence) + 1
	while (index <= value):
		v3 = v1 + v2
		fiboSequence.append(v3)
		v1 = v2
		v2 = v3
		index += 1
	return fiboSequence

def numDigits(number):
	return len(str(number))

def problem25(digitLimit):
	list = []
	digits = 0
	index = 0
	while (digits < digitLimit):
		list = fibonacci(index, list)
		index += 1
		digits = numDigits(list[len(list)-1])
	return len(list)

if __name__ == '__main__':
	print problem25(1000)
	
	
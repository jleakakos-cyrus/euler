# Problem 14
# Which starting number, under one million, produces the longest chain?
# n -> n/2 (n is even)
# n -> 3n + 1 (n is odd)

UPPER_START = 1000000

def iterate(number):
	if (number % 2 == 0):
		return number/2
	else:
		return 3 * number + 1

def problem14(start=13):
	chainDict = {}
	bigChain = []
	for value in range(1, start+1):
		chain = []
		while (value != 1):
			chain.append(value)
			value = iterate(value)
		if (len(chain) > len(bigChain)):
			bigChain = chain
		
	return bigChain[0]

if __name__ == '__main__':
	print problem14(UPPER_START)
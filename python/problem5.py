# Probelm 5
# What is the smallest number divisible by each of the numbers 1 to 20?

testNumbers = range(2,1001)
numbers = range(2, 21)
primesCount = {}

def factorize(number):
	'''Get all of the prime factors of a number, and keep track
	off how many of each there are. Return the prime factorization.'''
	largest = 2;
	prime = 2
	primesCount[2] = 0
	nextNumber = number
	while (not isFactored(number, nextNumber)):
		if (nextNumber % prime == 0):
			nextNumber = nextNumber / prime
			primesCount[prime] = primesCount[prime] + 1
		elif (prime == 2):
			prime = 3
			primesCount[prime] = 0
		else:
			prime += 2
			while (not isprime(prime)):
				prime += 2
			primesCount[prime] = 0
	return primesCount

def isFactored(number, nextNumber):
	"""Check if the number is fully factored."""
	value = 1
	for key in primesCount:
		if (primesCount[key] >= 0):
			value *= primesCount[key] * key
	if (nextNumber == 1):
		return True
	elif (value == number):
		return True
	else:
		return False

def isprime(n):
	'''check if integer n is a prime, and add it to the list
	of prime factors if it is not already in there'''
	# make sure n is a positive integer
	n = abs(int(n))
	# 0 and 1 are not primes
	if n < 2:
		return False
		# 2 is the only even prime number
	if n == 2:
		return True
	# all other even numbers are not primes
	if not n & 1:
		return False
	# range starts with 3 and only needs to go up the squareroot of n
	# for all odd numbers
	for x in range(3, int(n**0.5)+1, 2):
		if n % x == 0:
			return False
	return True

def findSmallest(list):
	smallest = 1
	smallestFactors = {}
	for value in list:
		factors = factorize(value)
		for key in factors:
			if not (key in smallestFactors):
				smallestFactors[key] = factors[key]
			else:
				if (factors[key] > smallestFactors[key]):
					smallestFactors[key] = factors[key]
	for key, value in smallestFactors.iteritems():
		smallest *= (key ** value)
	return smallest

if __name__ == '__main__':
	print findSmallest(testNumbers)
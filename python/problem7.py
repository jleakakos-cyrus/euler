# Problem 7
# What is the 10001^(st) prime number?
from time import clock

PRIME_TO_FIND = 10001
PRIMER = 100000

primes = [2, 3]
isprimetime = []

def isprime(n):
	isprimetime.append
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

def findPrime(nPrime):
	prime = 2
	if (nPrime == 1):
		return prime
	else:
		count = 2
		value = 3
		prime = value
		while (count < nPrime):
			value += 2
			if (isprime(value)):
				count +=1
				prime = value
	return prime

if __name__ == '__main__':
	seconds = clock()
	print findPrime(PRIME_TO_FIND)
	seconds = clock() - seconds
	print seconds
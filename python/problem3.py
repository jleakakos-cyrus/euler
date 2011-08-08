# Problem 3
# Find the largest prime factor of a composite number. What is the
# largest prime factor of the number 600851475143?

NUM_TO_CALC1 = 600851475143
NUM_TO_CALC2 = 600851412355
primes = [2]
primesCount = {}

def getLargestFactor(number):
	largest = -1
	prime = 2
	done = False
	while (number % prime == 0 and not done):
		number /= prime
		if (number == 0):
			largest = prime
			done = True;
	prime += 1
	while (number % prime == 0 and not done):
		number /= prime
		if (number == 0):
			largest = prime
			done = True;
	while (not done):
		prime += 2
		if (isprime(prime)):
			#print number, prime
			while (number % prime == 0):
				number /= prime
				if (number == 0 or number == 1):
					largest = prime
					done = True;
	return largest

def factorize(number):
	'''Get all of the prime factors of a number, and keep track
	off how many of each there are. Return the largest prime.'''
	largest = 2;
	prime = 2
	primesCount[2] = 0
	primesCount[5] = 0
	nextNumber = number
	while (not isFactored(number, nextNumber)):
		if (nextNumber % prime == 0):
			nextNumber = nextNumber / prime
			primesCount[prime] = primesCount[prime] + 1
		elif (prime == 2):
			prime = 3
			primesCount[prime] = 0
			primes.append(prime)
		else:
			prime += 2
			while (not isprime(prime)):
				prime += 2
			primesCount[prime] = 0
			primes.append(prime)
	return primes[len(primes) - 1]
	

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

if __name__ == '__main__':
	#print factorize(NUM_TO_CALC2)
	print getLargestFactor(NUM_TO_CALC1)
	#print isprime(3)
	"""for i in range(600851412355, 600851412355+100):
		print i, isprime(i)
	print isprime(600851412355/5/19)
"""
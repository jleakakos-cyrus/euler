# Problem 10
# Find the sum of all the primes below two million.

NUMBER = 2000000
TEST = 10

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

def sumOfPrimesUnder(value):
	if (value < 3):
		return 0
	if (value == 3):
		return 2
	else:
		sum = 2
		current = 3
		while (current < value):
			if (isprime(current)):
				sum += current
			current += 2
	return sum

if __name__ == '__main__':
	print sumOfPrimesUnder(NUMBER)
	
	
	
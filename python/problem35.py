# Problem 35
# How many circular primes are there below one million?

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

def rotations(number):
	rotations = []
	number = str(number)
	#rotations.append(number)
	numRotations = len(number)
	for i in list(range(numRotations)):
		temp = []
		val = i
		for j in list(range(numRotations)):
			temp.append(number[val % numRotations])
			val += 1
		rotations.append(''.join(temp))
	return rotations
	
def iscircular(number):
	for rotation in rotations(number):
		if not isprime(rotation):
			return False
	return True

def problem35(limit):
	count = 0
	for number in list(range(limit)):
		if iscircular(number):
			count += 1
	print(count, 'circular primes under', limit)

def sieve(limit):
	prime = 2
	list = [prime]
	list = [x for x in range(3, limit + 1) if x % 2 == 1]
	prime = 3
	count = 1
	while prime * prime < limit:
		for value in list[count:]:
			if value % prime == 0:
				list.remove(value)
		prime = list[count]
		count += 1		
	return [2] + list

def problem35sieve(limit):
	count = 0
	listONumber = sieve(limit)
	print(listONumber)
	for number in listONumber:
		if iscircular(number):
			count += 1
	print(count, 'circular primes under', limit, 'using a sieve')

if __name__ == '__main__':
	problem35(100)
	#problem35(1000000)
	problem35sieve(1000000)
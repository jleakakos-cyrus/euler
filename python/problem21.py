# Problem 21
# Evalutate the sum of all amicable numbers under 10000.

def getNumDivisors(primeFactors):
	numDivisors = 1
	for prime, count in primeFactors.iteritems():
		numDivisors *= (count + 1)
	return numDivisors

def getProperDivisors(number):
	divisors = [0, 1]
	for value in range(2, (number/2 + 1)):
		if (number % value == 0):
			divisors.append(value)
	return divisors		

def primeFactorization(number):
	prime = 2
	primeFactors = {2: 0}
	nextNumber = number
	while (nextNumber % prime == 0):
		nextNumber /= prime
		primeFactors[prime] += 1
	prime = 1
	primeFactors[3] = 0
	while (nextNumber != 1):
		prime += 2
		while (not isprime(prime)):
			prime += 2
		primeFactors[prime] = 0
		while (nextNumber % prime == 0):
			nextNumber /= prime
			primeFactors[prime] += 1
	return primeFactors

def isAmicable(number):
	a = number
	b = sum(getProperDivisors(a))
	if (a == sum(getProperDivisors(b)) and a != b):
		return True
	return False

def problem21(upperLimit):
	amicableNumbers = []
	for index in range (1, upperLimit):
		if (isAmicable(index)):
			amicableNumbers.append(index)
	return sum(list(set(amicableNumbers)))

if __name__ == '__main__':
	print problem21(10000)
# Problem 12
# What is the value of the first tirangle number to have over five hundred divisors?

def triangleNumber(number):
	return number * (number + 1) / 2

def isprime(n):
	n = abs(int(n))
	if n < 2:
		return False
	if n == 2:
		return True
	if not n & 1:
		return False
	for x in range(3, int(n**0.5)+1, 2):
		if n % x == 0:
			return False
	return True

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
	
def getNumDivisors(primeFactors):
	numDivisors = 1
	for prime, count in primeFactors.iteritems():
		numDivisors *= (count + 1)
	return numDivisors

def problem12(numDivisorLimit, startValue=1):
	numDivisors = 0
	value = startValue
	while (numDivisors < numDivisorLimit):
		value += 1
		tN = triangleNumber(value)
		pF = primeFactorization(tN)
		numDivisors = getNumDivisors(pF)
	return value, triangleNumber(value), numDivisors

if __name__ == '__main__':
	print problem12(500)

	


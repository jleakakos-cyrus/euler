# Problem 2
# Find the sum of all the even-valued terms in the Fibonacci
# sequence which do not exceed four million.
"""fib 1 = 1
fib 2 = 2
fib 3 = fib 1 + fib 2
fib 4 = fib 2 + fib 3"""

UPPER = 4000000
fibo = []
evenFibo = []

def listFibo (limit):
	"""Add the first 'value' numbers of the Fibonacci Sequence
	to a list."""
	sum = 0
	if (limit >= 2):
		fibo.append(1)
		fibo.append(2)
		sum += 2
	last = 2
	second = 1
	new = last + second
	while (new < limit):
		fibo.append(new)
		if (new % 2 == 0):
			evenFibo.append(new)
			sum += new
		second = last
		last = new
		new = last + second
	return sum

if __name__ == '__main__':
	print listFibo(UPPER**2)

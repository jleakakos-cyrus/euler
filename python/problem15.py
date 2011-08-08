# Problem 15
# How many routes are there through a 20x20 grid?

def factorial(number):
	mult = 1
	for x in range(1, number + 1):
		mult *= x
	return mult

def binomialCoefficient(m, n):
	return factorial(m)/(factorial(n) * factorial(m - n))

def problem15(x, y):
	return binomialCoefficient(x + y, y)

if __name__ == '__main__':
	print problem15(20, 20)
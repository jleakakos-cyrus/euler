# Problem 6
# What is the difference between the sum of the squares and the
# square of the sums for the first 100 natural numbers?

firstTen = range(1, 11)
numbers = range(1, 101)

def sumOfSquares(list):
	return sum([x**2 for x in list])

def squareOfSum(list):
	return sum(list)**2

if __name__ == '__main__':
	print squareOfSum(numbers) - sumOfSquares(numbers)
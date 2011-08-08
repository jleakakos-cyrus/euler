# Problem 20
# Find the sum of the digits in the number 100!

def factorial(number):
	mult = 1
	for x in range(1, number + 1):
		mult *= x
	return mult

def sumOfDigits(number):
	sum = 0
	for char in str(number):
		sum += int(char)
	return sum

if __name__ == '__main__':
	print sumOfDigits(factorial(100))
	

# Problem 30
# Find the sum of all of the numbers that can be written as the sum of fifth powers of their digits.

from math import pow

def sumDigits(number, power):
	s = str(number)
	ss = 0
	for letter in s:
		ss += int(letter)**power
	return int(ss)

if __name__ == '__main__':
	ss = -1
	for i in range(1,1000000):
		k = sumDigits(i, 5)
		if (k == i):
			ss += k
	print ss
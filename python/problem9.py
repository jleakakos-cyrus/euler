# Problem 9
# There exists exactly one Pythagorean triplet for which a + b + c = 1000.
# Find the product abc.
#A Pythagorean triplet is a set of three natural numbers, a < b < c, for which,
# a^(2) + b^(2) = c^(2)

NUMBER_TO_FIND = 1000
values = []

def findSpecialSum(value):
	done = False
	for m in range(1, 200):
		for n in range(0, 200):
			if (m > n):
				a = 2*m*n
				b = m**2 - n**2
				c = m**2 + n **2
				if ((a + b + c) == value):
					return a * b * c

if __name__ == '__main__':
	print findSpecialSum(NUMBER_TO_FIND)
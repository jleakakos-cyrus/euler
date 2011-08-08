# Problem 40
# Find the value of the following expression
# 1, 10, 10, 1000, 10000, 100000, 1000000

UPPER = 1000000

def problem40(limit, number):
	places = []
	index = 1
	while (index <= limit):
		places.append(index - 1)
		index *= 10
	mult = 1
	for place in places:
		mult *= int(number[place])
	return mult

if __name__ == '__main__':
	number = ''
	index = 1
	while (len(number) <= 1000000):
		number += str(index)
		index += 1
	print problem40(UPPER, number)

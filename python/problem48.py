# Problem 48
# Find the last ten digits of the series ...

LOWER = 1
UPPER = 1000
NUM_DIGITS = 10


if __name__ == '__main__':
	seriesSum = 0
	for value in range(LOWER,UPPER + 1):
		seriesSum += value ** value
	seriesSum = str(seriesSum)
	print seriesSum[len(seriesSum)-NUM_DIGITS:len(seriesSum)]
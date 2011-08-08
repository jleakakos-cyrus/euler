# Problem 19
# How many Sundays fell on the first month durin the twentieth centry?

import calendar

START_YEAR = 1901
END_YEAR = 2000

def problem19():
	c = calendar.Calendar()
	sum = 0
	for year in range(START_YEAR, END_YEAR + 1):
		for month in range(1, 13):
			iter = c.itermonthdays2(year, month)
			first = iter.next()
			while (first[0] != 1):
				first = iter.next()
			if (first[1] == 6):
				sum += 1
	return sum

if __name__ == '__main__':
	print problem19()
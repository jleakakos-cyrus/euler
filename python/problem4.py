# Problem 4
# Find the largest palindrome made from the product of two 3-digit numbers.

twoDigitNumbers = range(10, 100)
twoDigitNumbers.reverse()
threeDigitNumbers = range(100, 1000)
threeDigitNumbers.reverse()
fourDigitNumbers = range(1000, 10000)
fourDigitNumbers.reverse()
def palindromic (list):
	largest = 0
	for first in list:
		for second in list:
			value = first * second
			if (isPalindrome(value)):
				if (value > largest):
					largest = value
	return largest

def isPalindrome (number):
	palindrome = str(number)
	length = len(palindrome)
	while(len(palindrome) > 1):
		if (palindrome[0] == palindrome[len(palindrome) - 1]):
			palindrome = palindrome[1:len(palindrome) - 1]
		else:
			return False
	return True

if __name__ == '__main__':
	print palindromic(threeDigitNumbers)
	#print palindromic(fourDigitNumbers)
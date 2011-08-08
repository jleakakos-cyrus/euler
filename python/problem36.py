# Problem 36
# Find the sum of all numbers, less than one million, which are palindromic in base 10 and base 2.

def isPalindrome (number):
	palindrome = str(number)
	length = len(palindrome)
	while(len(palindrome) > 1):
		if (palindrome[0] == palindrome[len(palindrome) - 1]):
			palindrome = palindrome[1:len(palindrome) - 1]
		else:
			return False
	return True

def decimalToBinary(number):
	binaryNumber = ''
	while (number >= 1):
		remainder = number % 2
		number = int(number / 2)
		binaryNumber += str(remainder)
	binaryNumber = [letter for letter in binaryNumber]
	binaryNumber.reverse()
	retval = ''
	for letter in binaryNumber:
		retval += letter
	return retval

def problem36(upperLimit):
	paliSum = 0
	for value in range (1, upperLimit):
		if (isPalindrome(value) and isPalindrome(decimalToBinary(value))):
			paliSum += value
	return paliSum

if __name__ == '__main__':
	print problem36(1000000)
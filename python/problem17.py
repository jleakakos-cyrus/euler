# Problem 17
# How many letters are used in writing out all of the numbers
# from 1 to 1000 in english?

from math import pow

onesToEnglish = {	1: 'one', 
				2: 'two', 
				3: 'three', 
				4: 'four', 
				5: 'five', 
				6: 'six', 
				7: 'seven',
				8: 'eight', 
				9: 'nine',
				0: ''}
				
placeToEnglish = {	1: '',
				10: 'and',
				100: 'hundred',
				1000: 'thousand'}
				
teensToEnglish = {	10: 'ten',
				11: 'eleven', 
				12: 'twelve', 
				13: 'thirteen', 
				14: 'fourteen', 
				15: 'fifteen', 
				16: 'sixteen', 
				17: 'seventeen', 
				18: 'eighteen', 
				19: 'nineteen'}
				
tensToEnglish = {	1: 'ten',
				2: 'twenty',
				3: 'thirty', 
				4: 'forty', 
				5: 'fifty', 
				6: 'sixty', 
				7: 'seventy', 
				8: 'eighty', 
				9: 'ninety'}

def numberToEnglish(number):
	if (number == 0):
		return 'zero'
	text = str(number)
	result = buildTensPlace(text)
	result = buildHundredsPlace(text) + result
	return result

def buildHundredsPlace(text):
	hundredsValue = text[len(text)-3:len(text)-2]
	if (hundredsValue == ''):
		return ''
	result = onesToEnglish[int(hundredsValue)] + ' '
	result += placeToEnglish[100]
	if (int(text) % 100 != 0):
		result += ' '+ placeToEnglish[10] + ' '
	return result

def buildTensPlace(text):
	result = ''
	tens = int(text[len(text)-2:len(text)])
	if (tens < 10):
		result = onesToEnglish[tens]
	elif (tens >= 10 and tens <=19):
		result = teensToEnglish[tens]
	elif (tens > 19):
		ten = int(str(tens)[0:1])
		one = int(str(tens)[1:2])
		if (one == 0):
			result = tensToEnglish[ten]
		else:
			result = tensToEnglish[ten] + '-' + onesToEnglish[one]
	return result

def countLength(number):
	text = number.replace('-','').replace(' ','')
	return len(text)

def problem17(upperLimit):
	sum = 0
	for value in range(1, upperLimit):
		text = numberToEnglish(value)
		sum += countLength(text)
	return sum + len('onethousand')

if __name__ == '__main__':
	print problem17(1000)
	for i in range(100, 201):
		print numberToEnglish(i)






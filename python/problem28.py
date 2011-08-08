# Problem 28
# What is the sum of the numbers on the diagonals in a 1001 x 1001 spiral formed in the same way?
import math

SIZE = 1001

def problem28(size):
	# The number of squares filled in and 
	totalFilled = 1
	move = 1
	
	MAX = size * size
	x = math.floor(size/2)
	y = math.floor(size/2)
	square = []
	# Initialize the grid
	for i in list(range(size)):
		temp = []
		for j in list(range(size)):
			temp.append(0)
		square.append(temp)
		
	# Populate the grid
	square[x][y] = totalFilled
	totalFilled += 1
	direction = 'right'
	while totalFilled < MAX:
		if direction == 'right':
			for amount in list(range(move)):
				#print(x, y, totalFilled, move)
				y += 1
				square[x][y] = totalFilled
				totalFilled += 1
				if totalFilled == MAX + 1:
					break
			direction = 'down'
		elif direction == 'down':
			for amount in list(range(move)):
				#print(x, y, totalFilled, move)
				x += 1
				square[x][y] = totalFilled
				totalFilled += 1
			direction = 'left'
			move += 1
		elif direction == 'left':
			for amount in list(range(move)):
				#print(x, y, totalFilled, move)
				y -= 1
				square[x][y] = totalFilled
				totalFilled += 1
			direction = 'up'
		elif direction == 'up':
			for amount in list(range(move)):
				#print(x, y, totalFilled, move)
				x -= 1
				square[x][y] = totalFilled
				totalFilled += 1
			direction = 'right'
			move += 1
	sum = 0
	for k in list(range(size)):
		#print(k)
		sum += square[k][k]
		sum += square[k][size-k-1]
	print(sum - 1)

def problem28fun(size):
	MAX = size * size
	value = 1
	increment = 2
	sum = 1
	while value < MAX:
		for i in list(range(4)):
			value += increment
			sum += value
		increment += 2
	print('fun', sum)

if __name__ == '__main__':
	'''problem28(5)
	problem28(7)
	problem28(9)'''
	#problem28(SIZE)
	problem28fun(5)
	problem28fun(7)
	problem28fun(9)
	problem28fun(SIZE)
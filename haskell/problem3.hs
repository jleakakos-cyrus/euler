-- Problem 3
-- What is the largest prime factor of the number 600851475143?
-- Uses Integer instead of Int because of the size of the number.

p3 :: (Integral a) => [a]
p3 = [y | y <- [x | x <- [2..600851475143], 600851475143 `mod` x == 0], isPrime y]

isPrime :: (Integral a) => a -> Bool
isPrime n
  | n == 0 = False
  | n == 1 = False
  | n == 2 = True
  | even n = False
  | otherwise = null [x | x <- [3..(ceiling $ sqrt $ fromIntegral n)], n `mod` x == 0]
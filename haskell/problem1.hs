-- Problem 1
-- Find the sum of all the multiples of 3 or 5 below 1000.

problem :: Int
problem = p1

p1 :: Int
p1 = sum (takeWhile (<1000) [ x | x <- [1..], x `mod` 5 == 0 || x `mod` 3 == 0])
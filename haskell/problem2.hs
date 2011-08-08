-- Problem 2
-- Find the sum of all the even-valued terms in the fibonacci sequence which do not exceed four million.

p2 :: Int
p2 = sum (takeWhile (<4000000) [x | x <- fibs, even x])

fibs :: [Int]
fibs = 0 : 1 : zipWith (+) fibs (tail fibs)
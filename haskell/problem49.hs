-- Problem 49

import Data.List

problem49 = [(a,b,c) | a <- primes,
                       b <- dropWhile (<= a) primes,
                       sort (show a) == sort (show b),
                       let c = 2 * b - a,
                       c `elem` primes,
                       sort (show a) == sort (show c)]

primes = filter isPrime [1000..9999]

isPrime :: Int -> Bool
isPrime n
  | n == 0 = False
  | n == 1 = False
  | n == 2 = True
  | even n = False
  | otherwise = null [x | x <- [3..(ceiling $ sqrt $ fromIntegral n)], n `mod` x == 0]

-- Problem 41

import Data.List

problem41 :: Int
problem41 = maximum $ takeWhile (<1987654322) [read $ concatMap (show) x :: Int | x <- (permutations [1..7]), isPrime $ read $ concatMap (show) x]

isPrime :: (Integral a) => a -> Bool
isPrime n
  | n == 0 = False
  | n == 1 = False
  | n == 2 = True
  | even n = False
  | otherwise = null [x | x <- [3..(ceiling $ sqrt $ fromIntegral n)], n `mod` x == 0]


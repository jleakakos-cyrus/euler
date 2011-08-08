-- Problem 47
-- Find the first four consecutive integers to have four distinct primes factors. What is the first of these numbers?

import Data.List

main = putStrLn $ show problem47

problem47 :: Int
problem47 = head $ dropWhile (\x -> not $ distinctPrimes x 4) [645..]

getNextPrime :: Int -> Int
getNextPrime n 
  | isPrime $ n+1 = (n+1)
  | isPrime $ n+2 = (n+2)
  | otherwise = getNextPrime $ n+2

isPrime :: Int -> Bool
isPrime n
  | n == 0 = False
  | n == 1 = False
  | n == 2 = True
  | even n = False
  | otherwise = null [x | x <- [3..(ceiling $ sqrt $ fromIntegral n)], n `mod` x == 0]

getPrimeFactors :: Int -> [Int]
getPrimeFactors n 
  | n == 1 = []
  | otherwise = getPrimeFactors' n 2 []

getPrimeFactors' :: Int -> Int -> [Int] -> [Int]
getPrimeFactors' n p ps
  | isPrime n = (n:ps)
  | n `mod` p == 0 = getPrimeFactors' (n `div` p) p (p:ps)
  | otherwise = getPrimeFactors'  n (getNextPrime p) ps

distinctPrimes :: Int -> Int -> Bool
distinctPrimes n p = all ((==p) . length . nub . getPrimeFactors) [n..n+p-1] 

-- Problem 23
-- Find the sum of all the positive integers which cannot be written as the sum of two abundant numbers.
-- All integers over 28123/28123 can be written as a sum of two abundant numbers.

import Data.List

p23 :: (Integral a) => a
p23 =  sum [x | x <- [1..28123 ], not $ inSums x (listOfSums getAbundantNumbers)]

inSums :: (Integral a) => a -> [a] -> Bool
inSums n ans = n `elem` takeWhile (<=n) ans

listOfSums :: (Integral a) => [a] -> [a]
listOfSums abs  = [x+y | x <- abs, y <- abs, (x+y) < 28123 ]

getAbundantNumbers :: (Integral a) => [a]
getAbundantNumbers =  [x | x <- [12..28123], isAbundant x]
--getAbundantNumbers = [12..28123] \\ getAbundantNumbers' [12..28123] 0

getAbundantNumbers' :: (Integral a) => [a] -> Int -> [a]
getAbundantNumbers' ns e
  | (e == (length ns)) = ns
  | isAbundant (ns !! e) = getAbundantNumbers' [x | x <- ns, x `mod` (ns !! e) /= 0] e
  | otherwise = getAbundantNumbers' ns (e+1)

getFactors :: (Integral a) => a -> [a]
getFactors n = takeWhile (< (div n 2) + 1) [x | x <- [1..], n `mod` x == 0]

isAbundant :: (Integral a) => a -> Bool
isAbundant n
--  | (sum (getFactors n) > n) = True
  | (sumFactors n) > (2*n) = True
  | otherwise = False

sumFactors :: (Integral a) => a -> a
sumFactors n = sumFactors' (getPrimeFactors n)


sumFactors' :: (Integral a) => [a] -> a
sumFactors' [] = 1
sumFactors' (p:ps) = (getSum (p:getRepeats) 1) * (sumFactors' getRest)
  where getRepeats = takeWhile (>= p) [x | x <- ps]
        getRest = dropWhile (>= p) [x | x <- ps]

getSum :: (Integral a) => [a] -> a -> a
getSum [] _ = 1
getSum (p:ps) n = p^n + (getSum ps (n+1))
  
getPrimeFactors :: (Integral a) => a -> [a]
getPrimeFactors n = getPrimeFactors' n 2 []

getPrimeFactors' :: (Integral a) => a -> a -> [a] -> [a]
getPrimeFactors' 1 _ fs = fs
getPrimeFactors' n p fs
  | (n `mod` p == 0) = getPrimeFactors' (n `div` p) p (p:fs)
  | otherwise = getPrimeFactors' n (getNextPrime p) fs
  
getNextPrime :: (Integral a) => a -> a
getNextPrime n 
  | isPrime $ n+1 = (n+1)
  | isPrime $ n+2 = (n+2)
  | otherwise = getNextPrime $ n+2

isPrime :: (Integral a) => a -> Bool
isPrime n
  | n == 0 = False
  | n == 1 = False
  | n == 2 = True
  | even n = False
  | otherwise = null [x | x <- [3..(ceiling $ sqrt $ fromIntegral n)], n `mod` x == 0]

-- P37
import Control.Monad
import Data.Char

primes :: [Int]
primes = [x | x <- [11,13..], isPrime x]

-- main = putStrLn $ show $ sum p37


p37 :: [Int]
p37 =  take 11 [x | x <- primes, hGood x, tGood x, lTruncatable x, rTruncatable x]
       where hGood n = (digitToInt $ head $ show n) `elem` [2,3,5,7]
             tGood n = (digitToInt $ last $ show n) `elem` [3,7]

lTruncatable :: Int -> Bool
lTruncatable n
  | (length $ show n) == 1 && isPrime n = True
  | (length $ show n) == 1 && (not (isPrime n)) = False
  | isPrime n = lTruncatable $ read $ tail $ show n
  | otherwise = False

rTruncatable :: Int -> Bool
rTruncatable n
  | (length $ show n) == 1 && isPrime n = True
  | (length $ show n) == 1 && (not (isPrime n)) = False
  | isPrime n = rTruncatable $ read $ init $ show n
  | otherwise = False

isPrime :: Int -> Bool
isPrime n
  | n == 0 = False
  | n == 1 = False
  | n == 2 = True
  | even n = False
  | otherwise = null [x | x <- [3..(ceiling $ sqrt $ fromIntegral n)], n `mod` x == 0]

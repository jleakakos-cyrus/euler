-- Problem 112
-- Bouncy numbers
-- Find the least number for which the proportion of bouncy numbers is exactly 99%

import Char

main = putStrLn $ show $ problem112

problem112 = problem112' 0 1

problem112' :: Int -> Int -> (Int, Int)
problem112' b n
  | (fromIntegral (b) / fromIntegral (n-1)) == 0.99 = (b, n-1)
  | isBouncy n = problem112' (b+1) (n+1)
  | otherwise = problem112' b (n+1)

isBouncy :: Int -> Bool
isBouncy i = not ((increasing $ show i) || (decreasing $ show i))

increasing :: [Char] -> Bool
increasing (i:is)
  | null is = True
  | (digitToInt (head is)) >= (digitToInt i) = increasing is
  | otherwise = False

decreasing :: [Char] -> Bool
decreasing (i:is)
  | null is = True
  | (digitToInt (head is)) <= (digitToInt i) = decreasing is
  | otherwise = False

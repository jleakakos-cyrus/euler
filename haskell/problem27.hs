-- Problem 27
-- Find the product of the coefficients, and and b for the quadratic expression that
-- produces the maximum number of primes for consecutive values of n, starting with n = 0.

import Control.Monad
import Data.List

main = putStrLn $ show $ take 10 $ sortBy (pSort) pxs

as :: [Int]
as = [-999..999]

bs :: [Int]
bs = filter (isPrime) [-999..999]

p27 :: Int
p27 = length coefs
  where coefs = [(x,y) | x <- [-999..999], y <- [-999..999]]

quadratic :: Int -> Int -> (Int -> Int)
quadratic a b = (\n -> (n * n) + (n * a) + b)

isPrime :: (Integral a) => a -> Bool
isPrime n
  | z == 0 = False
  | z == 1 = False
  | z == 2 = True
  | even z = False
  | otherwise = null [x | x <- [3..(ceiling $ sqrt $ fromIntegral z)], z `mod` x == 0]
  where z = abs(n)

pxs = do
  x <- as
  y <- as
  guard(isPrime y)
  guard(isPrime (x + y + 1))
  let psize= length (takeWhile (isPrime) (map (quadratic x y) [0..]))
  return ((x * y), psize)

pSort (_,n1) (_,n2)
  | n1 > n2 = LT
  | n1 < n2 = GT
  | n1 == n2 = GT 

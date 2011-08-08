-- Problem 104
-- Find the fibonacci number where the first and last 9 digits are pandigital 1-9

import Data.List

main = putStrLn $ show problem104

fibs = 1:1:zipWith (+) fibs (tail fibs)

isPandigital :: [Char] -> Bool
isPandigital n = "123456789" == (sort n) 

bothPandigital :: (Integral a) => a -> Bool
bothPandigital n = hP && tP
  where
    hP = isPandigital (sort $ show $ n `mod` 1000000000)
    tP = isPandigital (sort $ take 9 $ show n)

problem104 =  1 + (length  $ takeWhile (not . bothPandigital) fibs)

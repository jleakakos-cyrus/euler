import Data.Char

problem34 :: Int
problem34 = sum [x | x <- [3..100000], sum (map (\n -> product [1..n]) (map digitToInt $ show x)) == x ]

-- Factorial
-- map (\n -> product [1..n] LIST

-- Split and Int into a list of its digits
-- map digitToInt $ show NUMBER

-- If the sum of the mapping of the factorial over the list is the same as the number itself, it passes the filter.

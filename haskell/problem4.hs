-- Problem 3
-- Find the largest palindrome made from the product of two 3-digit numbers.

p4 :: Int
p4 = maximum [x*y | x <- [100..999], y <- [100..999], isPalindrome $ x*y]

isPalindrome :: Int -> Bool
isPalindrome n = show n == (reverse $ show n)
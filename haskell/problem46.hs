-- Problem 46
-- What is the smallest odd composite that cannot be written as the sum of a prime and twice a square?
-- c = p + 2s

composites = [n | n <- [9,11..], not $ isPrime n]

primes = [n | n <- (2:[3,5..]), isPrime n]

somePrimes z = takeWhile (<z) primes

squares = [n*n | n <- [1..]]

someSquares z = takeWhile (<z) squares

p46 = Int
p46 = head $ dropWhile (conjecture) composites

isPrime :: Int -> Bool
isPrime n
  | n == 0 = False
  | n == 1 = False
  | n == 2 = True
  | even n = False
  | otherwise = null [x | x <- [3..(ceiling $ sqrt $ fromIntegral n)], n `mod` x == 0]

conjecture :: Int -> Bool
conjecture c = length [c | p <- somePrimes c, s <- someSquares c, p + 2 * s == c ] > 0

import Data.List

primes n = filter isPrime [n..]

-- maximumBy (\x y -> compare (length x) (length y)) z

main = print (sum ls, length ls)
  where ls = problem50

problem50 = maximumBy (\x y -> compare (length x) (length y)) [ls | p <- take 100 (primes 2), let ls = p50 p, isPrime $ sum ls]

p50 n = last $ takeWhile (\ns -> sum ns < 1000000) [take z (primes n) | z <- [1..]]

isPrime :: Int -> Bool
isPrime n
  | n == 0 = False
  | n == 1 = False
  | n == 2 = True
  | even n = False
  | otherwise = null [x | x <- [3..(ceiling $ sqrt $ fromIntegral n)], n `mod` x == 0]

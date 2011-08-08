-- Problem 7
-- What is the 10001^(st) prime number?

p6 :: (Integral a) => a
p6 = p6' 1 2

p6' :: (Integral a) => a -> a -> a
p6' n p
  | n == 10001 = p
  | otherwise = p6' (n+1) (getNextPrime p)

{-  
p6' :: (Integral a) => a -> a -> a
p6' n p
  | n >= 10001 = p
  | otherwise = p6' $ n+1 $ getNextPrime p
-}
  
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
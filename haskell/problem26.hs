import Data.List

nums = [ n | n <- [3,5..], n `mod` 5 /= 0 ]
 
period n =
    head $ [ p | p <- [1..], (10^p - 1) `mod` n == 0 ]
 
answer =
    fst $
    maximumBy (\(_,a) (_,b) -> compare a b) $
    map (\n -> (n,period n)) $
    takeWhile (<1000) nums


isPrime :: Int -> Bool
isPrime n
  | n == 0 = False
  | n == 1 = False
  | n == 2 = True
  | even n = False
  | otherwise = null [x | x <- [3..(ceiling $ sqrt $ fromIntegral n)], n `mod` x == 0]

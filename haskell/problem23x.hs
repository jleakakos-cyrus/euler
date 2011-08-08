-- Problem 23
-- Find the sum of all the positive integers which cannot be written as the sum of two abundant numbers.
-- All integers over 28123 can be written as a sum of two abundant numbers.

import Data.List
import Data.IntSet (toList, fromList)

main :: IO () 
-- main = putStrLn $ show (sum $ p23' (getAbundantNumbers 12 28123) 12 [])
main = putStrLn $ show problem

problem = sum [1..28123] - (sum $ nub' $ genSums abundants)
--problem = sum [1..20161] - (sum $ nub' (genSums $ getAbundantNumbers 10 28123))
  where nub' = toList . fromList
        abundants  = filter (\x -> x < sum (getProperDivisors x)) [1..28123]
        genSums xs = [(x+y) | x <- xs, y <- xs, (x+y) < 28123]

p23 :: Int
p23 = sum $ p23' (getAbundantNumbers 12 28123) 12 []

p23' :: [Int] -> Int -> [Int]-> [Int]
p23' (an:ans) sum accum
  | sum > 28123 = accum
  | (notSumOfAbundant sum (an:ans)) = p23' (an:ans) (sum+1) $ sum:accum
  | otherwise = p23' (an:ans) (sum+1) accum

notSumOfAbundant :: Int -> [Int] -> Bool
notSumOfAbundant sum (x:xs) = notSumOfAbundant' sum (getAbundantNumbers 12 28123) (x:xs)

notSumOfAbundant' :: Int -> [Int] -> [Int] -> Bool
notSumOfAbundant' sum (y:ys) (x:xs)
  | null sums = True
  | null ys = True
  | null xs = notSumOfAbundant' sum (head ys:tail ys) (x:xs)
  | last sums == sum = False
  | otherwise = notSumOfAbundant' sum (head ys:tail ys) (head xs:tail xs)
  where sums = takeWhile (<= sum) ((x+y):[x+n | n <- xs])  

getAbundantNumbers :: Int -> Int -> [Int]
getAbundantNumbers a z =  [x | x <- [a..z], isAbundant x]

getAbundantNumbers' :: [Int] -> [Int] -> [Int]
getAbundantNumbers' (n:ns) accum
  | null ns && (isAbundant n) = [12..10000] Data.List.\\ accum
  | null ns                   = [12..10000] Data.List.\\ (n:accum)
  | isAbundant n = getAbundantNumbers' (filter (\x -> x `mod` n /= 0) ns) accum
  | otherwise = getAbundantNumbers' ns $  n:accum

filterTest :: Int -> [Int] -> [Int]
filterTest n xs = filter (\x -> x `mod` n /= 0) xs

getProperDivisors :: Int -> [Int]
getProperDivisors n = getProperDivisors' n 2 [1]

getProperDivisors' :: Int -> Int -> [Int] -> [Int]
getProperDivisors' n d ds
  | n `mod` d == 0 && n `div` d == d = d:ds
  | n `mod` d == 0                   = getProperDivisors' n (d+1) (d:(n `div` d):ds)
  | d < (ceiling $ sqrt $ fromIntegral n) = getProperDivisors' n (d+1) ds
  | otherwise = ds

isAbundant :: Int -> Bool
isAbundant n
  | (sum (getProperDivisors n) > n) = True
  | otherwise = False

listOfSums :: [Int] -> [Int] -> [Int] -> [Int]
listOfSums (x:xs) (y:ys) accum
  | not $ null xs = listOfSums (head xs:tail xs) (y:ys) (x:accum)
  | not $ null ys = listOfSums abs (head ys:tail ys) accum
  | otherwise = Data.List.nub accum
  where abs = getAbundantNumbers 12 28123


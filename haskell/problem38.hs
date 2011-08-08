import Data.List

-- possibleIntegers = [1..987654321]
possibleIntegers = [9123..10000]
lowestN = 2

main = print problem38

problem38 = maximum [iv | i <- possibleIntegers, n <- [1..6], let sv = getStringValue i n, let iv = read sv :: Int, isPandigital sv, iv < 987654321 ]

toInts :: [String] -> [Int]
toInts ps = map read ps

isPandigital :: [Char] -> Bool
isPandigital n = (length n) == 9 && ((find (\x -> x == '0') n) == Nothing) && (length n) == (length $ nub n)

getStringValue :: Int -> Int -> [Char]
getStringValue i n = concat $ map (show . (i*)) [1..n]

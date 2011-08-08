-- Problem 43
-- Find the sum of all 0 to 9 pandigital numbers with this property:
-- d2d3d4=406 is divisible by 2
-- d3d4d5=063 is divisible by 3
-- d4d5d6=635 is divisible by 5
-- d5d6d7=357 is divisible by 7
-- d6d7d8=572 is divisible by 11
-- d7d8d9=728 is divisible by 13
-- d8d9d10=289 is divisible by 17

import Data.List
import Control.Monad


-- main = putStrLn $ show $ sum p43

pandigitals = permutations [0..9]

fromDigits = foldl ((+).(*10)) 0

p43 = do
  p <- pandigitals
  guard((fromDigits $ drop 1 $ take 4 p) `mod` 2 == 0)
  guard((fromDigits $ drop 2 $ take 5 p) `mod` 3 == 0)
  guard((fromDigits $ drop 3 $ take 6 p) `mod` 5 == 0)
  guard((fromDigits $ drop 4 $ take 7 p) `mod` 7 == 0)
  guard((fromDigits $ drop 5 $ take 8 p) `mod` 11 == 0)
  guard((fromDigits $ drop 6 $ take 9 p) `mod` 13 == 0)
  guard((fromDigits $ drop 7 $ take 10 p) `mod` 17 == 0)
  return $ fromDigits p

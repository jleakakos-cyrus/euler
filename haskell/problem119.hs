-- Problem 119

import Data.Char
import Data.List

problem119 = take 30 $ sort [b^e | b <-[2..200], e <- [2..9], let v = b^e, b == sumDigits v] 

sumDigits n = sum $ map (toInteger . digitToInt) $ show n

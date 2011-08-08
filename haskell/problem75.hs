-- Problem75

import Data.List

-- problem75 :: Int
problem75 = length $ takeWhile (\x -> length x == 1) $  sortBy (\xs ys -> compare (length xs) (length ys)) $ group $ sort [n*p | p <- triples, n <- [1..1500000 `div` p]]

triples :: [Int]
triples = [p | n <- [1..floor(sqrt(1500000))], m <-[n+1..floor(sqrt(1500000))], even n || even m, gcd n m == 1, let p = (m^2 - n^2) + (2 * m * n) + (m^2 + n^2), p <= 1500000]

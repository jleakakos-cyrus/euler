-- Problem 39
import Data.List

example = nubBy (\(a, b, _) (x, y, _) -> a + b == x + y) [(a,b,c) | a <- [1..120], b <- [1..120], c <- [1..120], a + b + c == 120, a * a + b * b == c * c]

solutions :: Int -> [(Int, Int, Int)]
solutions p = nubBy (\(a, b, _) (x, y, _) -> a + b == x + y) [(a,b,c) | a <- [1..p], b <- [a..p], c <- [b..p], a + b + c == p, a * a + b * b == c * c]

problem39 :: Int
problem39 = head $ head $ sortBy (\xs ys -> compare (length ys) (length xs)) $ group $ sort [n*p | p <- triples, n <- [1..1000 `div` p]]

triples :: [Int]
triples = [p | n <- [1..floor(sqrt(1000))], m <-[n+1..floor(sqrt(1000))], even n || even m, gcd n m == 1, let p = (m^2 - n^2) + (2 * m * n) + (m^2 + n^2), p < 1000]

-- P53

p53 :: Int
p53 = length [1 | x <- [2..100], y <- [2..x], combination x y > 1000000] 

combination :: Double -> Double -> Double
combination n r = (fact n) / ((fact r) * (fact (n - r)))
                 where fact = (\x -> product [1..x])

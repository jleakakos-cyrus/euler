target = 2000000
upperBound = 100
allValues = [(a,b) | a <- [1..upperBound], b <- [1..upperBound]]

formula x y = truncate $ (x * x + x) * (y * y + y) / 4

problem85 = problem85' (1,1,1) allValues

problem85' k@(v,a1,a2) (z@(a,b):zs)
  | null zs = k
  | over && closer = problem85' (value, a, b) zs
  | otherwise = problem85' (v, a1, a2) zs
  where value = formula a b
        form = target - value
        over = form >= 0
        closer = value > v

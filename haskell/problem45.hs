-- Problem 45

problem45 = head $ dropWhile (\n -> not ((isPentagonal $ triangle n) && (isHexagonal $ triangle n))) [286..]

triangle n = truncate $ n * (n + 1) / 2

pentagonal n = truncate $ n * (3*n - 1) / 2

hexagonal n = truncate $ n * (2*n -1)

isPentagonal :: (Integral a) => a -> Bool
isPentagonal t = truncate (root t) == ceiling (root t)
  where 
    root n = (1.0 + sqrt (fromIntegral(1 + 24*n))) / 6.0

isHexagonal :: (Integral a) => a -> Bool
isHexagonal t = truncate (root t) == ceiling (root t)
  where 
    root n = (1.0 + sqrt (fromIntegral(1 + 8*n))) / 4.0

-- Problem 55

ns :: [Integer]
ns = [1..10000]

reverseNum = read . reverse . show

isPalindrome :: Integer -> Bool
isPalindrome n = (show n) == (reverse $ show n)

problem55 :: Int
problem55 = 10000 - (length [n | n <- ns, lychrel n])

lychrel :: Integer -> Bool
lychrel n = lychrel' 1 n

lychrel' :: Int -> Integer -> Bool
lychrel' c n 
  | c < 50 && (isPalindrome (n + reverseNum n)) = True
  | c >= 50 = False
  | otherwise = lychrel' (c+1) (n + reverseNum n)

-- [1,2,5,10,20,50,100,200]


main = print problem31

problem31 = count 200 ((length coins) - 1)

coins = [1, 2, 5, 10, 20, 50, 100, 200]

count :: Int -> Int -> Int
count target coinindex 
  | target == 0                  = 1
  | target < 0                   = 0
  | target >= 1 && coinindex < 0 = 0
  | otherwise                    = (count target (coinindex-1)) + (count (target-(coins!!coinindex)) coinindex)

-- Problem 32
import Data.List

-- length $ nub $ [q | ps <- perms, n <- [1..7], p <- [n+1..8], q <- [p+1..9], m1 > 0] where m1 = take n perms

main = putStrLn $ show problem32

perms = permutations [1..9]

-- For each permutation, iterate through all slices that can be legitmate products.
-- Sum up the unique products (p) which meet the criteria (n * p = q).
problem32 :: Int
problem32 = sum $ nub [(prod p perm) | perm <- perms, n <- [1..7], p <- [n+1..8], q <- [p+1..9], (m1 n perm) * (m2 n p perm) == (prod p perm)]
  where 
    m1 n perm = fromDigits $ take n perm
    m2 n p perm = fromDigits $ take (p-n) $ drop n perm
    prod p perm = fromDigits $ drop p perm

fromDigits = foldl ((+).(*10)) 0

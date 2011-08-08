-- Problem 102
-- use triangles.txt
-- -1000 <= x,y <= 1000
-- Use determinant to determine where a point exists, relative to a line.
-- When all of the signs are the same, the point exists on the same side
--  of each line, relative to each vector pair (inside the triangle in
--  this case.
import Control.Monad
import System.IO
import Data.List
import Char

problem102 = do
  x <- readFile "triangles.txt"
  let ts = map (splitIntoPoints) (lines x)
  let ns = filter (originInTriangle) ts
  return $ length ns

splitIntoPoints :: [Char] -> [Int]
splitIntoPoints xs 
  | null $ snd split = (read $ fst split) : []
  | otherwise = (read $ fst split) : (splitIntoPoints $ tail $ snd split)
  where split = span (/= ',') xs

originInTriangle :: [Int] -> Bool
originInTriangle (x0:y0:x1:y1:x2:y2:[]) = sameSign (c10:c21:c01:[])
  where
    c10 = (x1*y0-x0*y1)
    c21 = (x2*y1-x1*y2)
    c01 = (x0*y2-x2*y0)
    sameSign cs = all (<0) cs || all (>0) cs

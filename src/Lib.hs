module Lib
    ( twoSum, f
    ) where

twoSum :: [Int] -> Int -> (Int, Int)
twoSum nums target =
  head [(i, j) |  (x, i) <- zip nums [0..],
                  (y, j) <- zip nums [0..],
                  i < j, x + y == target]

f :: Int -> Int
f _ = 9

module Lib
    ( twoSum, id
    ) where

twoSum :: [Int] -> Int -> (Int, Int)
twoSum nums target =
  head [(i, j) |  (x, i) <- zip nums [0..],
                  (y, j) <- zip nums [0..],
                  i < j, x + y == target]

id :: Int -> Int
id a = a

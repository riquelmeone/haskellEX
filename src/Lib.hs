module Lib
    ( twoSum, myId, f
    ) where

twoSum :: [Int] -> Int -> (Int, Int)
twoSum nums target =
  head [(i, j) |  (x, i) <- zip nums [0..],
                  (y, j) <- zip nums [0..],
                  i < j,
                  x + y == target]


f :: Int -> (Int, Int)
f x = twoSum [2, 7, 11, 15] x


myId :: Int -> Int
myId a = a

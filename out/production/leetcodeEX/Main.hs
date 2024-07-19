module Main (main) where

import Lib

main :: IO ()
main = do
  let nums = [2, 7, 11, 15] :: [Int]
  let target = 9
  let res = twoSum nums target 
  print res

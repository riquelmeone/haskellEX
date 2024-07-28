module Lib
    ( twoSum, myId, f, toText
    ) where
      
import qualified Data.Text.Lazy as TL

twoSum :: [Int] -> Int -> (Int, Int)
twoSum nums target =
  head [(i, j) |  (x, i) <- zip nums [0..],
                  (y, j) <- zip nums [0..],
                  i < j,
                  x + y == target]
                  

f :: Int -> (Int, Int)
f = twoSum [2, 7, 11, 15]

toText :: (Int, Int) -> TL.Text
toText = TL.pack . show

myId :: Num a => a -> a 
myId x = x
  
module Lib
    ( twoSum, myId, f, toText, fibList, parseNums
    ) where
      
import qualified Data.Text.Lazy as TL
import Text.Read (readMaybe)

twoSum :: [Int] -> Int -> (Int, Int)
twoSum nums target =
  head [(i, j) |  (x, i) <- zip nums [0..],
                  (y, j) <- zip nums [0..],
                  i < j,
                  x + y == target]
                  
f :: Int -> (Int, Int)
f = twoSum [1, 2, 3, 4, 7, 11, 15, 16, 17, 18]

toText :: Show a => a -> TL.Text
toText = TL.pack . show

myId :: Num a => a -> a 
myId x = x

fibList :: [Int]
fibList = 0 : 1 : zipWith (+) fibList (tail fibList)






-- Convert a comma-separated string to a list of Ints
parseNums :: String -> Maybe [Int]
parseNums s = mapM (readMaybe . TL.unpack) (TL.splitOn (TL.pack ",") (TL.pack s))
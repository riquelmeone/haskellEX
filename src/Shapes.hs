module Shapes (Shape(..), describeShape) where

data Shape = Circle Float           -- Circle with radius
           | Rectangle Float Float  -- Rectangle with width and height
           | Square Float           -- Square with side length
           deriving Show            -- deriving Show is like automatically implementing the toString() method for a class in Java

describeShape :: Shape -> String
describeShape shape = case shape of
    Circle r         -> "A circle with radius " ++ show r
    Rectangle w h    -> "A rectangle with width " ++ show w ++ " and height " ++ show h
    Square s         -> "A square with side length " ++ show s

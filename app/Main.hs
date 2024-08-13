{-# LANGUAGE OverloadedStrings #-}
module Main (main) where

import Lib

import Web.Scotty
import Network.Wai.Middleware.Cors (simpleCors)
import qualified Data.Text.Lazy as TL
import qualified Data.Text.Lazy.Encoding as TE
import Control.Monad.IO.Class
import Text.Read (readMaybe)


main :: IO ()
main = scotty 3000 $ do
    middleware simpleCors   -- CORS support

    get "/text" $ do
        content <- liftIO $ readFile "frontend/example.html"
        html $ TL.pack content
        
    get "/fibo/:n" $ do
        n <- pathParam "n"  -- http://localhost:3000/fibo/100
        let result = take n fibList
        html $ toText result

    get "/twosum" $ do
        numsStr <- queryParam "nums" -- http://localhost:3000/twosum?nums=1,2,3,4,7,11,15&target=18
        targetStr <- queryParam "target"
        let nums = parseNums numsStr
        let target = readMaybe targetStr :: Maybe Int
        case (nums, target) of
            (Just ns, Just t) -> do
                let result = twoSum ns t
                html $ toText result
            _ -> text "Invalid input parameters"

    post "/echo" $ do
        b <- body
        html $ TL.concat ["<h1>POST echo: ", TE.decodeUtf8 b, "</h1>"]


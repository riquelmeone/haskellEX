{-# LANGUAGE OverloadedStrings #-}
module Main (main) where

import Lib

import Network.Wai
import Network.Wai.Handler.Warp
import Network.HTTP.Types (status200, methodPost, methodPut, methodDelete)
import qualified Data.ByteString.Lazy as L
import qualified Data.ByteString.Lazy.Char8 as LC8

main :: IO ()
main = run 8080 app

app :: Application
app request respond = do
    let method = requestMethod request
    if method `elem` [methodPost, methodPut, methodDelete]
        then do
            body <- strictRequestBody request
            respond $ responseLBS status200 [("Content-Type", "text/plain")] body
        else
            respond $ responseLBS status200 [("Content-Type", "text/plain")] "Only POST, PUT, DELETE methods are supported"

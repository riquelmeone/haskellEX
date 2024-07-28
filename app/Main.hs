{-# LANGUAGE OverloadedStrings #-}
module Main (main) where

import Lib

import Web.Scotty
import Network.Wai.Middleware.Cors (simpleCors)
import qualified Data.ByteString.Lazy as BL
import qualified Data.Text.Lazy as TL
import qualified Data.Text.Lazy.Encoding as TE


main :: IO ()
main = scotty 3000 $ do
    middleware simpleCors

    get "/text" $ do
        html "<h1>Lorem ipsum</h1>"

    post "/echo" $ do
        b <- body
        html $ TL.concat ["<h1>POST echo: ", TE.decodeUtf8 b, "</h1>"]

{-# LANGUAGE OverloadedStrings #-}
module Main (main) where

import Lib

import Web.Scotty
import qualified Data.ByteString.Lazy as BL
import qualified Data.Text.Lazy as TL
import qualified Data.Text.Lazy.Encoding as TE

main :: IO ()
main = scotty 3000 $ do
    get "/text" $ do
        html "<h1>Lorem ipsum</h1>"
    post "/echo" $ do
        body <- body
        let bodyText = TE.decodeUtf8 (BL.toStrict body)
        text bodyText

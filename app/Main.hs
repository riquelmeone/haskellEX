{-# LANGUAGE OverloadedStrings #-}
module Main (main) where

import Lib

import Web.Scotty
import Network.Wai.Middleware.Cors (simpleCors)
import qualified Data.ByteString.Lazy as BL
import qualified Data.Text.Lazy as TL
import qualified Data.Text.Lazy.Encoding as TE
import Control.Monad.IO.Class


main :: IO ()
main = scotty 3000 $ do
    middleware simpleCors   -- CORS support

    get "/text" $ do
        content <- liftIO $ readFile "frontend/example.html"
        html $ TL.pack content
        
    get "/result" $ do
        let r = f 18
        html $ toText r

    post "/echo" $ do
        b <- body
        html $ TL.concat ["<h1>POST echo: ", TE.decodeUtf8 b, "</h1>"]


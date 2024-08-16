{-# LANGUAGE OverloadedStrings #-}
module Main (main) where

import Lib
import Shapes


import Web.Scotty
import Network.Wai.Middleware.Cors (simpleCors)
import qualified Data.Text.Lazy as TL
import qualified Data.Text.Lazy.Encoding as TE
import Control.Monad.IO.Class
import Text.Read (readMaybe)


main :: IO ()
main = scotty 3000 $ do
    middleware simpleCors   -- CORS support

    -- http://localhost:3000/text
    get "/text" $ do
        content <- liftIO $ readFile "frontend/example.html"
        html $ TL.pack content
        
    -- http://localhost:3000/fibo/100
    get "/fibo/:n" $ do
        n <- pathParam "n"
        let result = take n fibList
        html $ toText result
        
     -- http://localhost:3000/circle/4.5
    get "/circle/:f" $ do
        fText <- pathParam "f"  -- Extracting the parameter as Text
        let f = read (TL.unpack fText) :: Float  -- Convert Text to Float
        let shape = Circle f
        let result = describeShape shape
        html $ toText result

    -- http://localhost:3000/twosum?nums=1,2,3,4,7,11,15&target=18
    get "/twosum" $ do
        numsStr <- queryParam "nums" 
        targetStr <- queryParam "target"
        let nums = parseNums numsStr
        let target = readMaybe targetStr :: Maybe Int
        case (nums, target) of
            (Just ns, Just t) -> do
                let result = twoSum ns t
                html $ toText result
            _ -> text "Invalid input parameters"

    --  Invoke-WebRequest -Uri http://localhost:3000/echo -Method POST -Body "Hello, world!"
    -- file:///C:/Development/Haskell/haskellEX/frontend/index.html
    post "/echo" $ do
        b <- body
        html $ TL.concat ["POST echo: ", TE.decodeUtf8 b]


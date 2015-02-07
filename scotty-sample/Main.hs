{-# LANGUAGE OverloadedStrings #-}
import Web.Scotty

main = scotty 3000 $ do
  get "/" $ do
    html "gotten!"

  delete "/" $ do
    html "deleted!"

  post "/" $ do
    html "posted!"

  put "/" $ do
    html "put-ted"
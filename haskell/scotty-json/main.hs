{-# LANGUAGE OverloadedStrings #-}

import Control.Monad.IO.Class (liftIO)
import Data.Aeson (object, (.=))
import Network.HTTP.Types.Status
import Web.Scotty

showLandingPage :: ActionM ()
showLandingPage = do
  setHeader "Content-Type" "text/html"
  file "index.html"

businessLogic :: String -> IO (Maybe String)
businessLogic "a@b.com" = putStrLn "Registered!" >> return Nothing
businessLogic _ = return (Just "I broke :(")

registrationFailure :: ActionM ()
registrationFailure = do
  json $ object [ "error" .= ("Invalid request" :: String) ]
  status badRequest400

registration :: ActionM ()
registration = do
  emailAddress <- param "email" `rescue` (const next)
  registered <- liftIO (businessLogic emailAddress)

  case registered of
    Just errorMessage -> do
      json $ object [ "error" .= errorMessage ]
      status internalServerError500

    Nothing -> do
      json $ object [ "ok" .= ("ok" :: String) ]

server :: ScottyM ()
server = do
  get "/" showLandingPage
  post "/register" registration
  post "/register" registrationFailure

main :: IO ()
main = scotty 3000 server
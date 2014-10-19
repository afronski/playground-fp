module Person2 (
  Person2(..)
) where

data Person2 = Person2 { firstName :: String,
                         lastName :: String,
                         age :: Int
                       } deriving (Eq, Show, Read)

mikeD = Person2 { firstName = "Michael", lastName = "Diamond", age = 43 }
readMikeD = read "Person {firstName = \"Michael\", lastName = \"Diamond\", age = 43}" :: Person2
showMikeD = "MikeD is: " ++ show mikeD 
isItAMikeD = mikeD == Person2 { firstName = "Michael", lastName = "Diamond", age = 43 }

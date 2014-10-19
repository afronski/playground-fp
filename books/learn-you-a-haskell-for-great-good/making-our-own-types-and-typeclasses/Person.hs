module Person (
  Person(..)
) where

data Person = Person { firstName :: String,
                       lastName :: String,
                       age :: Int,
                       height :: Float,
                       phoneNumber :: String,
                       flavor :: String
                     } deriving (Show)

johnDoe = Person { firstName = "John", lastName = "Doe", age = 20, height = 1.7,
                   phoneNumber = "+48 111 222 333", flavor = "" }

module TrafficLight (
  TrafficLight(..)
) where

data TrafficLight = Red | Yellow | Green

instance Eq TrafficLight where
  Red == Red       = True
  Green == Green   = True
  Yellow == Yellow = True
  _ == _           = False

instance Show TrafficLight where
  show Red = "Red light"
  show Yellow = "Yellow light"
  show Green = "Green light"

-- And :info TrafficLight will give you details about
-- which functions the typeclass defines and a list of the types
-- in the typeclass. A :info works also for types and type 
-- constructors.

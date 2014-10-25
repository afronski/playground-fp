import Data.Functor

newtype Pair b a = Pair { getPair :: (a, b) }

instance Functor (Pair c) where
    fmap f (Pair (x, y)) = Pair (f x, y)

result = getPair $ fmap reverse (Pair ("London Calling", 3))

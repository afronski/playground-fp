import Control.Applicative

result1 = pure (+) <*> Just 3 <*> Just 5
result2 = pure (+) <*> Just 3 <*> Nothing
result3 = pure (+) <*> Nothing <*> Just 5

-- It is a way of applying values from the right to the functions
-- on the left in all possible combinations.

combinations = [ (* 0), (+ 100), (^ 2) ] <*> [ 1, 2, 3 ]

combinationsAppliedTwice = [ (+), (*) ] <*> [ 1, 2 ] <*> [ 3, 4 ]

-- Because <*> is left-associative:
-- 
--  [ (+), (*) ] <*> [ 1, 2 ] <*> [ 3, 4 ]
--  [ (1+), (2+), (1*), (2*) ] <*> [ 3, 4 ]
--  [ (1+3), (1+4), (2+3), (2+4), (1*3), (1*4), (2*3), (2*4) ]

mumble = (++) <$> [ "ha", "heh", "hmm" ] <*> [ "?", "!", "." ]

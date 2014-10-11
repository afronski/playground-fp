removeNonUppercase :: [Char] -> [Char]
removeNonUppercase st = [ c | c <- st, c `elem` ['A'..'Z']]

removeNonUppercase' :: String -> String
removeNonUppercase' st = [ c | c <- st, c `elem` ['A'..'Z']]

factorial :: Integer -> Integer
factorial n = product [ 1 .. n ]

factorial' :: Int -> Int
factorial' n = product [ 1 .. n ]

circumference :: Float -> Float
circumference r = 2 * pi * r

circumference' :: Double -> Double
circumference' r = 2 * pi * r

-- Typeclass
--
-- It is a representation, interface of certain behaviour. Typeclasses are used
-- to annotate functions with certain class constraints like:
--
-- ghci> :t (==)
-- (==) :: (Eq a) => a -> a -> Bool
--
-- It means that '==' is a function which has two arguments of the same type 'a',
-- returns a Bool and type 'a' should be somehow able to test equality between values.
--
-- - Eq - equality testing.
-- - Ord - compatable concept.
-- - Read - converting from string.
-- - Show - converting to string.
-- - Enum - enumerating all representats of such type.
-- - Bounded - all bounded types (like Bool, Int and so on).
-- - Num - all numeric types have this behaviour.
--
-- And many, many more.

explicitTypeAnnotationTest = (read "5" :: Float) * 4
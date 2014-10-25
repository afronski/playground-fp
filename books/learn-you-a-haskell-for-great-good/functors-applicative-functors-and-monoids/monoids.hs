import Data.Monoid

lengthCompare :: String -> String -> Ordering
lengthCompare x y = (length x `compare` length y) `mappend` (x `compare` y)

lengthAndVowelsCompare :: String -> String -> Ordering
lengthAndVowelsCompare x y = (length x `compare` length y) `mappend`
                             (vowels x `compare` vowels y) `mappend`
                             (x `compare` y)
    where vowels = length . filter (`elem` "aeiou")

-- Maybe is a monoid, but it requires that inner type should be a Monoid.
-- What if the inner type is not a Monoid? We cannot 'mappend' but we can 
-- at least throw out rest values and keep only the first - that is the reason
-- for the new type existance - 'First'.

result = getFirst $  First (Just 'a') `mappend` First (Just 'b')
isAnyFilled = getFirst . mconcat . map First $ [ Nothing, Nothing, Just 9, Just 10 ]

-- Currying and Partial Application

multThree :: (Num a) => a -> a -> a -> a
multThree x y z = x * y * z

-- By applying less arguments than defined
-- you are creating a partially applied function.

multTwoWithNine = multThree 9
multWithEighteen = multTwoWithNine 2

-- Infix function can be partially applied by creating a
-- 'part' surrounded with parentheses.

divideByTen :: (Floating a) => a -> a
divideByTen = (/10)

-- Higher Order Functions

zipWith' :: (a -> b -> c) -> [ a ] -> [ b ] -> [ c ]
zipWith' _ [] _ = []
zipWith' _ _ [] = []
zipWith' f (x : xs) (y : ys) = f x y : zipWith' f xs ys

flip' :: (a -> b -> c) -> (b -> a -> c)
flip' f = g
    where g x y = f y x

flip'' :: (a -> b -> c) -> (b -> a -> c)
flip'' f y x = f x y

mapResult = map (+3) [1, 5, 3, 1, 6]
stringMapResult = map (++ "!") [ "BIFF", "BANG", "POW" ]

evenNumbers = filter even [ 1 .. 10 ]
uppercase = filter (`elem` [ 'A' .. 'Z' ]) "i lauGh At You BecAuse u r aLL the Same"

quicksort :: (Ord a) => [ a ] -> [ a ]
quicksort [] = []
quicksort (pivot : xs) =
    let lowerBound = quicksort (filter (<= pivot) xs)
        upperBound = quicksort (filter (> pivot) xs)
    in lowerBound ++ [ pivot ] ++ upperBound

sumResult = sum (takeWhile (< 10000) (filter odd (map (^ 2) [ 1 .. ])))

listOfFuns = map (*) [ 0 .. ]
fourTimesFive = (listOfFuns !! 4) 5

-- Lambdas

chain :: (Integral a) => a -> [ a ]
chain 1 = [ 1 ]
chain n
    | even n =  n:chain (n `div` 2)
    | odd n  =  n:chain (n * 3 + 1)

numLongChains :: Int
numLongChains = length (filter (\xs -> length xs > 15) (map chain [ 1 .. 100 ]))

flip''' :: (a -> b -> c) -> (b -> a -> c)
flip''' f = \y x -> f x y

-- Folds and Scans

sum' :: (Num a) => [ a ] -> a
sum' xs = foldl (\acc x -> acc + x) 0 xs

sum'' :: (Num a) => [ a ] -> a
sum'' = foldl (+) 0

elem' :: (Eq a) => a -> [ a ] -> Bool
elem' y ys = foldl (\acc x -> if x == y then True else acc) False ys

map' :: (a -> b) -> [ a ] -> [ b ]
map' f xs = foldr(\x acc -> f x : acc) [] xs

maximum' :: (Ord a) => [ a ] -> a
maximum' = foldr1 (\x acc -> if x > acc then x else acc)

reverse' :: [ a ] -> [ a ]
reverse' = foldl (\acc x -> x : acc) []

reverse'' :: [ a ] -> [ a ]
reverse'' = foldl (flip (:)) []

foldWithIntermediateResults = scanl (+) 0 [3, 5, 2, 1]

-- Function Application with '$'

sqrtSums = sum (map sqrt [1 .. 130 ])
anotherSqrtSums = sum $ map sqrt [ 1 .. 130 ]

applicationRightSided = map ($ 3) [ (4+), (10*), (^2), sqrt ]

-- Function Composition with '.'

composition = map (negate . abs) [ 5, -3, -6, 7, -3, 2, -19, 24 ]

oddSquareSum :: Integer
oddSquareSum = sum . takeWhile ( < 10000) . filter odd . map (^ 2) $ [ 1 .. ]
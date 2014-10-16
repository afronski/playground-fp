bmiTell :: (RealFloat a) => a -> String
bmiTell bmi
    | bmi <= 18.5 = "You're underweight, you emo, you!"
    | bmi <= 25.0 = "You're supposedly normal, Pffft, I bet you're ugly!"
    | bmi <= 30.0 = "You're fat! Lose some weight, fatty!"
    | otherwise   = "You're a whale, congratulations!"

max' :: (Ord a) => a -> a -> a
max' a b
    | a > b     = a
    | otherwise = b

cmp :: (Ord a) => a -> a -> Ordering
a `cmp` b
    | a > b     = GT
    | a == b    = EQ
    | otherwise = LT
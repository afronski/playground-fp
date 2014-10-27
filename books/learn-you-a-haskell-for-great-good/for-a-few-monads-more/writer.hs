import Control.Monad.Writer

gcd' :: Int -> Int -> Writer [ String ] Int
gcd' a b
  | b == 0 = do
      tell [ "Finished with " ++ show a ]
      return a
  | otherwise = do
      tell [ show a ++ " mod " ++ show b ++ " = " ++ show (a `mod` b) ]
      gcd' b (a `mod` b)

result = fst $ runWriter (gcd' 8 3)
logs = snd $ runWriter (gcd' 8 3)

newtype DiffList a = DiffList { getDiffList :: [ a ] -> [ a ] }

toDiffList :: [ a ] -> DiffList a
toDiffList xs = DiffList (xs ++)

fromDiffList :: DiffList a -> [ a ]
fromDiffList (DiffList f) = f []

instance Monoid (DiffList a) where
    mempty = DiffList (\xs -> [] ++ xs)
    (DiffList f) `mappend` (DiffList g) = DiffList (\xs -> f (g xs))

gcd'' :: Int -> Int -> Writer (DiffList String) Int
gcd'' a b
  | b == 0 = do
      tell (toDiffList [ "Finished with " ++ show a ])
      return a
  | otherwise = do
      tell (toDiffList [ show a ++ " mod " ++ show b ++ " = " ++ show (a `mod` b) ])
      gcd'' b (a `mod` b)

result' = fst $ runWriter (gcd'' 8 3)
logs' = fromDiffList (snd $ runWriter (gcd'' 8 3))

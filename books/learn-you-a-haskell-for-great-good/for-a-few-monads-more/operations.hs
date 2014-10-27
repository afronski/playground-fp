import Control.Monad.Writer

keepSmall :: Int -> Writer [ String ] Bool
keepSmall x
    | x < 4 = do
        tell [ "Keeping " ++ show x ]
        return True
    | otherwise = do
        tell [ show x ++ " is too large, throwing it away" ]
        return False

result = fst $ runWriter $ filterM keepSmall [ 9, 1, 5, 2, 10, 3 ]

powerset :: [ a ] -> [ [ a ] ]
powerset xs = filterM (\x -> [ True, False ]) xs

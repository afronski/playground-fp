import Control.Monad

type KnightPos = (Int, Int)

moveKnight :: KnightPos -> [ KnightPos ]
moveKnight (c, r) = do
    (c', r') <- [ (c + 2, r - 1), (c + 2, r + 1), (c - 2, r - 1), (c - 2, r + 1),
                  (c + 1, r - 2), (c + 1, r + 2), (c - 1, r - 2), (c - 1, r + 2) ]
    guard (c' `elem` [ 1 .. 8 ] && r' `elem` [ 1 .. 8 ])
    return (c', r')

in3 start = return start >>= moveKnight >>= moveKnight >>= moveKnight
canReachIn3 start end = end `elem` in3 start

reachable = (6, 2) `canReachIn3` (6, 1)
notReachable = (6, 2) `canReachIn3` (7, 3)

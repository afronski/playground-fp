type Birds = Int
type Pole = (Birds, Birds)

margin = 4

landLeft :: Birds -> Pole -> Maybe Pole
landLeft n (left, right)
    | abs ((left + n) - right) < margin = Just (left + n, right)
    | otherwise                         = Nothing

landRight :: Birds -> Pole -> Maybe Pole
landRight n (left, right)
    | abs (left - (right + n)) < margin = Just (left, right + n)
    | otherwise                         = Nothing

routine :: Maybe Pole
routine = do
    start <- return (0, 0)
    first <- landLeft 2 start
    Nothing
    second <- landRight 2 first
    landLeft 1 second

import Data.Monoid
import qualified Data.Foldable as F

data Tree a = Empty | Node a (Tree a) (Tree a) deriving (Show, Read, Eq)

newtype InOrderTree a = InOrderTree { getInOrderTree :: Tree a }
newtype PreOrderTree a = PreOrderTree { getPreOrderTree :: Tree a }
newtype PostOrderTree a = PostOrderTree { getPostOrderTree :: Tree a }

instance F.Foldable Tree where
    foldMap f Empty        = mempty
    foldMap f (Node x l r) = F.foldMap f l `mappend`
                             f x           `mappend`
                             F.foldMap f r

instance F.Foldable InOrderTree where
    foldMap f (InOrderTree Empty)        = mempty
    foldMap f (InOrderTree (Node x l r)) = F.foldMap f (Node x l r)

instance F.Foldable PreOrderTree where
    foldMap f (PreOrderTree Empty)        = mempty
    foldMap f (PreOrderTree (Node x l r)) = f x           `mappend`
                                            F.foldMap f l `mappend`
                                            F.foldMap f r

instance F.Foldable PostOrderTree where
    foldMap f (PostOrderTree Empty)        = mempty
    foldMap f (PostOrderTree (Node x l r)) = F.foldMap f l `mappend`
                                             F.foldMap f r `mappend`
                                             f x

postOrder = PostOrderTree (
             Node 5
              (Node 3
                (Node 1 Empty Empty)
                (Node 6 Empty Empty)
              )
              (Node 9
                (Node 8 Empty Empty)
                (Node 10 Empty Empty)
              )
           )

preOrder = PreOrderTree (
             Node 5
              (Node 3
                (Node 1 Empty Empty)
                (Node 6 Empty Empty)
              )
              (Node 9
                (Node 8 Empty Empty)
                (Node 10 Empty Empty)
              )
           )

inOrder = InOrderTree (
            Node 5
             (Node 3
               (Node 1 Empty Empty)
               (Node 6 Empty Empty)
             )
             (Node 9
               (Node 8 Empty Empty)
               (Node 10 Empty Empty)
             )
          )

sum = F.foldl (+) 0 inOrder
product = F.foldl (*) 1 inOrder

anyEqualTo3 = getAny $ F.foldMap (\x -> Any $ x == 3) inOrder

inOrderList = F.foldMap (\x -> [ x ]) inOrder
preOrderList = F.foldMap (\x -> [ x ]) preOrder
postOrderList = F.foldMap (\x -> [ x ]) postOrder

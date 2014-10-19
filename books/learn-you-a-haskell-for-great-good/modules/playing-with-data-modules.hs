import Data.List
import Data.Char
import Data.Function

import qualified Data.Map as Map
import qualified Data.Set as Set

-- Example of functions from imported Data.* modules:

numUniques :: (Eq a) => [a] -> Int
numUniques = length . nub

xs = [[5,4,5,4,4],[1,2,3],[3,5,4,3],[],[2],[2,2]]  
sortedXs = sortBy (compare `on` length) xs  

result = all isAlphaNum "Eddy the fish!"
categories = map generalCategory " \t\nA9?|"

setNub xs = Set.toList $ Set.fromList xs 
setNumbResult = setNub "HEY WHATS CRACKALACKIN"
numResult = nub "HEY WHATS CRACKALACKIN"

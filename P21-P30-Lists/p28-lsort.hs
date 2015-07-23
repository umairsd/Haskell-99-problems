{-|
P28: Sorting a list of lists according to length of sublists

a) We suppose that a list contains elements that are lists themselves. The objective is to sort the 
elements of this list according to their length. E.g. short lists first, longer lists later, or vice versa.


b) Again, we suppose that a list contains elements that are lists themselves. But this time the objective 
is to sort the elements of this list according to their length frequency; i.e., in the default, where 
sorting is done ascendingly, lists with rare lengths are placed first, others with a more frequent length 
come later.


E.g.

Prelude>lsort ["abc","de","fgh","de","ijkl","mn","o"]
Prelude>["o","de","de","mn","abc","fgh","ijkl"]
 
> lfsort ["abc", "de", "fgh", "de", "ijkl", "mn", "o"]
> ["ijkl","o","abc","fgh","de","de","mn"]


Source: (https://wiki.haskell.org/99_questions/21_to_28)
-}


import Data.List
import qualified Data.Map as Map


lsort :: [[a]] -> [[a]]
lsort xs = sortBy (\xs ys -> compare (length xs) (length ys)) xs

-- Original Implementation, used this instead of the lambda, as I didn't know about 
-- the compare function
lsortHelper :: [a] -> [a] -> Ordering
lsortHelper xs ys 
    | length xs < length ys = LT
    | length xs > length ys = GT
    | otherwise             = EQ



-- Idea: Create a map of lengths to their frequencies, and use this to compare elements
lfsort :: [[a]] -> [[a]]
lfsort list = sortBy (\xs ys -> compare (Map.lookup (length xs) lengthMap) (Map.lookup (length ys) lengthMap) ) list
    where lengthMap = foldl (\accMap ys -> insertOrUpdate accMap (length ys))  (Map.fromList []) list


insertOrUpdate :: Map.Map Int Int -> Int -> Map.Map Int Int
insertOrUpdate map key =
     if (Map.lookup key map) == Nothing 
        then Map.insert key 1 map
        else Map.adjust (+1) key map


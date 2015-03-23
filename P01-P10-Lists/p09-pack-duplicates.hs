{-| P9: Pack consecutive duplicates of list elements into sublists. If a list contains
repeated elements, they should be placed in separate sublists.

E.g.
> pack ['a', 'a', 'a', 'a', 'b', 'c', 'c', 'a', 'a', 'd', 'e', 'e', 'e', 'e']
["aaaa","b","cc","aa","d","eeee"]

Source: (https://wiki.haskell.org/99_questions/1_to_10)
-}

import Data.List (group) 


pack :: (Eq a) => [a] -> [[a]]
pack = foldr innerPack []
    where innerPack x []     = [[x]]
          innerPack x (y:ys) = if x == (head y)
                                then ((x:y):ys)
                                else ([x]:y:ys)


-- Pack is really the 'group' function from the standard libary, so here's 
-- another solution
pack1 ::  (Eq a) => [a] -> [[a]]
pack1 = group


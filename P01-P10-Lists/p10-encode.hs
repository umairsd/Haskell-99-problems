{-| 
P10: Run-length encoding of a list. Use the result of problem P09 to implement the 
so-called run-length encoding data compression method. Consecutive duplicates 
of elements are encoded as lists (N E) where N is the number of duplicates of 
the element E.

E.g.
> encode "aaaabccaadeeee"
[(4,'a'),(1,'b'),(2,'c'),(2,'a'),(1,'d'),(4,'e')]

Source: (https://wiki.haskell.org/99_questions/1_to_10)
-}


import Data.List (group) 


-- Instead of 'group', I could also use the 'pack' function defined in the solution 
-- to the problem-09
encodeList :: (Eq a) => [a] -> [(Int, a)]
encodeList = map (\xs -> (length xs, head xs)) . group

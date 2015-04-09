{-| 
P14: Duplicate the elements of a list.

E.g.
> dupli [1, 2, 3]
[1,1,2,2,3,3]

Source: (https://wiki.haskell.org/99_questions/11_to_20)
-}

dupli :: [a] -> [a]
dupli = foldr (\x acc -> x:x:acc) []
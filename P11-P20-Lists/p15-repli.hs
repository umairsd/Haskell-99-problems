{-| 
P15: Replicate the elements of a list a given number of times.

E.g.
> repli "abc" 3
"aaabbbccc"

Source: (https://wiki.haskell.org/99_questions/11_to_20)
-}

repli :: [a] -> Int -> [a]
repli xs n = foldr (\x acc -> (replicate n x) ++ acc) [] xs




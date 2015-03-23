{-| P4: Find the number of elements of a list

Source: (https://wiki.haskell.org/99_questions/1_to_10)
-}

numElements :: [a] -> Int
numElements = foldr (\x acc -> acc+1) 0

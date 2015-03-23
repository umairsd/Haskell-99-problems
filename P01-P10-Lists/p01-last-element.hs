{-| P1: Find the last element of a list

Source: (https://wiki.haskell.org/99_questions/1_to_10)
-}


lastElem :: [a] -> a
lastElem [] = error "The list is empty"
lastElem (x:[]) = x
lastElem (x:xs) = lastElem xs

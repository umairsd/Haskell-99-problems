{-| P2: Find the last but one element of a list

Source: (https://wiki.haskell.org/99_questions/1_to_10)
-}


lastButOne :: [a] -> a
lastButOne [] = error "The list is empty"
lastButOne (x:[]) = error "The list contains only one element"
lastButOne (x:y:[]) = x
lastButOne (x:xs) = lastButOne xs


-- Another version of the problem using standard library functions
lastButOne2 :: [a] -> a
lastButOne2 = last . init

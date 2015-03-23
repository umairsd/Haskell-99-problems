{-| P3: Find k'th element of a list. The first element is number 1

E.g.
> elementAt [1,2,3] 2
2

Source: (https://wiki.haskell.org/99_questions/1_to_10)
-}


elementAt :: [a] -> Int -> a
elementAt [] _ = error "Index out of bounds"
elementAt (x:_) 1 = x
elementAt (_:xs) k 
    | k < 1 = error "Index out of bounds"
    | otherwise = elementAt xs (k-1)
 

-- A slight variation on the previous solution
elementAt2 :: [a] -> Int -> a
elementAt2 [] _ = error "Index out of bounds"
elementAt2 (x:xs) k 
    | k < 1  = error "Index out of bounds"
    | k == 1 = x
    | otherwise = elementAt2 xs (k-1)



-- Another version using the infix operator
elementAt3 :: [a] -> Int -> a
elementAt3 xs n = xs !! (n-1)



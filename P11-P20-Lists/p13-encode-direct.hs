{-| 
P13: Run-length encoding of a list (direct solution).

Implement the so-called run-length encoding data compression method directly. I.e. 
don't explicitly create the sublists containing the duplicates, as in problem 9, 
but only count them. As in problem P11, simplify the result list by replacing the 
singleton lists (1 X) by X.


E.g.
> encodeDirect "aaaabccaadeeee"
[Multiple 4 'a',Single 'b',Multiple 2 'c',Multiple 2 'a',Single 'd',Multiple 4 'e']

Source: (https://wiki.haskell.org/99_questions/11_to_20)
-}


-- Same data type as defined in P10
data EncodedItem a = Single a | Multiple Int a deriving (Show)

encodeDirect :: (Eq a) => [a] -> [EncodedItem a]
encodeDirect = map encoder . foldr countElements []

-- Converts a tuple of (1, a) into EncodedItem a
encoder :: (Int, a) -> EncodedItem a
encoder (1, x) = Single x
encoder (n, x) = Multiple n x


-- Creates tuples containing counts of each element
countElements :: (Eq a) => a -> [(Int, a)] -> [(Int, a)]
countElements x [] = [(1,x)]
countElements x (y@(a,b):ys)
    | x == b = (a+1,b):ys
    | otherwise = (1, x):y:ys
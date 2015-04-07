{-| 
P11: Modified run-length encoding.

Modify the result of problem 10 in such a way that if an element has no duplicates 
it is simply copied into the result list. Only elements with duplicates are 
transferred as (N E) lists.


E.g.
P11> encodeModified "aaaabccaadeeee"
[Multiple 4 'a',Single 'b',Multiple 2 'c',Multiple 2 'a',Single 'd',Multiple 4 'e']

Source: (https://wiki.haskell.org/99_questions/11_to_20)
-}


import Data.List (group) 

data EncodedItem a = Single a | Multiple Int a deriving (Show)

-- Version-1: Using lambda instead of a separate function
encodeModified :: (Eq a) => [a] -> [EncodedItem a]
encodeModified = map (\xs -> if length xs == 1 then (Single (head xs)) else (Multiple (length xs) (head xs))) . group


-- Version-2: Without using lambdas
encodeModified2 :: (Eq a) => [a] -> [EncodedItem a]
encodeModified2 = map encodedItemFromList . group

encodedItemFromList :: (Eq a) => [a] -> EncodedItem a
encodedItemFromList xs = if length xs == 1
                            then (Single (head xs))
                            else (Multiple (length xs) (head xs))



{-| 
P20: Remove the K'th element from a list.

E.g.
*Main> removeAt 2 "abcd"
('b',"acd")


Source: (https://wiki.haskell.org/99_questions/11_to_20)
-}


-- Returns the removed element if the indices are within range. Otherwise, 
-- returns Nothing
removeAt :: Int -> [a] -> (Maybe a, [a])
removeAt _ [] = (Nothing, [])
removeAt i y@(x:xs) 
	| i < 0 || i > (length y) = (Nothing, y)
	| otherwise = ( Just (y !! i), (take i y) ++ (drop (i+1) y))


-- V1 of this solution, which simply removes the element, and returns the updated list
removeAt1 :: Int -> [a] -> [a]
removeAt1 _ [] = []
removeAt1 i y@(x:xs) 
	| i < 0 || i > (length y) = y
	| otherwise =  (take i y) ++ (drop (i+1) y)

{-| P5: Reverse a list

Source: (https://wiki.haskell.org/99_questions/1_to_10)
-}


reverseList :: [a] -> [a]
reverseList [] = []
reverseList (x:xs) = (reverseList xs) ++ [x]


-- Another solution, using foldl
reverseList1 :: [a] -> [a]
reverseList1 = foldl (\acc x -> x : acc) []


-- For completeion, a version using using foldr. 
-- This is not as efficient as foldl though, as the ++ operator needs to traverse the 
-- entire accumulator
reverseList2 :: [a] -> [a]
reverseList2 = foldr (\x acc -> acc ++ [x]) []

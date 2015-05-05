{-| 
P18: Extract a slice from a list.

Given two indices, i and k, the slice is the list containing the elements 
between the i'th and k'th element of the original list (both limits included). 
Start counting the elements with 1.

E.g.
> split "abcdefghik" 3
("abc", "defghik")

Source: (https://wiki.haskell.org/99_questions/11_to_20)
-}


-- My solution
slice :: [a] -> Int -> Int -> [a]
slice [] _ _ = []
slice xs i j = 
	if (i < 0 || j > (length xs) || i > j) 
		then []
		else 
			map snd . filter (\(k,x) -> ( k >= i && k <= j)) $ zip [1..] xs


-- Same idea as mine, but a shorter and cleaner (in my opinion) solution, from 
-- https://wiki.haskell.org/99_questions/Solutions/18 
slice2 :: [a] -> Int -> Int -> [a]
slice2 [] _ _ = []
slice2 xs i j = map snd . filter((>=i) . fst) $ zip [1..j] xs

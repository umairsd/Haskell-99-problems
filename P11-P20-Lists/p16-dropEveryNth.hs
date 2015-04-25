{-| 
P16: Drop every N'th element from a list.

E.g.
> dropEvery "abcdefghik" 3
"abdeghk"

Source: (https://wiki.haskell.org/99_questions/11_to_20)
-}


-- My first attempt. Using zip was the key insight
dropEvery :: [a] -> Int -> [a]
dropEvery xs n = map (\(i, x) -> x) $ filter (\(i, x) -> (i `mod` n) /= 0 ) (zip [1..] xs)

-- v2, cleaner map syntax
dropEvery2 :: [a] -> Int -> [a]
dropEvery2 xs n = map snd $ filter (\(i, x) -> (i `mod` n) /= 0 ) $ zip [1..] xs

-- v3, learnt about the cycle function, and this makes it even cleaner
dropEvery3 :: [a] -> Int -> [a]
dropEvery3 xs n = map snd $ filter ( (n /= ) . fst ) $ zip (cycle [1..n]) xs

-- v4, A solution without using the zip function. This one I had to look up, but I think
-- it is a neat solution
dropEvery4 :: [a] -> Int -> [a]
dropEvery4 [] n = []
dropEvery4 xs n = (take (n-1) xs) ++ (dropEvery4 (drop n xs) n)

-- v5, Iterative solution based on the first solution here: https://wiki.haskell.org/99_questions/Solutions/16
dropEvery5 :: [a] -> Int -> [a]
dropEvery5 [] n = []
dropEvery5 (x:xs) n = dropHelper (x:xs) n 1 where
	dropHelper (x:xs) n i = (if (i `mod` n == 0) then [] else [x])
							++ (dropHelper xs n (i+1))
	dropHelper [] _ _ 	  = []



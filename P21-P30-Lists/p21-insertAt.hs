{-|
P21: Insert an element at a given position into a list

E.g.

> insertAt 'X' "abcd" 2
"aXbcd"

Source: (https://wiki.haskell.org/99_questions/21_to_28)
-}


insertAt :: a -> [a] -> Int -> [a]
insertAt x [] _ = [x]
insertAt x ys n = (take n ys) ++ [x] ++ (drop n ys)


-- Recursive
insertAtR :: a -> [a] -> Int -> [a]
insertAtR x [] _ = [x]
insertAtR x list@(y:ys) n = if n <= 0
	then x : list
	else y : (insertAtR x ys (n-1))


-- using foldl -- playing with indices without zipping
insertAt1 :: a -> [a] -> Int -> [a]
insertAt1 x ys n = fst $ foldl helper ([],0) ys
	where 
		helper (acc, i) y = if i == n
			then (acc ++ [x] ++ [y], i+1)
			else (acc ++ [y], i+1)

-- Using foldr
insertAt2 :: a -> [a] -> Int -> [a]
insertAt2 x ys n = foldr helper' [] $ zip [0..] ys
	where
		helper' (i,y) acc = if i == n
			then x : y : acc
			else y : acc



-- Some test cases
main = do
	putStrLn $ "Insert using take & drop"
	putStrLn $ insertAt 'X' "abcd" 0
	putStrLn $ insertAt 'X' "abcd" (-2)
	putStrLn $ insertAt 'X' "abcd" 1
	putStrLn $ insertAt 'X' "abcd" 2
	putStrLn $ insertAt 'X' "abcd" 4
	putStrLn $ insertAt 'X' "abcd" 6
	putStrLn $ insertAt 'X' "abcd" 100
	putStrLn "-----"
	putStrLn $ "Insert recursively"
	putStrLn $ insertAtR 'X' "abcd" 0
	putStrLn $ insertAtR 'X' "abcd" (-2)
	putStrLn $ insertAtR 'X' "abcd" 1
	putStrLn $ insertAtR 'X' "abcd" 2
	putStrLn $ insertAtR 'X' "abcd" 4
	putStrLn $ insertAtR 'X' "abcd" 6
	putStrLn $ insertAtR 'X' "abcd" 100	
	putStrLn "-----"
	putStrLn $ "Insert using foldl"
	putStrLn $ insertAt1 'X' "abcd" 0
	putStrLn $ insertAt1 'X' "abcd" (-2)
	putStrLn $ insertAt1 'X' "abcd" 1
	putStrLn $ insertAt1 'X' "abcd" 2
	putStrLn $ insertAt1 'X' "abcd" 4
	putStrLn $ insertAt1 'X' "abcd" 6
	putStrLn $ insertAt1 'X' "abcd" 100
	putStrLn "-----"
	putStrLn $ "Insert using foldr"
	putStrLn $ insertAt2 'X' "abcd" 0
	putStrLn $ insertAt2 'X' "abcd" (-2)
	putStrLn $ insertAt2 'X' "abcd" 1
	putStrLn $ insertAt2 'X' "abcd" 2
	putStrLn $ insertAt2 'X' "abcd" 4
	putStrLn $ insertAt2 'X' "abcd" 6
	putStrLn $ insertAt2 'X' "abcd" 100





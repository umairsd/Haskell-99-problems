{-|
P23: Extract a given number of randomly selected elements from a list.

E.g.

> rnd_select "abcdefgh" 3 
eda

Source: (https://wiki.haskell.org/99_questions/21_to_28)
-}


import System.Random

rnd_select :: [a] -> Int -> [a]
rnd_select xs n = chooseElements xs randomIndices
			where
				randomIndices = take n $ randomRs (0, (length xs) - 1) (mkStdGen 12311)


chooseElements :: [a] -> [Int] -> [a]
chooseElements [] _ 	 = []
chooseElements _  []	 = []
chooseElements xs (y:ys) = (xs !! y) : chooseElements xs ys


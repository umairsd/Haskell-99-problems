{-|
P24: Lotto: Draw N different random numbers from the set 1..M.

E.g.

> diff_select 6 49
[23,1,17,33,21,37]


Source: (https://wiki.haskell.org/99_questions/21_to_28)
-}

import System.Random

-- V1: This does not guarantee distinct elements
-- diff_select :: Int -> Int -> [Int]
-- diff_select 0 _ = []
-- diff_select _ 0 = []
-- diff_select n m = take n $ randomRs (1, m) (mkStdGen 133414)


diff_select :: Int -> Int -> [Int]
diff_select n m = take n (diff_helper [1..m] (mkStdGen 21231134))


diff_helper :: (RandomGen g) => [a] -> g -> [a]
diff_helper [] _   = []
diff_helper xs gen = (xs !! index) : diff_helper (take index xs ++ drop (index+1) xs) newGen
				where
					(index, newGen) = randomR (0, (length xs) - 1) gen


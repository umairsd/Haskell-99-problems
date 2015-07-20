-- p26-combinations.hs

{-|
P26: Generate the combinations of K distinct objects chosen from the N elements of a list

In how many ways can a committee of 3 be chosen from a group of 12 people? We all know that there are C(12,3) = 220 
possibilities (C(N,K) denotes the well-known binomial coefficients). For pure mathematicians, this result may be 
great. But we want to really generate all the possibilities in a list.

E.g.

> combinations 3 "abcdef"
["abc","abd","abe",...]

Source: (https://wiki.haskell.org/99_questions/21_to_28)
-}

combinations :: Int -> [a] -> [[a]]
combinations _ [] = []
combinations 1 xs = map (\y -> [y]) xs
combinations n (x:xs) = map  (\y -> x : y) (combinations (n-1) xs) ++ (combinations n xs)

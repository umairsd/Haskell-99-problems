-- p35-primeFactors.hs
{- 
P35: Determine the prime factors of a given positive integer. Construct a flat 
list containing the prime factors in ascending order.

E.g.

> primeFactors 315
[3, 3, 5, 7]

Source: (https://wiki.haskell.org/99_questions/31_to_41)
-}

{-# OPTIONS_GHC -Wall #-}


primeFactors :: Int -> [Int]
primeFactors n = case allFactors n of 
    []    -> [n]
    (x:_) -> x : primeFactors (n `div` x)


allFactors :: Int -> [Int]
allFactors n = filter (\x -> n `mod` x == 0) [2..n-1]


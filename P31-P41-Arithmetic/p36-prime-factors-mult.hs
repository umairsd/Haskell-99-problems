-- p36-prime-factors-mult.hs
{- 
P35: Determine the prime factors of a given positive integer. Construct a list containing the 
prime factors and their multiplicity.

E.g.

> prime_factors_mult 315
[(3,2),(5,1),(7,1)]

Source: (https://wiki.haskell.org/99_questions/31_to_41)
-}

{-# OPTIONS_GHC -Wall #-}


import Data.List as L

primeFactorsMult :: Int -> [(Int, Int)]
primeFactorsMult = map (\xs -> (head xs, length xs)) . L.group . primeFactors


primeFactors :: Int -> [Int]
primeFactors n = case allFactors n of 
    []    -> [n]
    (x:_) -> x : primeFactors (n `div` x)


allFactors :: Int -> [Int]
allFactors n = filter (\x -> n `mod` x == 0) [2..n-1]


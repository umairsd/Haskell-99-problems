-- Primes.hs

{-# OPTIONS_GHC -Wall #-}

module Primes where

import qualified Data.List 


-- P35
primeFactors :: Int -> [Int]
primeFactors n = case allFactors n of 
    []    -> [n]
    (x:_) -> x : primeFactors (n `div` x)


allFactors :: Int -> [Int]
allFactors n = filter (\x -> n `mod` x == 0) [2..n-1]


-- P36
primeFactorsMult :: Int -> [(Int, Int)]
primeFactorsMult = map (\xs -> (head xs, length xs)) . Data.List.group . primeFactors
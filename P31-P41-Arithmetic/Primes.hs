-- Primes.hs

{-# OPTIONS_GHC -Wall #-}

module Primes where

import qualified Data.List 



-- P31
isPrime :: Integer -> Bool
isPrime num
    | num <= 1  = False
    | otherwise = foldl (\acc factor -> acc && (num `mod` factor /= 0)) True [2..(sqrtInt num)]


-- Integer square root (my naive implementation)
-- isqrt :: Int -> Int
-- isqrt = floor . sqrt . fromIntegral

-- Integer square root, using Newton's method
sqrtInt :: Integer -> Integer
sqrtInt n = head $ dropWhile (\g -> g*g > n || (g+1)*(g+1) < n ) $ iterate (newGuessInt n) 1

newGuessInt :: Integer -> Integer -> Integer
newGuessInt n oldGuess = (oldGuess + n `div` oldGuess) `div` 2



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



-- P40
goldbach :: Integer -> (Integer, Integer)
goldbach n 
    | n <= 2 || n `mod` 2 /= 0   = error "Goldbach conjecture is for even numbers greater than 2"
    | otherwise = (a, b)
        where
            a = head $ filter (\x -> isPrime x && isPrime (n-x)) $ [0..n]
            b = n - a

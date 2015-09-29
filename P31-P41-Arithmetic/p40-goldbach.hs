-- p40-goldbach.hs
{-
P40: Goldbach's conjecture..

Goldbach's conjecture says that every positive even number greater than 2 is the sum of two prime 
numbers. Example: 28 = 5 + 23. It is one of the most famous facts in number theory that has not been 
proved to be correct in the general case. It has been numerically confirmed up to very large numbers 
(much larger than we can go with our Prolog system). Write a predicate to find the two prime numbers 
that sum up to a given even integer.

Example in Haskell:

P29> goldbach 28
(5,23)

Source: (https://wiki.haskell.org/99_questions/31_to_41)
-}

{-# OPTIONS_GHC -Wall #-}

import qualified Primes

goldbach :: Integer -> (Integer, Integer)
goldbach n 
    | n <= 2 || n `mod` 2 /= 0   = error "Goldbach conjecture is for even numbers greater than 2"
    | otherwise = (a, b)
        where
            a = head $ filter (\x -> Primes.isPrime x && Primes.isPrime (n-x)) $ [0..n]
            b = n - a

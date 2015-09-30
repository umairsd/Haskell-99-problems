-- p41-goldbachList.hs
{-
P41: Given a range of integers by its lower and upper limit, print a list of all even numbers and 
their Goldbach composition.

In most cases, if an even number is written as the sum of two prime numbers, one of them is very 
small. Very rarely, the primes are both bigger than say 50. Try to find out how many such cases 
there are in the range 2..3000.

Example in Haskell:

>goldbachList 9 20
[(3,7),(5,7),(3,11),(3,13),(5,13),(3,17)]

> goldbachList' 4 2000 50
[(73,919),(61,1321),(67,1789),(61,1867)]

Source: (https://wiki.haskell.org/99_questions/31_to_41)
-}

{-# OPTIONS_GHC -Wall #-}

import Primes(goldbach)

goldbachList :: Integer -> Integer -> [(Integer, Integer)]
goldbachList n m =  map goldbach . filter (even) $ [n..m]


goldbachList' :: Integer -> Integer -> Integer -> [(Integer, Integer)]
goldbachList' n m p = filter (\(x,y) -> x > p && y > p ) $ goldbachList n m

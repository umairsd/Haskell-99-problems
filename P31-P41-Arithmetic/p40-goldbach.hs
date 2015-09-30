-- p40-goldbach.hs
{-
P40: Goldbach's conjecture..

Goldbach's conjecture says that every positive even number greater than 2 is the sum of two prime 
numbers. Example: 28 = 5 + 23. It is one of the most famous facts in number theory that has not been 
proved to be correct in the general case. It has been numerically confirmed up to very large numbers 
(much larger than we can go with our Prolog system). Write a predicate to find the two prime numbers 
that sum up to a given even integer.

Example in Haskell:

> goldbach 28
(5,23)

Source: (https://wiki.haskell.org/99_questions/31_to_41)
-}


import Primes(goldbach)

{- 
NOTE:

As the function goldbach is going to be reused in the next problem, I moved it 
function into a separate file (Primes.hs) so that it can be reused as a module

I simply need to import the Primes module, and we are set. 

Usage: load this file in ghci, and then you can use the function goldbach
-}


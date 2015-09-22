-- p36-prime-factors-mult.hs
{- 
P36: Determine the prime factors of a given positive integer. Construct a list containing the 
prime factors and their multiplicity.

E.g.

> primeFactorsMult 315
[(3,2),(5,1),(7,1)]

Source: (https://wiki.haskell.org/99_questions/31_to_41)
-}


import Primes(primeFactorsMult)

{- 
NOTE:

As the function primeFactorsMult is going to be reused in the next problem (P37), I moved
this function into a separate file (Primes.hs) so that it can be reused. 

I simply need to import the Primes module, and we are set. 

Usage: load this file in ghci, and then you can use the function primeFactorsMult
-}
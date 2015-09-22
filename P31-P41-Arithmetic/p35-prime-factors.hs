-- p35-primeFactors.hs
{- 
P35: Determine the prime factors of a given positive integer. Construct a flat 
list containing the prime factors in ascending order.

E.g.

> primeFactors 315
[3, 3, 5, 7]

Source: (https://wiki.haskell.org/99_questions/31_to_41)
-}

import Primes(primeFactors)

{- 
NOTE:

As the function primeFactors is going to be reused in the next few problems, I moved
this function into a separate file (Primes.hs) so that it can be reused as a module

I simply need to import the Primes module, and we are set. 

Usage: load this file in ghci, and then you can use the function primeFactors
-}
-- p32-primesR.hs
{-
P39: A list of prime numbers.

Given a range of integers by its lower and upper limit, construct a list of all prime numbers in that range.

Example in Haskell:

P29> primesR 10 20
[11,13,17,19]

Source: (https://wiki.haskell.org/99_questions/31_to_41)
-}


{-# OPTIONS_GHC -Wall #-}

primeR :: Integer -> Integer -> [Integer]
primeR a b = filter (> a) . takeWhile (< b) $ primes



primes :: [Integer]
primes = sieve [2..]
    where
        sieve []     = [] 
        sieve (x:xs) = x : sieve [y | y <- xs, y `mod` x > 0]


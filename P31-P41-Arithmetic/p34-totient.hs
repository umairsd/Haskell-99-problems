-- p34-totient.hs
{- 
P34: Calculate Euler's totient function phi(m).

Euler's so-called totient function phi(m) is defined as the number of positive 
integers r (1 <= r < m) that are coprime to m.

Example: m = 10: r = 1,3,7,9; thus phi(m) = 4. Note the special case: phi(1) = 1.

E.g.

> totient 10
4

Source: (https://wiki.haskell.org/99_questions/31_to_41)
-}


{-# OPTIONS_GHC -Wall #-}

totient :: Integer -> Integer
totient 1 = 1
totient n = toInteger . length . filter (\x -> gcd x n == 1) $ [1..n-1]

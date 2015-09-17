-- p33-coprime.hs
{- 
P33: Determine whether two positive integer numbers are coprime. Two numbers are coprime 
if their greatest common divisor equals 1.

E.g.

> coprime 35 64
True

Source: (https://wiki.haskell.org/99_questions/31_to_41)
-}

{-# OPTIONS_GHC -Wall #-}

coprime :: Integer -> Integer -> Bool
coprime x y = case (gcd x y) of
    1 -> True
    _ -> False


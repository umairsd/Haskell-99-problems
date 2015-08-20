-- p32-gcd.hs
{- 
P32: Determine the greatest common divisor of two positive integer numbers. 
Use Euclid's algorithm.

E.g.

> gcd' 36 63
9


Source: (https://wiki.haskell.org/99_questions/31_to_41)
-}


gcd' :: Int -> Int -> Int
gcd' a b = gcdHelper (abs a) (abs b)


gcdHelper :: Int -> Int -> Int
gcdHelper a b = 
    if a `mod` b == 0
    then b
    else gcdHelper b (a `mod` b)

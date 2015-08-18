-- p31-isprime.hs

{- 
P31: Determine whether a given integer number is prime.

E.g.

P31> isPrime 7
True

Source: (https://wiki.haskell.org/99_questions/31_to_41)
-}


isPrime :: Int -> Bool
-- isPrime num = foldl (\acc factor -> acc || (num `mod` factor == 0)) False [2..(isqrt num)]
isPrime num = foldl (\acc factor -> acc && (num `mod` factor /= 0)) True [2..(isqrt num)]


-- Integer square root
isqrt :: Int -> Int
isqrt = floor . sqrt . fromIntegral


-- p46-table.hs
{-
P46: Define predicates and/2, or/2, nand/2, nor/2, xor/2, impl/2 and equ/2 (for logical equivalence) 
which succeed or fail according to the result of their respective operations; e.g. and(A,B) will 
succeed, if and only if both A and B succeed.

A logical expression in two variables can then be written as in the following example: 
and(or(A,B),nand(A,B)).

Now, write a predicate table/3 which prints the truth table of a given logical expression in two 
variables..

Example in Haskell:

> table (\a b -> (and' a (or' a b)))
True True True
True False True
False True False
False False False

Source: (https://wiki.haskell.org/99_questions/46_to_50)
-}

{-# OPTIONS_GHC -Wall #-}


table :: (Bool -> Bool -> Bool) -> IO()
table f = mapM_ putStrLn [show x ++ " " ++ show y ++ " " ++ show (f x y) | x <- [False, True], y <- [False, True]]


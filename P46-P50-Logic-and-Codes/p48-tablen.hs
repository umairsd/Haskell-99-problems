-- p48-tablen.hs
{-
P48: Truth tables for logical expressions (3).

Generalize problem P47 in such a way that the logical expression may contain any number of logical 
variables. Define table/2 in a way that table(List,Expr) prints the truth table for the expression 
Expr, which contains the logical variables enumerated in List.


Example in Haskell:

> tablen 3 (\[a,b,c] -> a `and'` (b `or'` c) `equ'` a `and'` b `or'` a `and'` c)
-- infixl 3 `equ'`
True  True  True  True
True  True  False True
True  False True  True
True  False False True
False True  True  True
False True  False True
False False True  True
False False False True


Source: (https://wiki.haskell.org/99_questions/46_to_50)
-}


{-# OPTIONS_GHC -Wall #-}

import Control.Monad(replicateM)

tablen :: Int -> ([Bool] -> Bool) -> IO()
tablen n f = mapM_ putStrLn $ map (\xs -> (unwords . map show) xs ++ " ---> " ++ show (f xs) ) $ replicateM n [False, True]

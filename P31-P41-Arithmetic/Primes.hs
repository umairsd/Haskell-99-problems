-- Primes.hs

{-# OPTIONS_GHC -Wall #-}

module Primes where

import qualified Data.List 



-- P31
isPrime :: Integer -> Bool
isPrime num
    | num <= 1  = False
    | otherwise = foldl (\acc factor -> acc && (num `mod` factor /= 0)) True [2..(squareRoot num)]


-- Integer square root (my naive implementation)
-- isqrt :: Int -> Int
-- isqrt = floor . sqrt . fromIntegral

-- Integer square root (from haskell wiki)
-- https://wiki.haskell.org/Generic_number_type#squareRoot
(^!) :: Num a => a -> Int -> a
(^!) x n = x^n
 
squareRoot :: Integer -> Integer
squareRoot 0 = 0
squareRoot 1 = 1
squareRoot n =
   let twopows = iterate (^!2) 2
       (lowerRoot, lowerN) =
          last $ takeWhile ((n>=) . snd) $ zip (1:twopows) twopows
       newtonStep x = div (x + div n x) 2
       iters = iterate newtonStep (squareRoot (div n lowerN) * lowerRoot)
       isRoot r  =  r^!2 <= n && n < (r+1)^!2
   in  head $ dropWhile (not . isRoot) iters



-- P35
primeFactors :: Int -> [Int]
primeFactors n = case allFactors n of 
    []    -> [n]
    (x:_) -> x : primeFactors (n `div` x)


allFactors :: Int -> [Int]
allFactors n = filter (\x -> n `mod` x == 0) [2..n-1]


-- P36
primeFactorsMult :: Int -> [(Int, Int)]
primeFactorsMult = map (\xs -> (head xs, length xs)) . Data.List.group . primeFactors
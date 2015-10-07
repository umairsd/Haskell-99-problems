-- p50-huffman-v1.hs

{-# OPTIONS_GHC -Wall #-}

import Data.Ord(comparing)
import Data.List(sortBy)

huffman :: [(Char, Int)] -> [(Char, String)]
huffman = sortBy (comparing fst) . (serializeHTree . buildHTree . createHTreeList)


-- Data type to represent a Huffman Tree
data HTree a = Leaf | HNode (Maybe a) Int (HTree a) (HTree a)
    deriving (Show)


-- Creates a list of HTree nodes, corresponding to each element of the input data
createHTreeList :: [(Char, Int)] -> [HTree Char]
createHTreeList = map (\(c, n) -> HNode (Just c) n Leaf Leaf) . sortBy (comparing snd)


-- Build an HTree (Huffman Tree), from a list of nodes
buildHTree :: [HTree Char] -> HTree Char
buildHTree []       = Leaf
buildHTree [x]      = x
buildHTree (x:y:xs) = buildHTree $ sortBy (compareHTrees) $ (combineTwo x y) : xs


-- Helper function to combine two nodes so that they are children of a common parent
combineTwo :: HTree a -> HTree a -> HTree a
combineTwo Leaf                Leaf                = Leaf
combineTwo lT@(HNode _ ln _ _) rT@(HNode _ rn _ _) = HNode Nothing (ln + rn) lT rT
combineTwo _                   _                   = undefined


-- Compares two HTrees
compareHTrees :: HTree Char -> HTree Char -> Ordering
compareHTrees Leaf Leaf = EQ
compareHTrees Leaf _    = LT 
compareHTrees _    Leaf = GT  
compareHTrees (HNode _ ln _ _) (HNode _ rn _ _)
    | ln < rn   = LT
    | ln > rn   = GT
    | otherwise = EQ


-- Finds all the Huffman codes within the given tree
serializeHTree :: HTree a -> [(a, String)]
serializeHTree tree  = serializeHelper tree "" 
    where
        serializeHelper Leaf                     _    = [] 
        serializeHelper (HNode (Just x) _ _  _ ) path = [(x, path)]
        serializeHelper (HNode Nothing  _ lT rT) path = (serializeHelper lT (path ++ "0")) ++ (serializeHelper rT (path ++ "1"))


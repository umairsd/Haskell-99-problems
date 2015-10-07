-- p50-huffman.hs
{-
P50: Huffman codes

We suppose a set of symbols with their frequencies, given as a list of fr(S,F) terms. Example: 
[fr(a,45),fr(b,13),fr(c,12),fr(d,16),fr(e,9),fr(f,5)]. Our objective is to construct a list hc(S,C) terms, 
where C is the Huffman code word for the symbol S. In our example, the result could be
Hs = [hc(a,'0'), hc(b,'101'), hc(c,'100'), hc(d,'111'), hc(e,'1101'), hc(f,'1100')] [hc(a,'01'),...etc.]. 
The task shall be performed by the predicate huffman/2 defined as follows:

% huffman(Fs,Hs) :- Hs is the Huffman code table for the frequency table Fs
Example in Haskell:

> huffman [('a',45),('b',13),('c',12),('d',16),('e',9),('f',5)]
[('a',"0"),('b',"101"),('c',"100"),('d',"111"),('e',"1101"),('f',"1100")]

Source: (https://wiki.haskell.org/99_questions/46_to_50)
-}

{-# OPTIONS_GHC -Wall #-}

import Data.Ord(comparing)
import Data.List(sortBy)



huffman :: [(Char, Int)] -> [(Char, String)]
huffman = sortBy (comparing fst) . (serializeHTree . buildHTree . createHTreeList)


-- Data type to represent a Huffman tree
data HTree a = Leaf a Int | HNode Int (HTree a) (HTree a)  deriving (Show)

-- Creates a list of Leaf nodes, corresponding to each element of the input data
createHTreeList :: [(Char, Int)] -> [HTree Char] 
createHTreeList = map (\(c,n) -> Leaf c n) . sortBy (comparing snd)

-- Creates a Huffman Tree from a list of HTree nodes
buildHTree :: [HTree a] -> HTree a
buildHTree []       = error "Cannot create a Huffman tree from an empty list"
buildHTree [x]      = x
buildHTree (x:y:xs) = buildHTree $ sortBy (compareHTrees) $ (HNode (intForHTree x + intForHTree y) x y) : xs

-- Compares two HTrees nodes based on the integer frequency 
compareHTrees :: HTree a -> HTree a -> Ordering
compareHTrees lTree rTree = compare (intForHTree lTree) (intForHTree rTree)

-- Finds all the Huffman codes within the given tree
serializeHTree :: HTree a -> [(a, String)]
serializeHTree tree = serializeHelper tree ""
    where
        serializeHelper (Leaf c _)      path = [(c, path)]
        serializeHelper (HNode _ lT rT) path = serializeHelper lT (path ++ "0") ++ serializeHelper rT (path ++ "1")


-- Helper function to extract the integer (frequency) of the given HTree
intForHTree :: HTree a -> Int
intForHTree (Leaf _ n)    = n
intForHTree (HNode n _ _) = n


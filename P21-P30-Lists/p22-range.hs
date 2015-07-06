{-|
P22: Create a list containing all integers within a given range.

E.g.

> range 4 9
[4,5,6,7,8,9]

Source: (https://wiki.haskell.org/99_questions/21_to_28)
-}



-- Using the built-in syntactic sugar
range :: Int -> Int -> [Int]
range start stop = [start..stop]


-- Using the cons (:) operator
range2 :: Int -> Int -> [Int]
range2 start stop
	| start > stop 	= []
	| start == stop	= [stop]
	| otherwise 	= start : range (start+1) stop


-- Generic version that works on types other than Int
range3 :: (Ord a, Enum a) => a -> a -> [a]
range3 start stop 
	| start > stop	= []
	| start == stop = [stop]
	| otherwise 	= start : range3 (succ start) stop


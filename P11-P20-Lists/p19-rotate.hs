{-| 
P19: Rotate a list N places to the left.

E.g.
*Main> rotate ['a','b','c','d','e','f','g','h'] 3
"defghabc"
 
*Main> rotate ['a','b','c','d','e','f','g','h'] (-2)
"ghabcdef"

Source: (https://wiki.haskell.org/99_questions/11_to_20)
-}

rotate :: [a] -> Int -> [a]
rotate [] _ = []
rotate xs i = 
	let index = if (i < 0) then (length xs + i) else i
	in
		(drop index xs) ++ (take index xs)



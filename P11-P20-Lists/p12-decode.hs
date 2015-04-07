{-| 
P12: Decode a run-length encoded list.

Given a run-length code list generated as specified in 
problem 11. Construct its uncompressed version.


E.g.
P12> decodeModified [Multiple 4 'a',Single 'b',Multiple 2 'c',Multiple 2 'a',Single 'd',Multiple 4 'e']
"aaaabccaadeeee"

Source: (https://wiki.haskell.org/99_questions/11_to_20)
-}



-- Same data type as defined in P10
data EncodedItem a = Single a | Multiple Int a deriving (Show)

-- Good solution using concatMap. This is based on one of the many solutions provided
-- with this problem
decodeModified :: (Eq a) => [EncodedItem a] -> [a]
decodeModified = concatMap decodeItem

decodeItem :: EncodedItem a -> [a]
decodeItem (Single x) = [x]
decodeItem (Multiple n x) = replicate n x

-- Even though this is labeled as v2, this was my first attempt. I was
-- not aware of the concatMap function, which simplifies this quite a bit
decodeModified2 :: (Eq a) => [EncodedItem a] -> [a]
decodeModified2 xs =  foldl (\acc y -> acc ++ y) [] $ (map decodeItem xs)



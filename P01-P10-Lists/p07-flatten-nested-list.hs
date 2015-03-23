{-| P7: Flatten a nested list structure (**)

E.g.
> flattenList  ["A", "List", "of", "Strings"]
"AListofStrings"

Source: (https://wiki.haskell.org/99_questions/1_to_10)
-}

flattenList :: [[a]] -> [a]
flattenList = foldr (\xs acc -> xs ++ acc) []

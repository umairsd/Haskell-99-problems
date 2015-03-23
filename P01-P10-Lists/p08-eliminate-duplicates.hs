{-| P8: Eliminate consecutive duplicates of list elements. (**)

If a list contains repeated elements they should be replaced with a single 
copy of the element. The order of the elements should not be changed.

E.g.
> compress "aaaabccaadeeee"
"abcade"

Source: (https://wiki.haskell.org/99_questions/1_to_10)
-}

import Data.List (group) 

compress :: (Eq a) => [a] -> [a]
compress = map (\xs -> head xs) . group


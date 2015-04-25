{-| 
P17: Split a list into two parts; the length of the first part is given.

Do not use any predefined predicates

E.g.
> split "abcdefghik" 3
("abc", "defghik")

Source: (https://wiki.haskell.org/99_questions/11_to_20)
-}

split :: [a] -> Int -> ([a], [a])
-- Simple solution, but violates the requirements for "no predefined predicates"
-- split xs n = (take n xs, drop n xs)
split xs n =
            let y = zip [1..] xs
                f = map snd $ filter ( (n>=) . fst ) y
                s = map snd $ filter ( (n<) . fst ) y
            in (f, s)


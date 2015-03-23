{-| P6: Find out whether a list is palindrome.

Source: (https://wiki.haskell.org/99_questions/1_to_10)
-}


-- Using the standard libary's reverse function here. I could've loaded 
-- my solution to problem 05 instead.
isPalindrome :: Eq a => [a] -> Bool
isPalindrome xs = xs == reverse xs

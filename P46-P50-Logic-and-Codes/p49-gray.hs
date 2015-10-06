-- p49-gray.hs
{-
P49: Gray Codes

An n-bit Gray code is a sequence of n-bit strings constructed according to certain rules. For example,

n = 1: C(1) = ['0','1'].
n = 2: C(2) = ['00','01','11','10'].
n = 3: C(3) = ['000','001','011','010',´110´,´111´,´101´,´100´].


Example in Haskell:

> gray 3
["000","001","011","010","110","111","101","100"]

Source: (https://wiki.haskell.org/99_questions/46_to_50)
-}

{-# OPTIONS_GHC -Wall #-}


gray :: Int -> [String]
gray 1 = ["0", "1"]
gray n = map ('0':) subGray ++ (map ('1' :) . reverse) subGray
    where 
        subGray = gray (n-1)




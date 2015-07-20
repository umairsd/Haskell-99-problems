{-|
P25: Generate a random permutation of the elements of a list.

E.g.

> rnd_permu "abcdef"
"badcef"

Source: (https://wiki.haskell.org/99_questions/21_to_28)
-}

import System.Random

rnd_permu :: [a] -> [a]
rnd_permu xs = permu_helper xs (mkStdGen 21231134)


permu_helper :: (RandomGen g) => [a] -> g -> [a]
permu_helper [] _ = []
permu_helper xs gen = ( xs !! index ) : permu_helper (take index xs ++ drop (index + 1) xs) newGen
        where
            (index, newGen) = randomR (0, (length xs) - 1) gen

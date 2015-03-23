# 99-Problems-In-Haskell
This is my attempt at solving the 99-Lisp problems in Haskell. The original list of Lisp problems is [here](http://www.ic.unicamp.br/~meidanis/courses/mc336/2006s2/funcional/L-99_Ninety-Nine_Lisp_Problems.html). 

The Haskell version of these 99 problems is at the [Haskell Wiki](https://wiki.haskell.org/99_questions).

For now, I am using GHCi (GHC's interactive environment) to run these files. Once GHCi is installed, it can be launched from the command line using the command `ghci`. To run/test a given solution, go to the solution's directory, run `ghci`, and load the `.hs` file of interest. For example, below is an example of loading the file `p01-last-element.hs`:

```
$ cd P01-P10-Lists/
$ ghci
GHCi, version 7.8.3: http://www.haskell.org/ghc/  :? for help
Loading package ghc-prim ... linking ... done.
Loading package integer-gmp ... linking ... done.
Loading package base ... linking ... done.
Prelude> 
Prelude> :l p01-last-element.hs 
[1 of 1] Compiling Main             ( p01-last-element.hs, interpreted )
Ok, modules loaded: Main.
*Main> 
```


The command `:l p01-last-element.hs` loads the source file into GHCi. This file defines a function named `lastElem` which is now available at the command line for me to play around with.


```haskell
*Main> lastElem [1,2,4,6,0,9]
9
*Main> lastElem []
*** Exception: The list is empty
*Main> lastElem "A string?"
'?'
*Main> 
```


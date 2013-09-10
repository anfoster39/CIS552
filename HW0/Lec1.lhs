CIS 552 Lecture 1
=================

A literate Haskell file is one where the file name ends in .lhs, and
all lines prefixed by '>' are Haskell source code. All other lines are
ignored by the Haskell compiler. The
[html](http://www.cis.upenn.edu/~cis552/13fa/lectures/Lec1.html) is
generated directly from the
[lhs](http://www.cis.upenn.edu/~cis552/13fa/lectures/Lec1.lhs) version
of the lecture notes. Feel free to download the source code and play
with it yourself after class. You'll need to turn in a version of it
for the zeroth homework assignment.

Every Haskell file begins with a few lines naming the module (must
start with a capital letter and be the same as the file name) and
(optionally) importing definitions from other modules.

> module Lec1 where
> import Test.HUnit   -- operators & functions for unit testing

Programming in Haskell is about substitutituting equals by equals
------------------------------------------------------------------

    3 * (4 + 5)

    { addition }

    3 * 9

    { multiplication }

    27

That's it!






What is Abstraction?
--------------------

Pattern Recognition

     31 * (42 + 56)

     70 * (12 + 95)

     90 * (68 + 12)




Generalize to a function by defining an equation
 
> pat x y z = x * (y + z)

The important question is not "What does this function do?"
but, instead "What does this function mean?" We can reason
about that meaning using what we know about equality.


     pat 31 42 56

     { function call } 

     31 * (42 + 56) 

     { addition }

     31 * 98

     { multiplication }

     3038


Functions, like `pat`, are the core abstraction mechanisms in functional
programming. 


The GHC System
--------------

Iteractive shell "ghci"

     :load Lec1.hs
     expression
     :type expression (:t)
     :info variable   (:i)
              
Emacs with haskell-mode              

     load file ^C-c ^C-l
              
Package management "cabal"
Download and install libraries 

     cabal install hunit






Elements of Haskell
-------------------

* Everything is an *expression*
* Expressions evaluate to *values* 
* Every expression has a *type*







Basic types 
-----------

> bigInt = 31 * (42 + 56)  :: Int  -- word-sized integers

> ii = 31 * (42 + 56) :: Integer   -- arbitrarily large integers

> d = 3.1 * (4.2 + 5) :: Double    -- double precision floating point

> c = 'a' :: Char 

> b = True :: Bool 

(Note, numbers, `+` and `*` are overloaded) 








Function types
--------------

      A -> B

Function taking an input of `A`, yielding output of `B`

> pos :: Int -> Bool
> pos x = (x > 0)









Multi-argument function types
-----------------------------

       A1 -> A2 -> A3 -> B

Function taking an input of type `A1`, `A2`, `A3`, giving out `B`

> arith :: Int -> Int -> Int -> Int
> arith x y z = x * (y + z)




Note that parens around a symbolic (infix) name turns it into a regular one.

> plus :: Int -> Int -> Int 
> plus = (+)


Likewise we can use alphabetic name in backquotes as infix.

> p1 :: Int
> p1 = 2 `plus` 2


Tuples
------

        (A1, ..., An)

Bounded sequence of values of type `A1`, .. `An` 

> t1 = ('a', 5)          :: (Char, Int)
> t2 = ('a', 5.2, 7)     :: (Char, Double, Int)
> t3 = ((7, 5.2), True)  :: ((Int, Double), Bool)

The structure must match the type.


Extracting values from tuples 
-----------------------------

Pattern Matching extracts values from tuples

> pat' :: (Int, Int, Int) -> Int
> pat' (x, y, z) = x * (y + z)







Optional values
---------------

        Maybe A

Perhaps a value of type `A`, or nothing. 

> m1 :: Maybe Int
> m1 = Just 2

> m2 :: Maybe Int
> m2 = Nothing






Extracting values from 'Maybe's 
--------------------------------

Pattern Matching extracts values from maybes, need a pattern for each
case.


> pat'' :: Maybe Int -> Int
> pat'' (Just x) = x
> pat'' Nothing  = 2




Patterns can be nested, too.

> join :: Maybe (Maybe a) -> Maybe a
> -- join (Just (Just x)) = Just x
> -- join (Just Nothing) = Nothing
> join (Just x) = x
> -- join Nothing = Nothing
> join _ = Nothing




Good for partial functions
--------------------------

> location :: String -> Maybe String
> location "cis501" = Just "Wu & Chen"
> location "cis502" = Just "Heilmeier"
> location "cis520" = Just "Wu & Chen"
> location "cis552" = Just "Towne 311"
> location _        = Nothing    -- wildcard pattern, matches anything




Homework Zero
-------------

First, follow the [homework instructions
online](http://www.cis.upenn.edu/~cis552/homework0.html). Then replace
`undefined` below with your answers.

> name :: String
> name = "Anne Foster"

> pennkey :: String
> pennkey = "Anfoster"

The name of the bit bucket repository you created as part of the
assignment.

> bitbucketRepoName :: String
> bitbucketRepoName = "https://github.com/anfoster39/CIS552.git"

Write a few sentences about your programming background. What
languages have you used before? What is the size of the largest
programs you have written in those languages?

> programmingExperience :: String
> programmingExperience = "I am in my second year of the MCIT program, so I am very comfortable in Java and have had some experiance in C, C++, and Python. The largest project I have written in java was an interpreter and complier for a made up langauage based on BNF in Dave's class. The larget program I have written in C++ was a checkers game in 595"

What do you hope to get from CIS 552?  What do you expect to learn
from the course?

> desiredOutcome :: String
> desiredOutcome = "I am hoping to learn the fundimentals of functional programming and best practices for functional programming."


Obligatory Hello world
----------------------

Note, we've gotten this far without doing any I/O. That's pretty
standard in Haskell. Working with GHCi means that we can see the
answers directly, we don't need an action to print them out. However,
a standalone executable needs to do *something*, so we demonstrate
that here.

The batch compiler "ghc" compiles and run large programs. Must have a
definition of 'main' somewhere. Can have multiple source files, and if
the one that includes 'main' is called 'Main' can leave off the
'-main-is' flag.

     ghc -o Lec1 --make -main-is Lec1 Lec1.lhs 

> main :: IO ()
> main = putStrLn ("Hello " ++ name)


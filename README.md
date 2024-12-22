# 2024/25 COMP0002 Coursework 2 (Haskell)

December 11, 2024

## 1 Introduction

If a function is marked as being *higher order*, it should not be written using
*explicit* recursion. Submit a Haskell file **cwk2 24-25.hs**. This file must load
into *ghci* without type or other errors.

You *must* provide type signatures for all defined functions. It is acceptable
to use functions provided by Prelude, but write any other required functions
*yourself*. Do not use those provided by imported libraries. While this is bad
practice for real development, it is good practice for learning.

## Basics

A Horse is an ascii image of a horse. Define either a *type alias* or *newtype* for
Horse and instanstiate it with at least one member, *e.g.*

```haskell
horse : : Horse
horse = [ ”     ,//)     ”
        , ”     ;;’ \    ”
        , ”  ,;;’ ( ’\   ”
        , ”      / ’\_) ” ]
```

Define a *higher order function*, **transpose** that takes a **Horse** and rotates
it 90◦ to the right. Define another (higher order) function **mirror** which flips
the Horse on its vertical access. Using **transpose** and mirror define functions
that rotate a horse 180◦ and 270◦.

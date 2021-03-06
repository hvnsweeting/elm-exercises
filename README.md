Elm-exercises
=============

[![Build Status](https://travis-ci.org/hvnsweeting/elm-exercises.svg?branch=master)](https://travis-ci.org/hvnsweeting/elm-exercises)

A collection of Elm exercises, using CLI to run instead of making website.

Exercises:
- FizzBuzz in Elm
- Factorial in Elm
- Fibonacci in Elm
- RunLengthEncode in Elm
- Sum in Elm
- Word Frequency Count in Elm
- [ProjectEuler.net Problem 1 - Multiples of 3 and 5](https://projecteuler.net/problem=1) in Elm
- [ProjectEuler.net Problem 16 - Power digit sum](https://projecteuler.net/problem=16) in Elm # TODO
- [99 Problems in Elm](https://wiki.haskell.org/99_questions) - on going

Code tested on Elm 0.18.0

```
├─┬ elm@0.18.0
├─┬ elm-format@0.7.0-exp
└─┬ run-elm@2.2.0
```

## Install
Install [elm], [rum-elm](https://github.com/jfairbank/run-elm) and `elm-format`:

```
npm install --global elm elm-format@0.7.0-exp run-elm@2.2.0
```

To install packages in `elm-package.json`, run:

```
elm-package install
```

Or just

```
make install
```

## Run

Run script by:

```sh
$ run-elm Hello.elm
Hello World!

$ run-elm FizzBuzz.elm
1 2 Fizz 4 Buzz Fizz 7 8 Fizz Buzz 11 Fizz 13 14 FizzBuzz 16 17 Fizz 19 Buzz Fizz 22 23 Fizz Buzz 26 Fizz 28 29 FizzBuzz 31 32 Fizz 34 Buzz Fizz 37 38 Fizz Buzz 41 Fizz 43 44 FizzBuzz 46 47 Fizz 49 Buzz Fizz 52 53 Fizz Buzz 56 Fizz 58 59 FizzBuzz 61 62 Fizz 64 Buzz Fizz 67 68 Fizz Buzz 71 Fizz 73 74 FizzBuzz 76 77 Fizz 79 Buzz Fizz 82 83 Fizz Buzz 86 Fizz 88 89 FizzBuzz 91 92 Fizz 94 Buzz Fizz 97 98 Fizz Buzz

$ run-elm Sum.elm 1 2 3.5
6.5

$ run-elm Factorial.elm
120
```

## Lessons learned
- When writing recursive function, if the first *iteration* seems complex,
  complicated (e.g get head of list then initialize all needed
  variables to pass on next function call),
  maybe just process it separately and do all the recursion in
  a help function is a good idea.

- **ALWAYS** uses `()` to group values you pass to function. This looks quite
  correct
  ```
  runLengthEncodeHelp (List.drop 1 list) head ( 1, head ) result ++ [ currentCount ]
  ```
  But Elm would think you call `runLengthEncodeHelp` with `result` then append
  `[ currentCount ]` when you might wanted to pass `result ++ [ currentCount ]`
  as argument. So always use `()`
  ```
  runLengthEncodeHelp (List.drop 1 list) head ( 1, head ) ( result ++ [ currentCount ] )
  ```
- The great type system/static typing of Elm/Haskell can help to avoid lot
  of errors such as wrong type, wrong input ... BUT it would not always prevent
  you to forget to pass enough arguments to a function call. Because of partial
  application, calling a function with not enough parameter will create new
  function. If the result passed to a generic function like `toString`, you
  would see output `<function>`, which is correct, but not what you would
  expect.
- After awhile playing with Elm on command line, better to start writing beginner webapp,
  which is what Elm for, and also simple. Follow the homepage tutorial to create
  a non-beginner app - which load a random cat picture to understand why
  Elm is great for webapp.
- After a long time no writing Elm, get back got a lot of trouble, even this
  what you learn when you start writing Elm, DO WRITE FUNCTION SIGNATURE (TYPE)
  BEFORE WRITING THE FUNCTION, IT HELPS A LOT.

## New project

Create new directory, run `elm-make` to create `elm-package.json`.

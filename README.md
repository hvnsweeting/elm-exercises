Elm-exercises
=============

[![Build Status](https://travis-ci.org/hvnsweeting/elm-exercises.svg?branch=master)](https://travis-ci.org/hvnsweeting/elm-exercises)

A collection of Elm exercises, using CLI to run instead of making website.

Exercises:
- Sum in Elm
- FizzBuzz in Elm
- Factorial in Elm
- Fibonacci in Elm
- Word Frequency Count in Elm
- [ProjectEuler.net Problem 1 - Multiples of 3 and 5](https://projecteuler.net/problem=1) in Elm
- [ProjectEuler.net Problem 16 - Power digit sum](https://projecteuler.net/problem=16) in Elm # TODO
- RunLengthEncode in Elm # TODO

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
elm-package
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

## New project

Create new directory, run `elm-make` to create `elm-package.json`.

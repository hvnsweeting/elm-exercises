module Factorial exposing (..)


output : String
output = factorial(5) |> toString

factorial : Int -> Int
factorial n =
  List.product (List.range 1 n)

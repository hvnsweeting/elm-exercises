module Fibonacci exposing (..)


output : String
output =
    List.range 0 10 |> List.map fib |> toString

{--
    - Elm does not support multiple clauses, uses case instead
-}
fib : Int -> Int
fib n =
  case n of
    0 -> 0
    1 -> 1
    _ -> fib (n - 1) + fib (n - 2)

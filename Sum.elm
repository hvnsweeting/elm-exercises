module Sum exposing (..)


output : List String -> String
output args =
  let numbers = args |> List.map String.toFloat |> List.map (Result.withDefault 0)
  in
    List.foldl (\x accumulator -> x + accumulator) 0 numbers |> toString

module P15Replicate exposing (..)

{--
(*) Duplicate the elements of a list.
-}


output : String
output =
    "Hello World!" |> String.toList |> flip replicate 3 |> toString


replicate : List a -> Int -> List a
replicate list n =
    case list of
        [] ->
            []

        [ a ] ->
            List.repeat n a

        a :: rest ->
            List.repeat n a ++ replicate rest n

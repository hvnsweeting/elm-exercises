module P02ButLast exposing (..)

{--
(*) Find the last but one element of a list.
> myButLast [1,2,3,4]
3
-}



output : String
output =
    "Hello World!" |> String.toList |> butLast |> toString

butLast : List a -> Maybe a
butLast list =
    case list of
        [] ->
            Nothing
        [ _ ] ->
            Nothing
        [ a, _ ] ->
            Just a
        a :: _ :: rest ->
            butLast rest

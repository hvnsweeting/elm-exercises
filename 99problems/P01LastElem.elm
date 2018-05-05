module P01LastElem exposing (..)

{--
(*) Find the last element of a list.
-}


output : String
output =
    "Hello World!" |> String.toList |> last |> toString


last : List a -> Maybe a
last list =
    case list of
        [] ->
            Nothing

        [ a ] ->
            Just a

        _ :: rest ->
            last rest

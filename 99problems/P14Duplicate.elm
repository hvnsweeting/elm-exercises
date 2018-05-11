module P14Duplicate exposing (..)

{--
(*) Duplicate the elements of a list.
-}


output : String
output =
    "Hello World!" |> String.toList |> duplicate |> toString


duplicate : List a -> List a
duplicate list =
    case list of
        [] ->
            []

        [ a ] ->
            [ a, a ]

        a :: rest ->
            [ a, a ] ++ duplicate rest

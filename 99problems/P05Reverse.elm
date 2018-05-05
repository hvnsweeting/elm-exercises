module P05Reverse exposing (..)

{--
(*) Reverse a list.
-}


output : String
output =
    ("python" |> String.toList |> myReverse |> myReverseFold)
        == String.toList "python"
        |> toString


myReverse : List a -> List a
myReverse list =
    case list of
        [] ->
            []

        [ a ] ->
            [ a ]

        x :: xs ->
            myReverse xs ++ [ x ]


myReverseFold : List a -> List a
myReverseFold list =
    List.foldl (::) [] list

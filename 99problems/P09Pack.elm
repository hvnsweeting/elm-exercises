module P09Pack exposing (..)

{--
(**) Pack consecutive duplicates of list elements into sublists. If a list contains repeated elements they should be placed in separate sublists.

This is so-called groupWhile equal
-}


output : String
output =
    [ 1, 1, 1, 2, 2, 3, 3, 3, 1 ] |> pack |> toString



{--
Tail recursive
-}


pack : List a -> List (List a)
pack list =
    let
        hd =
            List.head list
    in
    case hd of
        Nothing ->
            []

        Just hd ->
            packHelp (List.drop 1 list) hd [ hd ] []


packHelp : List a -> a -> List a -> List (List a) -> List (List a)
packHelp list last currentList result =
    let
        current =
            List.head list

        remainList =
            List.drop 1 list
    in
    case current of
        Nothing ->
            result ++ [ currentList ]

        Just current ->
            if current == last then
                packHelp remainList current (current :: currentList) result
            else
                packHelp remainList current [ current ] (result ++ [ currentList ])

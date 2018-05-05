module P03ElementAt exposing (..)

{--
(*) Find the K'th element of a list. The first element in the list is number 1.
-}


output : String
output =
    "Hello World!" |> String.toList |> elementAt 3 |> toString


elementAt : Int -> List a -> Maybe a
elementAt k list =
    if k < 0 then
        Nothing
    else
        List.head <| List.drop (k - 1) list

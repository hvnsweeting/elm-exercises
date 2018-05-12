module P20RemoveAt exposing (..)

{--
(*) Remove the K'th element from a list.
-}


output : String
output =
    "abcdefgh" |> String.toList |> flip removeAt 2 |> String.fromList


removeAt : List a -> Int -> List a
removeAt list n =
    let
        len =
            List.length list
    in
    if n > len || n < 0 then
        list
    else
        List.take (n - 1) list ++ List.drop n list

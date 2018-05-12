module P18Slice exposing (..)

{--
(**) Extract a slice from a list.

Given two indices, i and k, the slice is the list containing the elements between the i'th and k'th element of the original list (both limits included). Start counting the elements with 1.
-}


output : String
output =
    let
        string =
            "abcdefghik" |> String.toList
    in
    slice string 3 7 |> toString


slice : List a -> Int -> Int -> List a
slice list start stop =
    if start > stop then
        []
    else
        let
            head =
                List.head list
        in
        case head of
            Nothing ->
                []

            Just head ->
                if start <= 1 then
                    sliceHelp (List.drop 1 list) start stop 1 [ head ]
                else
                    sliceHelp (List.drop 1 list) start stop 1 []


sliceHelp : List a -> Int -> Int -> Int -> List a -> List a
sliceHelp list start stop count result =
    let
        tail =
            List.drop 1 list

        head =
            List.head list
    in
    case head of
        Nothing ->
            result

        Just head ->
            if count + 1 < start then
                sliceHelp tail start stop (count + 1) result
            else if count + 1 <= stop then
                sliceHelp tail start stop (count + 1) (result ++ [ head ])
            else
                result

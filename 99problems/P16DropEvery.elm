module P16DropEvery exposing (..)

{--
(**) Drop every N'th element from a list.
-}


output : String
output =
    "abcdefghik" |> String.toList |> flip dropEvery 3 |> String.fromList


dropEvery : List a -> Int -> List a
dropEvery list n =
    let
        head =
            List.head list
    in
    case head of
        Nothing ->
            []

        Just head ->
            dropEveryHelp (List.drop 1 list) n 1 [ head ]


dropEveryHelp : List a -> Int -> Int -> List a -> List a
dropEveryHelp list n count result =
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
            if count + 1 == n then
                dropEveryHelp tail n 0 result
            else
                dropEveryHelp tail n (count + 1) (result ++ [ head ])

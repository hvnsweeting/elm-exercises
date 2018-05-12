module P17Split exposing (..)

{--
(*) Split a list into two parts; the length of the first part is given.

Do not use any predefined predicates.
-}


output : String
output =
    "abcdefghik" |> String.toList |> flip split 3 |> toString


split : List a -> Int -> ( List a, List a )
split list n =
    let
        head =
            List.head list
    in
    case head of
        Nothing ->
            ( [], [] )

        Just head ->
            splitHelp (List.drop 1 list) n 1 ( [ head ], [] )


splitHelp : List a -> Int -> Int -> ( List a, List a ) -> ( List a, List a )
splitHelp list n count result =
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
            let
                ( lone, ltwo ) =
                    result
            in
            if count + 1 <= n then
                splitHelp tail n (count + 1) ( lone ++ [ head ], ltwo )
            else
                splitHelp tail n (count + 1) ( lone, ltwo ++ [ head ] )

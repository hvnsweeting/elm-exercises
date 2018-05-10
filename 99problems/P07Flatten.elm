module P07Flatten exposing (..)


type OneOrMore number
    = One number
    | More (List (OneOrMore number))


output : String
output =
    [ One 1, One 1, One 1, More [ One 2, One 2, More [ One 5 ] ], One 3 ] |> flip flatten [] |> toString



{--[ 1, 1, 1, [2, 2, [5]], 3-}


flatten : List (OneOrMore number) -> List number -> List number
flatten nestedList result =
    let
        head =
            List.head nestedList
    in
    case head of
        Nothing ->
            result

        Just head ->
            case head of
                One head ->
                    flatten (List.drop 1 nestedList) (result ++ [ head ])

                More head ->
                    flatten (List.drop 1 nestedList) (flatten head result)

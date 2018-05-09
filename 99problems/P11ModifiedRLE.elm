module P11ModifiedRLE exposing (..)


output : String
output =
    [ 1, 1, 1, 2, 2, 5, 3, 3, 3, 4 ] |> runLengthEncode |> toString


type SingleOrTuple2 a number
    = Single a
    | Tuple2 ( number, a )


runLengthEncode : List a -> List (SingleOrTuple2 a number)
runLengthEncode list =
    let
        head =
            List.head list
    in
    case head of
        Nothing ->
            []

        Just head ->
            runLengthEncodeHelp (List.drop 1 list) head ( 1, head ) []



{--Tail rec --}


runLengthEncodeHelp : List a -> a -> ( number, a ) -> List (SingleOrTuple2 a number) -> List (SingleOrTuple2 a number)
runLengthEncodeHelp list last currentCount result =
    let
        head =
            List.head list
    in
    case head of
        Nothing ->
            if Tuple.first currentCount == 1 then
                result ++ [ Single (Tuple.second currentCount) ]
            else
                result ++ [ Tuple2 currentCount ]

        Just head ->
            if head == last then
                runLengthEncodeHelp (List.drop 1 list) head (Tuple.mapFirst (\x -> x + 1) currentCount) result
            else if Tuple.first currentCount == 1 then
                runLengthEncodeHelp (List.drop 1 list) head ( 1, head ) (result ++ [ Single last ])
            else
                runLengthEncodeHelp (List.drop 1 list) head ( 1, head ) (result ++ [ Tuple2 currentCount ])


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
        head =
            List.head list

        tail =
            List.drop 1 list
    in
    case head of
        Nothing ->
            result ++ [ currentList ]

        Just head ->
            if head == last then
                packHelp tail head (head :: currentList) result
            else
                packHelp tail head [ head ] (result ++ [ currentList ])

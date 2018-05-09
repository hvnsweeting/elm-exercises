module P10RunLengthEncode exposing (..)


output : String
output =
    [ 1, 1, 1, 2, 2, 3, 3, 3, 4 ] |> runLengthEncode |> toString



{--TODO handle Maybe --}


runLengthEncode2 : List a -> List ( Int, Maybe a )
runLengthEncode2 list =
    list |> pack |> List.map (\charlist -> ( List.length charlist, Maybe.withDefault (List.head charlist) Nothing ))


runLengthEncode : List a -> List ( number, a )
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


runLengthEncodeHelp : List a -> a -> ( number, a ) -> List ( number, a ) -> List ( number, a )
runLengthEncodeHelp list last currentCount result =
    let
        head =
            List.head list
    in
    case head of
        Nothing ->
            result ++ [ currentCount ]

        Just head ->
            if head == last then
                runLengthEncodeHelp (List.drop 1 list) head (Tuple.mapFirst (\x -> x + 1) currentCount) result
            else
                runLengthEncodeHelp (List.drop 1 list) head ( 1, head ) (result ++ [ currentCount ])


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

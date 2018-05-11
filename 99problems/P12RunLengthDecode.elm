module P12RunLengthDecode exposing (..)

{--
(**) Decode a run-length encoded list.

Given a run-length code list generated as specified in problem 11. Construct its uncompressed version.
-}


output : String
output =
    [ 1, 1, 1, 2, 2, 5, 3, 3, 3, 4 ] |> runLengthEncode |> runLengthDecode |> toString


type SingleOrTuple2 a
    = Single a
    | Tuple2 ( Int, a )


runLengthDecode : List (SingleOrTuple2 a) -> List a
runLengthDecode list =
    runLengthDecodeHelp list []


runLengthDecodeHelp : List (SingleOrTuple2 a) -> List a -> List a
runLengthDecodeHelp list result =
    let
        head =
            List.head list

        tail =
            List.drop 1 list
    in
    case head of
        Nothing ->
            result

        Just head ->
            case head of
                Single head ->
                    runLengthDecodeHelp tail (result ++ [ head ])

                Tuple2 head ->
                    runLengthDecodeHelp tail (result ++ List.repeat (Tuple.first head) (Tuple.second head))


runLengthEncode : List a -> List (SingleOrTuple2 a)
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


runLengthEncodeHelp : List a -> a -> ( Int, a ) -> List (SingleOrTuple2 a) -> List (SingleOrTuple2 a)
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

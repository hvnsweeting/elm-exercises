module RunLengthEncodeTailRec exposing (..)

{--
Lesson learned:
- if first case are so special, process it separately from the rest
  as put it in recursive func make it more complicated.
- When checking type (Maybe), use case
- The rule for end condition might also the rule for all
- Using recursive like moving forward each element
- Define func signature first, always contains input, tempstates, output
-}


output : String
output =
    let
        input =
            "aabbbbccaaaac"
    in
    let
        output1 =
            runLengthEncode input

        output2 =
            runLengthEncode2 (String.toList input) [] |> String.fromList
    in
    if output1 == output2 then
        output1
    else
        output1 ++ "!=" ++ output2


runLengthEncode : String -> String
runLengthEncode s =
    let
        input =
            String.toList s

        countingChar =
            List.head input
    in
    case countingChar of
        Nothing ->
            ""

        Just countingChar ->
            recursiveRunLengthEncode (List.drop 1 input) countingChar 1 ""


recursiveRunLengthEncode : List Char -> Char -> Int -> String -> String
recursiveRunLengthEncode input countingChar count output =
    let
        headNow =
            List.head input
    in
    case headNow of
        Nothing ->
            if count > 1 then
                output ++ String.fromChar countingChar ++ toString count
            else
                output ++ String.fromChar countingChar

        Just headNow ->
            if headNow == countingChar then
                recursiveRunLengthEncode (List.drop 1 input) headNow (count + 1) output
            else if count > 1 then
                recursiveRunLengthEncode (List.drop 1 input) headNow 1 (output ++ String.fromChar countingChar ++ toString count)
            else
                recursiveRunLengthEncode (List.drop 1 input) headNow 1 (output ++ String.fromChar countingChar)


takeWhile list condition =
    let
        hd =
            List.head list
    in
    case hd of
        Nothing ->
            []

        Just hd ->
            let
                tl =
                    List.tail list
            in
            case tl of
                Nothing ->
                    []

                Just tl ->
                    if condition hd then
                        [ hd ] ++ takeWhile tl condition
                    else
                        []


runLengthEncode2 : List Char -> List Char -> List Char
runLengthEncode2 text prev =
    if List.isEmpty text then
        prev
    else
        let
            initChar =
                List.head text
        in
        case initChar of
            Nothing ->
                []

            Just initChar ->
                let
                    count =
                        takeWhile text (\x -> x == initChar) |> List.length
                in
                if count == 1 then
                    runLengthEncode2 (List.drop count text) (prev ++ [ initChar ])
                else
                    runLengthEncode2 (List.drop count text) (prev ++ [ initChar ] ++ String.toList (toString count))

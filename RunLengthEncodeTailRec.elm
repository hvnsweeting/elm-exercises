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
    runLengthEncode input


runLengthEncode : String -> String
runLengthEncode s =
    let
        input =
            String.toList s

        countingChar =
            List.head input

        count =
            0

        output =
            ""
    in
    case countingChar of
        Nothing ->
            ""

        Just countingChar ->
            recursiveRunLengthEncode (List.drop 1 input) countingChar 1 output


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
            else
                if count > 1 then
                    recursiveRunLengthEncode (List.drop 1 input) headNow 1 (output ++ String.fromChar countingChar ++ toString count)
                else
                    recursiveRunLengthEncode (List.drop 1 input) headNow 1 (output ++ String.fromChar countingChar)

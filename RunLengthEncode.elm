module RunLengthEncode exposing (..)


output : String
output =
    let
        input =
            "aabbbbccaaaac"

        characters =
            input |> String.toList
    in
    let
        c_c =
            List.foldl process { chars = [], counts = [] } characters
    in
    input ++ ": " ++ (List.map2 (\c n -> String.fromChar c ++ toString n) c_c.chars c_c.counts |> String.join "" |> String.reverse)


process char chars_counts =
    if List.length chars_counts.chars == 0 then
        { counts = [ 1 ], chars = [ char ] }
    else if char == (List.head chars_counts.chars |> Maybe.withDefault ' ') then
        { chars_counts | counts = ((List.head chars_counts.counts |> Maybe.withDefault 0) + 1) :: (List.tail chars_counts.counts |> Maybe.withDefault []) }
    else
        { chars_counts | chars = char :: chars_counts.chars, counts = 1 :: chars_counts.counts }

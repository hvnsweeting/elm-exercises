module WordFreqCountWithDict exposing (..)

import Dict


output : String
output =
    "cat dog chicken dog cat cat cat" |> String.split " " |> wordFreqCount |> toString


wordFreqCount words =
    List.foldl (\word counter -> Dict.insert word ((Dict.get word counter |> Maybe.withDefault 0) + 1) counter) Dict.empty words

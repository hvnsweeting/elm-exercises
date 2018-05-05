module P04Length exposing (..)

{--
(*) Find the number of elements of a list.
-}

output : String
output =
    "Hello World!" |> String.toList |> myLength |> toString

myLength : List a -> Int
myLength list =
    case list of
        [] ->
            0
        _ :: nonEmptyList ->
            1 + myLength nonEmptyList

module P06Palindrome exposing (..)

{--
(*) Find out whether a list is a palindrome. A palindrome can be read forward or backward; e.g. (x a m a x).
-}


output : String
output =
    "xamax" |> String.toList |> isPalindrome2 |> toString


isPalindrome : List a -> Bool
isPalindrome list =
    case list of
        [] ->
            True

        nonEmptyList ->
            nonEmptyList == List.reverse nonEmptyList


last : List a -> Maybe a
last list =
    case list of
        [] ->
            Nothing

        [ a ] ->
            Just a

        xs ->
            last (List.drop 1 list)


exceptLast : List a -> List a
exceptLast list =
    case list of
        [] ->
            []

        [ _ ] ->
            []

        [ a, _ ] ->
            [ a ]

        xs ->
            List.take (List.length xs - 1) xs


isPalindrome2 : List a -> Bool
isPalindrome2 list =
    case list of
        [] ->
            True

        [ _ ] ->
            True

        xs ->
            List.head xs == last xs && isPalindrome2 (List.drop 1 (exceptLast xs))

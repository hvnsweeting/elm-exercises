module P19RotateLeft exposing (..)

{--
(**) Rotate a list N places to the left.

Hint: Use the predefined functions length and (++).

* (rotate '(a b c d e f g h) 3)
(D E F G H A B C)

* (rotate '(a b c d e f g h) -2)
(G H A B C D E F)
-}


output : String
output =
    "abcdefgh" |> String.toList |> flip rotate -2 |> toString


rotate : List a -> Int -> List a
rotate list n =
    if n >= 0 then
        List.drop n list ++ List.take n list
    else
        let
            len =
                List.length list
        in
        List.drop (n % len) list ++ List.take (n % len) list

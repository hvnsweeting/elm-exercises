module FizzBuzz exposing (output)


output : List String -> String
output _ =
    List.range 1 100 |> List.map fizzbuzz |> String.join " "


fizzbuzz n =
    if n % 15 == 0 then
        "FizzBuzz"
    else if n % 3 == 0 then
        "Fizz"
    else if n % 5 == 0 then
        "Buzz"
    else
        toString n

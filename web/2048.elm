module Main exposing (..)

import Html exposing (Attribute, Html, button, div, text)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)


-- READY


main =
    Html.beginnerProgram { model = model, view = view, update = update }



-- MODEL


type alias Model =
    List (List Int)


model : Model
model =
    [ [ 0, 0, 0, 0 ], [ 0, 2, 0, 0 ], [ 0, 0, 2, 0 ], [ 0, 0, 0, 0 ] ]



{--
    [[0,2,2,4]
    ,[1,1,1,1]
    ,[2,2,2,8]
    ,[1,2,4,8]]
    --}
-- UPDATE


type Msg
    = Up
    | Down
    | Left
    | Right


addNewCell : List (List Int) -> List (List Int)
addNewCell square =
    case square of
        [] ->
            square

        a :: [] ->
            square

        a :: b :: [] ->
            square

        a :: b :: c :: [] ->
            square

        a :: b :: c :: d :: [] ->
            if List.member 0 a then
                [ addNewCellInRow a, b, c, d ]
            else if List.member 0 b then
                [ a, addNewCellInRow b, c, d ]
            else if List.member 0 c then
                [ a, b, addNewCellInRow d, d ]
            else
                [ a, b, c, addNewCellInRow d ]

        _ ->
            square


addNewCellInRow : List Int -> List Int
addNewCellInRow row =
    let
        head =
            List.head row
    in
    case head of
        Nothing ->
            []

        Just head ->
            if head == 0 then
                [ 2 ] ++ List.drop 1 row
            else
                [ head ] ++ addNewCellInRow (List.drop 1 row)


nextState : List Int -> List Int
nextState row =
    let
        head =
            List.head row
    in
    case head of
        Nothing ->
            row

        Just head ->
            nextStateHelp (List.drop 1 row) head []


nextStateHelp : List Int -> Int -> List Int -> List Int
nextStateHelp list last result =
    let
        head =
            List.head list
    in
    case head of
        Nothing ->
            rotateLeftPadZero (result ++ [ last ])

        Just head ->
            if head == last then
                nextStateHelp (List.drop 1 list) 0 (result ++ [ head + last ])
            else
                nextStateHelp (List.drop 1 list) head (result ++ [ last ])


rotateLeftPadZero : List Int -> List Int
rotateLeftPadZero list =
    let
        head =
            List.head list

        tail =
            List.drop 1 list
    in
    case head of
        Nothing ->
            []

        Just head ->
            if head == 0 then
                rotateLeftPadZero tail ++ [ 0 ]
            else
                head :: rotateLeftPadZero tail


transpose : List (List Int) -> List (List Int)
transpose listOfList =
    List.map (\row -> List.map (\n -> [ n ]) row) listOfList
        |> List.foldr (List.map2 (++)) [ [], [], [], [] ]


update : Msg -> Model -> Model
update msg model =
    case msg of
        Up ->
            model |> transpose |> List.map (\row -> nextState row) |> transpose |> addNewCell

        Down ->
            model |> transpose |> List.map (\row -> nextState (List.reverse row) |> List.reverse) |> transpose |> addNewCell

        Left ->
            model |> List.map (\row -> nextState row) |> addNewCell

        Right ->
            model |> List.map (\row -> nextState (List.reverse row) |> List.reverse) |> addNewCell



-- VIEW


formatCell : Int -> String
formatCell n =
    if n < 10 then
        "__" ++ toString n
    else if n < 100 then
        "_" ++ toString n
    else
        toString n


view : Model -> Html Msg
view model =
    div []
        ((model
            |> List.map
                (\row ->
                    div []
                        (row |> List.map (\cell -> button [] [ text (formatCell cell) ]))
                )
         )
            ++ [ div []
                    [ div [] [ button [ onClick Up ] [ text "^" ] ]
                    , div []
                        [ button [ onClick Left ] [ text "<-" ]
                        , button [ onClick Right ] [ text "->" ]
                        ]
                    , div [] [ button [ onClick Down ] [ text "V" ] ]
                    ]
               ]
        )

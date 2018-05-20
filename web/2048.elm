import Html exposing (Html, Attribute, div, button, text)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)


main =
    Html.beginnerProgram { model = model, view = view, update = update }


-- MODEL

type alias Model = List (List Int)


model : Model
model =
    -- [[0,0,0,0],[0,2,0,0],[0,0,2,0],[0,0,0,0]]
    [[0,2,2,4]
    ,[1,1,1,1]
    ,[2,2,2,8]
    ,[1,2,4,8]]

-- UPDATE

type Msg
    = Up | Down | Left | Right

nextState : List Int -> List Int
nextState row =
    let
        head = List.head row
    in
        case head of
            Nothing -> row
            Just head ->
                nextStateHelp (List.drop 1 row) head []

nextStateHelp : List Int -> Int -> List Int -> List Int
nextStateHelp list last result =
    let
        head = List.head list
    in
        case head of
            Nothing -> rotateLeftPadZero (result ++ [last])
            Just head ->
                if head == last then
                    nextStateHelp (List.drop 1 list) 0 (result ++ [head + last])
                else
                    nextStateHelp (List.drop 1 list) head (result ++ [last])

rotateLeftPadZero : List Int -> List Int
rotateLeftPadZero list =
    let
        head = List.head list
        tail = List.drop 1 list
    in
        case head of
            Nothing ->
                []
            Just head ->
                if head == 0 then
                    rotateLeftPadZero tail ++ [0]
                else
                    head :: (rotateLeftPadZero tail)

transpose : List (List Int) -> List (List Int)
transpose listOfList =
    List.map (\row -> List.map (\n -> [n]) row) listOfList
    |> List.foldr (List.map2 (++)) [[], [], [], []]


update : Msg -> Model -> Model
update msg model =
    case msg of
        Up ->
            model |> transpose |> List.map (\row -> nextState(row)) |> transpose
        Down ->
            model |> transpose |> List.map (\row -> nextState(List.reverse(row)) |> List.reverse) |> transpose
        Left ->
            model |> List.map (\row -> nextState(row))
        Right ->
            model |> List.map (\row -> nextState(List.reverse(row)) |> List.reverse)

-- VIEW

view : Model -> Html Msg
view model =
    div [] ( (model |> List.map (\row -> (div [] [ text (toString row) ]))) ++ [div [] [
        button [ onClick Left ] [ text "<-" ],
        button [ onClick Right ] [ text "->" ],
        button [ onClick Up ] [ text "^" ],
        button [ onClick Down ] [ text "V" ]
        ]
        ]
        )


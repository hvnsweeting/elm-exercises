import Html exposing (Html, Attribute, div, button, text)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)


main =
    Html.beginnerProgram { model = model, view = view, update = update }


-- MODEL

type alias Model = List (List Int)


model : Model
model =
    [[0,0,0,0],[0,2,0,0],[0,0,2,0],[0,0,0,0]]


-- UPDATE

type Msg
    = Up | Down | Left | Right

update : Msg -> Model -> Model
update msg model =
    case msg of
        Up ->
            model
        Down ->
            model
        Left ->
            model
        Right ->
            model

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


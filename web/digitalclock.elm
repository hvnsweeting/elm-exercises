module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Time exposing (Time, second)


-- READY


main =
    Html.program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }


type alias Model =
    Time


init : ( Model, Cmd Msg )
init =
    ( 0, Cmd.none )


type Msg
    = Tick Time


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Tick newTime ->
            ( newTime, Cmd.none )


subscriptions : Model -> Sub Msg
subscriptions model =
    Time.every second Tick


maybePad : Int -> String
maybePad n =
    if n < 10 then
        "0" ++ toString n
    else
        toString n


view : Model -> Html Msg
view model =
    let
        msInDay =
            floor model % 86400000 |> toFloat

        hours =
            Time.inHours msInDay |> floor

        minutes =
            Time.inMinutes msInDay |> floor |> (\x -> x % 60)

        seconds =
            Time.inSeconds msInDay |> floor |> (\x -> x % 60)
    in
    div []
        [ div
            [ style
                [ ( "width", "100%" )
                , ( "height", "40px" )
                , ( "padding", "10px 0" )
                , ( "font-size", "2em" )
                , ( "text-align", "center" )
                ]
            ]
            [ h1 []
                [ text
                    ((hours |> maybePad)
                        ++ ":"
                        ++ (minutes |> maybePad)
                        ++ ":"
                        ++ (seconds |> maybePad)
                        ++ " UTC"
                    )
                ]
            ]
        ]

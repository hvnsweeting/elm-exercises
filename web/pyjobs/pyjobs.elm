module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Http exposing (..)
import Json.Decode exposing (..)


-- READY


main =
    Html.program
        { init = init
        , update = update
        , view = view
        , subscriptions = subscriptions
        }


type alias Job =
    { id : String, name : String, province : String, company : String, postDate : String, wage : String }


type alias Model =
    { page : Int
    , jobs : List Job
    , url : String
    }


type Msg
    = NextPage
    | PrevPage
    | NewPage (Result Http.Error (List Job))


init : ( Model, Cmd Msg )
init =
    ( Model 1 [] "https://jobs.pymi.vn", fetchJobsCmd 1 )



-- "http://jobs.pymi.vn/jobs/1/?api=True"


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NextPage ->
            ( { model | page = model.page + 1 }, fetchJobsCmd (model.page + 1) )

        PrevPage ->
            ( { model | page = model.page - 1 }, fetchJobsCmd (model.page - 1) )

        NewPage (Ok jobs) ->
            ( { model | jobs = jobs }, Cmd.none )

        NewPage (Err _) ->
            ( model, Cmd.none )


fetchJobsCmd : Int -> Cmd Msg
fetchJobsCmd page =
    let
        baseUrl =
            "https://jobs.pymi.vn/jobs?page="

        tail =
            "&api=True"

        url =
            baseUrl ++ toString page ++ tail

        -- url =
        --     "http://127.0.0.1:5000/" ++ toString page
        request =
            Http.get url decodeJobs
    in
    Http.send NewPage request


jobDecoder : Decoder Job
jobDecoder =
    map6 Job
        (at [ "Job", "Id" ] string)
        (at [ "Job", "Name" ] string)
        (at [ "Job", "Province" ] string)
        (at [ "Job", "Company" ] string)
        (at [ "Job", "post_date" ] string)
        (at [ "Job", "Wage" ] string)


decodeJobs : Decoder (List Job)
decodeJobs =
    at [ "Jobs" ] (Json.Decode.list jobDecoder)


view : Model -> Html Msg
view model =
    div [ class "container theme-showcase" ]
        (--            [ button [ onClick PrevPage ]
         --            [ text "Previous" ]
         --         , button [] [ text (toString model.page) ]
         --         , button [ onClick NextPage ] [ text "Next" ]
         [ div [ style [ ( "text-align", "center" ), ( "padding-top", "50px" ) ] ]
            [ h1 []
                [ img [ src "https://jobs.pymi.vn/assets/python.png", width 40, height 40 ] []
                , i
                    [ class "fa fa-suitcase fa-x5"
                    , style [ ( "color", "steelblue" ) ]
                    ]
                    []
                , img [ src "https://jobs.pymi.vn/assets/vn.png", width 40, height 40 ] []
                ]
            , h1 [] [ text "Python jobs in Vietnam" ]
            ]
         ]
            ++ -- [div [] [ text model.jobs ]]
               (model.jobs
                    |> List.map
                        (\job ->
                            div [ class "list-group-item" ]
                                [ a
                                    [ href
                                        ("http://jobs.pymi.vn/jobs/" ++ job.id ++ "/"
                                         -- ++ "/?api=True"
                                        )
                                    ]
                                    [ text job.name ]
                                , br [] []
                                , span []
                                    [ text (job.company ++ " ")
                                    , i [ class "fa fa-bank", style [ ( "color", "SaddleBrown" ) ] ] []
                                    , text (" " ++ job.province)
                                    ]
                                , br [] []
                                , span []
                                    [ i [ class "fa fa-calendar", style [ ( "color", "LightSalmon" ) ] ] []
                                    , text (" " ++ job.postDate ++ " ")
                                    , i [ class "fa fa-money", style [ ( "color", "DarkCyan" ) ] ] []
                                    , text (" " ++ job.wage)
                                    ]
                                ]
                        )
               )
            ++ [ div [ style [ ( "text-align", "center" ) ] ]
                    [ button [ onClick PrevPage ]
                        [ text "Previous" ]
                    , button [] [ text (toString model.page) ]
                    , button [ onClick NextPage ] [ text "Next" ]
                    , p [ class "text-block", style [ ( "font-size", "14px" ) ] ]
                        [ img [ src "https://jobs.pymi.vn/assets/python-powered-w-70x28.png" ] []
                        , i [ class "fa fa-heart", style [ ( "color", "red" ) ] ] []
                        , span [] [ text " by " ]
                        , a [ href "http://www.facebook.com/pyfml", target "_blank" ] [ text "PyFML" ]
                        , span [] [ text " team" ]
                        ]
                    ]
               ]
        )


subscriptions model =
    Sub.none

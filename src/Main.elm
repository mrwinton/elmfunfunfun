module Main exposing (main)

import Browser
import Html exposing (Html, button, div, text)
import Html.Events exposing (onClick)


main =
    Browser.sandbox { init = init, update = update, view = view }


init : Model
init =
    { buttonValue = NoPlayer
    }


type Msg
    = Flip


type alias Model =
    { buttonValue : Player
    }


type Player
    = NoPlayer
    | X
    | O


playerToString : Player -> String
playerToString p =
    case p of
        X ->
            "X"

        O ->
            "O"

        NoPlayer ->
            "_"


update msg model =
    case msg of
        Flip ->
            if model.buttonValue == X then
                { model | buttonValue = O }

            else
                { model | buttonValue = X }


view model =
    div []
        [ button [ onClick Flip ] [ text (playerToString model.buttonValue) ]
        ]

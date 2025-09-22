pragma Singleton

import Quickshell
import QtQuick

Singleton {
    id: root

    readonly property OrangePalette orangePalette: OrangePalette {}
    readonly property DarkBluePalette darkBluePalette: DarkBluePalette {}
    readonly property BlackWhitePalette blackWhitePalette: BlackWhitePalette {}

    component OrangePalette: QtObject {
        property color bar_background: "#1a120d"
        property color primary_container: "#281d15"
        property color secondary_container: "#5c4132"
        property color text: "#f0dfd7"
        property color slider: "#ffb68e"
        // Workspaces
        property color active_ws: "#f0dfd7"
        property color occupied_ws: "#ffb68e"
        property color empty_ws: "#432b1d"
    }

    component DarkBluePalette: QtObject {
        property color bar_background: "#0e1514"
        property color primary_container: "#102a29"
        property color secondary_container: "#5f7a79"
        property color text: "#ffffff"
        property color slider: "#96ebe9"

        // Workspaces
        property color active_ws: "#ffffff"
        property color occupied_ws: "#90a2a1"
        property color empty_ws: "#274f4e"
        
    }

    component BlackWhitePalette: QtObject {
        property color bar_background: "#ffffff"
        property color primary_container: "#e6e6e6"
        property color secondary_container: "#b5b5b5"
        property color text: "#1b1b1b"
        property color slider: "#7a7a7a"

        // Workspaces
        property color active_ws: "#1b1b1b"
        property color occupied_ws: "#7a7a7a"
        property color empty_ws: "#c2c2c2"
    }
}

pragma Singleton

import Quickshell
import QtQuick

Singleton {
    property Fonts font: Fonts {}

    component Fonts: QtObject {
        property string material: "Material Symbols Outlined"
        property string ubuntu: "Ubuntu"
        property string tempesta: "PF Tempesta Five Condensed"
        property string terminus: "Terminus"
    }
}

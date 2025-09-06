import QtQuick
import Quickshell
import qs.components
import "popups"

Row {
    id: row
    spacing: 20
    anchors {
        leftMargin: 15
        rightMargin: 15
    }

    // required property int index
    property bool settingsIsOpen: false

    MaterialIcon {
        id: tv
        text: "Tv"
        font.pixelSize: 22
        height: parent.height
    }

    // MaterialIcon {
    //     id: keyboard
    //     text: "Keyboard"
    //     fill: 1
    //     font.pixelSize: 22
    //     height: parent.height
    // }

    // MaterialIcon {
    //     id: brillo
    //     text: "Brightness_6"
    //     font.pixelSize: 22
    //     height: parent.height
    // }

    MaterialIcon {
        id: volume
        text: "Volume_Up"
        fill: 1
        font.pixelSize: 22
        height: parent.height
    }
}

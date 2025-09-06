import QtQuick
import Quickshell
import qs.components
import qs.services
import qs.config
import Quickshell.Widgets

Item {
    id: root
    anchors.fill: parent
    // color: "blue"

    MusicDisplay {
        visible: Music.players.length > 0
        anchors.horizontalCenter: root.horizontalCenter
    }
}

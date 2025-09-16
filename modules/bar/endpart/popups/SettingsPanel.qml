import QtQuick
import QtQuick.Controls
import QtQuick.Effects
import qs.config
import "settings"

Rectangle {
    id: root
    implicitHeight: 250
    implicitWidth: 400
    // radius: 15

    bottomLeftRadius: 25
    bottomRightRadius: 25
    color: ColorsConfig.palette.current.bar_background

    Column {
        id: column
        anchors.fill: parent

        Item {
            id: screensRowContainer
            anchors.horizontalCenter: parent.horizontalCenter
            width: screensRow.implicitWidth
            height: screensRow.height

            ScreensRow {
                id: screensRow
            }
        }
        Item {
            height: 15
            width: 15
        }

        Item {
            id: brilloVolumeContainer
            height: volumeBrillo.implicitHeight
            anchors.horizontalCenter: parent.horizontalCenter
            width: parent.implicitWidth

            VolumeBrillo {
                id: volumeBrillo
            }
        }
    }
}

import Quickshell
import Quickshell.Io
import QtQuick
import QtQuick.Layouts
import qs.config
import qs.components
import "startpart"
import "endpart"
import "middlepart"

Variants {
    id: root
    model: Quickshell.screens

    PanelWindow {
        id: mainWindow
        required property var modelData
        screen: modelData
        visible: root.instances.length > 1 ? (modelData.name == "HDMI-A-1" ? true : false) : true
        anchors {
            top: true
            left: true
            right: true
        }
        implicitHeight: 32

        Rectangle {
            color: ColorsConfig.palette.current.surface
            anchors.fill: parent

            GridLayout { //grid 3 partes iguales
                id: grid
                anchors.fill: parent
                columns: 3
                rows: 1
                columnSpacing: 0
                Item {
                    id: start
                    Layout.fillWidth: true
                    Layout.fillHeight: true

                    StartPart {}
                }
                Item {
                    id: middle
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    MiddlePart {}
                }
                Item {
                    id: end
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    EndPart {}
                }
            }
        }
    }
}

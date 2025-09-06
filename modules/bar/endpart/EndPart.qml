import QtQuick
import Quickshell
import Quickshell
import qs.config
import qs.services
import qs.components

import "popups"

Row {
    anchors.fill: parent
    spacing: 10
    layoutDirection: Qt.RightToLeft

    Rectangle {
        color: ColorsConfig.palette.current.surface_bright
        height: parent.height

        width: fecha.implicitWidth + 30
        Fecha {
            id: fecha
            anchors.fill: parent
        }
    }

    Rectangle {
        color: ColorsConfig.palette.current.surface_bright
        height: parent.height

        width: hora.implicitWidth + 30
        Hora {
            id: hora
            anchors.fill: parent
        }
    }

    Rectangle {
        color: ColorsConfig.palette.current.surface_bright
        height: parent.height

        width: bateria.implicitWidth + 30
        Bateria {
            id: bateria
            anchors.fill: parent
        }
    }

    Rectangle {
        id: slidersContainer
        property bool settingsIsOpen: false

        color: ColorsConfig.palette.current.surface_bright
        height: parent.height

        width: sliders.implicitWidth + 30

        Sliders {
            id: sliders
            anchors.fill: parent
        }

        MouseArea {
            anchors.fill: slidersContainer
            onClicked: {
                slidersContainer.settingsIsOpen = !slidersContainer.settingsIsOpen;
                // Settings Timers
                Brillo.runningTimer = !Brillo.runningTimer;
            }
        }

        LazyLoader {
            active: slidersContainer.settingsIsOpen || false

            Variants {
                id: scopePanel
                model: Quickshell.screens
                PanelWindow {
                    id: settingsPanel
                    required property var modelData
                    screen: modelData
                    visible: root.instances.length > 1 ? (modelData.name == "HDMI-A-1" ? true : false) : true
                    anchors.top: true
                    anchors.right: true
                    exclusiveZone: 0

                    margins {
                        top: 0
                        right: 250
                    }

                    color: "transparent"
                    implicitWidth: settingsPopup.implicitWidth
                    implicitHeight: settingsPopup.implicitHeight

                    SettingsPanel {
                        id: settingsPopup
                        anchors.right: settingsPanel.right
                    }
                }
            }
        }
    }
}

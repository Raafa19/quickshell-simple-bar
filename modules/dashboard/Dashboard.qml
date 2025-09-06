import QtQuick
import Quickshell
import qs.components
import qs.services
import qs.config
import Quickshell.Bluetooth

Variants {
    id: root
    model: Quickshell.screens
    property var btDevices: Bluetooth.defaultAdapter?.devices?.values
    property color bgColor: ColorsConfig.palette.current.surface

    PanelWindow {
        id: panelDash
        required property var modelData
        screen: modelData
        visible: root.instances.length > 1 ? (modelData.name == "eDP-1" ? true : false) : false
        anchors.top: true
        anchors.right: true
        exclusiveZone: 0
        mask: Region {}
        implicitWidth: 400
        implicitHeight: 210
        color: "transparent"
        margins {
            top: 10
            right: 10
        }

        Rectangle {
            anchors.fill: parent
            radius: 10
            color {
                a: 0.5
                r: bgColor.r
                g: bgColor.g
                b: bgColor.b
            }
            Column {
                anchors.fill: parent
                spacing: 0
                Row {
                    anchors.horizontalCenter: parent.horizontalCenter
                    height: 140
                    spacing: 20
                    MaterialIcon {
                        text: "Schedule"
                        font.pixelSize: 80
                        height: parent.height
                    }
                    StyledText {
                        text: Time.time
                        font.pixelSize: 90
                        font.family: FontsConfig.font.tempesta
                        height: parent.height
                        bottomPadding: 25
                    }
                }

                Row {
                    anchors.horizontalCenter: parent.horizontalCenter
                    height: 50
                    spacing: 10
                    MaterialIcon {
                        text: {
                            return root?.btDevices[0]?.connected ? "Bluetooth" : "Bluetooth_Disabled";
                        }
                        height: parent.height
                        font.pixelSize: 50
                        fill: 1
                    }
                    StyledText {
                        height: parent.height

                        font.pixelSize: 50
                        font.family: FontsConfig.font.tempesta
                        bottomPadding: 15
                        text: {
                            text: {
                                return root.btDevices[0]?.connected ? `${root.btDevices[0]?.battery * 100} %` : "";
                            }
                        }
                    }
                }
            }
        }
    }
}

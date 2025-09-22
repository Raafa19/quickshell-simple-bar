import QtQuick
import qs.config

Row {
    anchors.fill: parent
    spacing: 10

    Rectangle {
        id: workspacesBox
        color: ColorsConfig.palette.current.primary_container
        height: parent.height
        width: ws.implicitWidth + 30
        Workspaces {
            id: ws
            anchors.fill: parent
        }
    }

    Rectangle {
        id: systemInfoContainer
        height: parent.height
        color: ColorsConfig.palette.current.primary_container
        width: systemInfo.implicitWidth + 30

        SystemInfo {
            id: systemInfo
            anchors.fill: parent
        }
    }

    Rectangle {
        id: wifiBtContainer
        height: parent.height
        color: ColorsConfig.palette.current.primary_container
        width: wifiBtRow.implicitWidth + 20

        Row {
            id: wifiBtRow
            anchors.fill: parent
            spacing: 10
            anchors {
                leftMargin: 10
                rightMargin: 10
            }
            Bluetooth {
                id: bt
                height: parent.height
            }
            WifiInfo {
                id: wifi
                height: parent.height
            }
        }
    }
}

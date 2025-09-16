import Quickshell
import QtQuick
import QtQuick.Layouts
import qs.config
import Quickshell.Hyprland
import qs.components
import qs.services

Row {
    id: wsRow
    // anchors.fill: parent
    // rows: 1
    // columns: WsConfig.config.totalWs
    readonly property var currentScreen: Hyprland.monitorFor(wsRow.QsWindow.window?.screen)
    readonly property var occupied: Hyprland.workspaces.values

    spacing: 0
    anchors {
        leftMargin: 10
        rightMargin: 10
    }
    Repeater {
        model: WsConfig.config.totalWs
        Item {
            id: wsContainer
            required property int index

            readonly property bool isOcuppied: wsRow.occupied.some(e => e.id == index + 1) ?? false
            readonly property bool isOnScreen: wsRow.occupied.some(e => (e?.id == index + 1) && (e?.monitor?.id == wsRow.currentScreen?.id))

            readonly property bool activeOnscreen: wsRow.occupied.some(e => (e?.id == index + 1) && (e?.monitor?.id == wsRow.currentScreen?.id) && (e.active))

            property int fontSize: 21

            // Layout.fillWidth: true
            height: wsRow.height
            width: 30
            Layout.fillHeight: true

            MaterialIcon {
                anchors.fill: parent
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                color: wsContainer.isOnScreen && wsContainer.activeOnscreen ? WsConfig.config.active : wsContainer.isOcuppied ? WsConfig.config.occupied : WsConfig.config.empty
                font.pixelSize: wsContainer.fontSize
                fill: wsContainer.isOnScreen && wsContainer.activeOnscreen ? 1 : 0

                text: WsConfig.config.label
            }
            MouseArea {
                anchors.fill: parent
                hoverEnabled: true
                onClicked: event => {
                    const ws = wsContainer.index + 1;
                    if (Hyprland.activeWsId !== ws)
                        Hyprland.dispatch(`exec $HOME/.config/hypr/dispatch ${ws}`);
                }
                onEntered: event => {
                    wsContainer.fontSize = 23;
                }
                onExited: event => {
                    wsContainer.fontSize = 21;
                }
            }
        }
    }
}

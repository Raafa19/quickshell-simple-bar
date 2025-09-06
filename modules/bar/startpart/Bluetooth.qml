import QtQuick
import Quickshell.Bluetooth
import Quickshell.Widgets
import qs.components
import qs.services

Row {
    id: btRow
    spacing: 5

    property var btDevices: Bluetooth.defaultAdapter?.devices?.values

    MaterialIcon {
        text: {
            return btRow.btDevices[0]?.connected ? "Bluetooth" : "Bluetooth_Disabled";
        }
        height: parent.height
        fill: 0
    }
    ClippingRectangle {
        height: parent.height
        color: "transparent"
        width: Math.min(row.width, 200);
        MarqueeItem {
            height: parent.height
            width: row.width
            run: width > parent.width
            Row {
                id: row
                height: parent.height
                spacing: 5

                StyledText {
                    height: parent.height
                    bottomPadding: 3
                    text: {
                        text: {
                            return btRow.btDevices[0]?.connected > 0 ? btDevices[0]?.deviceName : "Desconectado";
                        }
                    }
                }

                StyledText {
                    height: parent.height
                    bottomPadding: 3
                    text: {
                        text: {
                            return btRow.btDevices[0]?.connected ? `(${btDevices[0]?.battery * 100} %)` : "";
                        }
                    }
                }
            }
        }
    }
}

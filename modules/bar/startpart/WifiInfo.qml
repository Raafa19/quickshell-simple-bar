import QtQuick
import Quickshell.Bluetooth
import Quickshell.Widgets
import qs.components
import qs.services

Row {
    id: wifiRow
    spacing: 5

    IconTextRevealer {
        height: parent.height
        icon: "Wifi"
        func: () => Wifi.runningTimer = !Wifi.runningTimer
        
        text: MarqueeItem {
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
                    text: Wifi.wifiName
                }
            }
        }
    }
}

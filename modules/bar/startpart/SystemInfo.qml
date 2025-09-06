import QtQuick
import Quickshell.Widgets
import qs.components
import qs.services

Row {
    id: iconRow
    spacing: 5
    anchors {
        leftMargin: 15
        rightMargin: 15
    }
    // CPU
    MaterialIcon {
        text: "Laptop_Windows"
        height: parent.height
        fill: 0
    }
    StyledText {
        width: 45
        height: parent.height
        bottomPadding: 3
        text: `${Math.round(SystemUsage.cpuPerc * 100)} %`
        // text: height
    }

    MaterialIcon {
        text: "Memory"
        height: parent.height
        fill: 0
    }
    StyledText {
        width: 60
        height: parent.height
        bottomPadding: 3
        text: {
            const ram = SystemUsage.formatKib(SystemUsage.ramUsed);
            return `${+ram.value.toFixed(1)}${ram.unit}`;
        }
    }
    Bluetooth {
        id: bt
        height: parent.height
    }
}

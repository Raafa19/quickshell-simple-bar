import QtQuick
import Quickshell.Io
import QtQml
import qs.components
import qs.services

Row {
    id: row
    spacing: 30
    topPadding: 15
    property int selectedMonitor: 0

    ScreenButton {
        iconText: "Computer"
        bottomText: "Laptop \nMonitor"
        thisIndex: 0
        currentIndex: row.selectedMonitor
    }

    ScreenButton {
        iconText: "Tv_Displays"
        bottomText: "Dual \nMonitor"
        thisIndex: 1
        currentIndex: row.selectedMonitor
    }

    ScreenButton {
        iconText: "Monitor"
        bottomText: "HDMI \nOnly"
        thisIndex: 2
        currentIndex: row.selectedMonitor
    }

    ScreenButton {
        iconText: "Screen_Share"
        bottomText: "Mirror \nMonitor"
        thisIndex: 3
        currentIndex: row.selectedMonitor
    }

    Process {
        id: currentMonitor
        running: true
        command: ["sh", "-c", "~/.config/quickshell/scripts/currentMonitor"]
        stdout: StdioCollector {
            onStreamFinished: row.selectedMonitor = this.text
        }
    }
}

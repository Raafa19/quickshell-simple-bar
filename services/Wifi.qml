pragma Singleton

import Quickshell
import Quickshell.Io
import QtQuick

Singleton {
    id: root
    property bool runningTimer: false
    property string wifiName

    Process {
        id: currentWifiName
        command: ["sh", "-c", "~/.config/quickshell/scripts/wifi.sh"]
        running: true

        stdout: StdioCollector {
            onStreamFinished: {
                root.wifiName = this.text;
            }
        }
    }

    Timer {
        interval: 50
        running: root.runningTimer
        repeat: true
        onTriggered: currentWifiName.running = true
    }
}

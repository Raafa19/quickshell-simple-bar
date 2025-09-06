pragma Singleton

import Quickshell
import Quickshell.Io
import QtQuick

Singleton {
    id: root
    property string time
    
    Process {
        id: timeProc

        command: ["date", "+%H:%M"]
        running: true

        stdout: StdioCollector {
            onStreamFinished: root.time = this.text
        }
    }
    Timer {
        interval: 1000
        running: true
        repeat: true
        onTriggered: timeProc.running = true
    }
}

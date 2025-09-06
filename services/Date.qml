pragma Singleton

import Quickshell
import Quickshell.Io
import QtQuick

Singleton {
    id: root
    property string date
    
    Process {
        id: dateProc

        command: ["date", "+%A, %d de %b"]
        running: true

        stdout: StdioCollector {
            onStreamFinished: root.date = this.text
        }
    }

    Timer {
        interval: 120000
        running: true
        repeat: true
        onTriggered: dateProc.running = true
    }
}

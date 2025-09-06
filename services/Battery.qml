pragma Singleton

import Quickshell
import Quickshell.Io
import QtQuick

Singleton {
    id: root
    property string percen
    property int icon

    Process {
        id: batProc

        command: ["sh", "-c", "~/.config/quickshell/scripts/bateria.sh"]
        running: true

        stdout: StdioCollector {
            onStreamFinished: {
                const res = this.text.replace(/\n/g, '');
                root.icon = res[0]
                root.percen = res.substring(2)
            }
        }
    }
    Timer {
        interval: 2000
        running: true
        repeat: true
        onTriggered: batProc.running = true
    }
}

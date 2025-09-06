pragma Singleton

import Quickshell
import Quickshell.Io
import QtQml

// import QtQuick

Singleton {
    id: root
    property int currentBrillo
    property bool runningTimer: false

    function setBrillo(brillo: int) {
        setBrilloProc.exec(["light", "-S", Math.max(5, brillo)]);
    }

    Process {
        id: setBrilloProc
        running: true
        onExited: {
            currentBrilloProc.running = true;
        }
    }

    Process {
        id: currentBrilloProc
        running: true
        command: ["light"]
        stdout: StdioCollector {
            onStreamFinished: {
                root.currentBrillo = this.text;
            }
        }
    }

    Timer {
        interval: 50
        running: root.runningTimer
        repeat: true
        onTriggered: {
            currentBrilloProc.running = true;
        }
    }
}

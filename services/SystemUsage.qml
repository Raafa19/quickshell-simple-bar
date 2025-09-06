pragma Singleton

import Quickshell
import Quickshell.Io
import QtQuick

Singleton {
    id: root

    property real cpuPerc
    property real ramUsed
    property real ramTotal

    property real lastCpuIdle
    property real lastCpuTotal

    function formatKib(kib: real): var {
        const mib = 1024;
        const gib = 1024 ** 2;
        const tib = 1024 ** 3;

        if (kib >= tib)
            return {
                value: kib / tib,
                unit: " TiB"
            };
        if (kib >= gib)
            return {
                value: kib / gib,
                unit: " GiB"
            };
        if (kib >= mib)
            return {
                value: kib / mib,
                unit: " MiB"
            };
        return {
            value: kib,
            unit: " KiB"
        };
    }

    Timer {
        running: true
        interval: 5000
        repeat: true
        triggeredOnStart: true
        onTriggered: {
            stat.reload();
            raminfo.reload();
        }
    }

    FileView {
        id: stat

        path: "/proc/stat"
        onLoaded: {
            const data = text().match(/^cpu\s+(\d+)\s+(\d+)\s+(\d+)\s+(\d+)\s+(\d+)\s+(\d+)\s+(\d+)/);
            if (data) {
                const stats = data.slice(1).map(n => parseInt(n, 10));
                const total = stats.reduce((a, b) => a + b, 0);
                const idle = stats[3] + (stats[4] ?? 0);

                const totalDiff = total - root.lastCpuTotal;
                const idleDiff = idle - root.lastCpuIdle;
                root.cpuPerc = totalDiff > 0 ? (1 - idleDiff / totalDiff) : 0;
                root.lastCpuTotal = total;
                root.lastCpuIdle = idle;
            }
        }
    }

    FileView {
        id: raminfo

        path: "/proc/meminfo"
        onLoaded: {
            const data = text();
            root.ramTotal = parseInt(data.match(/MemTotal: *(\d+)/)[1], 10) || 1;
            root.ramUsed = (root.ramTotal - parseInt(data.match(/MemAvailable: *(\d+)/)[1], 10)) || 0;
        }
    }
}

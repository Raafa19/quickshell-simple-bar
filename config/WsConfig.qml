pragma Singleton

import Quickshell
import QtQuick

Singleton {
    property Workspaces config: Workspaces {}

    component Workspaces: QtObject {
        property int totalWs: 5
        property string label: "Circle"
        property color active: ColorsConfig.palette.current.active_ws
        property color occupied: ColorsConfig.palette.current.occupied_ws
        property color empty: ColorsConfig.palette.current.empty_ws
    }
}

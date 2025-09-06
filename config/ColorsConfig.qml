pragma Singleton

import Quickshell
import QtQuick
import qs.services

Singleton {
    property MyPalette palette: MyPalette {}

    component MyPalette: QtObject {
        property var current: Colors.secondPalette
    }
}

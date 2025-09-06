pragma Singleton

import Quickshell
import QtQuick

Singleton {
    id: root

    readonly property FirstPalette firstPalette: FirstPalette {}
    readonly property SecondPalette secondPalette: SecondPalette {}

    component FirstPalette: QtObject {
        property color surface: "#1a120d"
        property color surface_bright: "#281d15"
        property color on_surface: "#f0dfd7"
        property color primary: "#ffb68e"
        property color on_primary: "#532201"
        property color secondary: "#e6beab"
        property color on_secondary: "#432b1d"
        property color tertiary: "#cdc991"
        property color on_tertiary: "#343208"
        property color primary_container: "#6f3714"
        property color on_primary_container: "#ffdbca"
        property color secondary_container: "#5c4132"
        property color onSecondaryContainer: "#ffdbca"
    }

    component SecondPalette: QtObject {
        property color surface: "#1a120d"
        // property color surface: "#f0caaf"
        property color surface_bright: "#281d15"
        property color on_surface: "#f0dfd7"
        property color primary: "#ffb68e"
        property color on_primary: "#532201"
        property color secondary: "#e6beab"
        property color on_secondary: "#432b1d"
        property color tertiary: "#cdc991"
        property color on_tertiary: "#343208"
        property color primary_container: "#6f3714"
        property color on_primary_container: "#ffdbca"
        property color secondary_container: "#5c4132"
        property color onSecondaryContainer: "#ffdbca"
    }
}

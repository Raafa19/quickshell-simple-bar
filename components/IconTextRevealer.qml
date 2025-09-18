import QtQuick
import QtQuick.Controls
import Quickshell.Widgets

import qs.config

Row {
    id: root
    required property string icon
    required property var text
    required property var func

    spacing: 5
    clip: true
    width: button.width

    Item {
        id: button
        height: root.height
        width: icon.width
        // color: ColorsConfig.palette.current.empty_ws
        // radius: 15

        MaterialIcon {
            id: icon
            text: root.icon
            height: parent.height
            fill: 0
            leftPadding: 5
            rightPadding: 5
        }

        MouseArea {
            anchors.fill: parent
            onClicked: {
                root.func();
                root.width = root.width >= button.width + text.width ? button.width : button.width + text.width;
            }
        }
    }

    ClippingRectangle {
        id: text
        height: parent.height
        color: "Transparent"
        width: Math.min(root.text.width + 20, 190)
        children: [root.text]
    }

    Behavior on width {
        NumberAnimation {
            duration: 90
        }
    }
}

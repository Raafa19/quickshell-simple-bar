import QtQuick
import Quickshell.Io
import qs.components
import qs.config

Item {
    id: root
    required property string iconText
    required property string bottomText
    required property int thisIndex
    required property int currentIndex
    property int childWidth: 65
    property int childHeight: 65
    property int childPixelSize: 45
    property int childRadius: 15

    width: column.implicitWidth
    height: column.implicitHeight

    Column {
        id: column

        Rectangle {
            width: childWidth
            height: childHeight
            color: thisIndex == currentIndex ? ColorsConfig.palette.current.secondary_container : ColorsConfig.palette.current.primary_container
            radius: childRadius

            MaterialIcon {
                text: iconText
                horizontalAlignment: Text.AlignHCenter
                font.pixelSize: childPixelSize
                anchors.fill: parent
                // fill: thisIndex == currentIndex ? 1: 0
            }
        }
        StyledText {
            topPadding: 5
            width: childWidth
            horizontalAlignment: Text.AlignHCenter
            font.bold: thisIndex == currentIndex ? true : false
            text: bottomText
        }
    }
    MouseArea {
        anchors.fill: root
        onClicked: changeMonitor.exec(changeMonitor)
    }

    Process {
        id: changeMonitor
        running: false
        command: ["sh", "-c", `~/.config/quickshell/scripts/changeMonitor ${root.thisIndex}`]
    }
}

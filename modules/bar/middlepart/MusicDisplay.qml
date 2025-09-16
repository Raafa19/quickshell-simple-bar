import QtQuick
import Quickshell.Widgets
import qs.components
import qs.services
import qs.config

ClippingRectangle {
    id: clipRect
    width: {
        Math.min(row.width + 50, 500);
    }
    height: parent.height
    color: ColorsConfig.palette.current.primary_container
    anchors.horizontalCenter: parent.horizontalCenter
    radius: 15

    MarqueeItem {
        height: parent.height
        width: row.width
        run: width > parent.width

        Row {
            id: row
            // anchors.fill: parent
            width: childrenRect.width
            height: parent.height
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.leftMargin: 15
            anchors.rightMargin: 15
            spacing: 10
            StyledText {
                color: ColorsConfig.palette.current.text
                height: parent.height
                text: Music.audioMedia.titulo
            }
            StyledText {
                color: ColorsConfig.palette.current.text
                height: parent.height
                font.bold: true
                text: "—"
            }
            StyledText {
                color: ColorsConfig.palette.current.text
                height: parent.height
                text: Music.audioMedia.artista
            }
        }
    }
}

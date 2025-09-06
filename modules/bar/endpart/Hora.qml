import QtQuick
import qs.services
import qs.components
import qs.config

Row {
    id: row
    spacing: 5

    anchors {
        rightMargin: 15
        leftMargin: 15
    }

    MaterialIcon {
        text: "Schedule"
        fill: 1
        rightPadding: 5
        height: parent.height
    }

    StyledText {
        id: hora
        font.family: FontsConfig.font.tempesta
        height: parent.height
        bottomPadding: 5

        font.pixelSize: 21
        text: Time.time
    }
}

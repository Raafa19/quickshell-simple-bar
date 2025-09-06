import QtQuick
import qs.services
import qs.components

Row {
    id: row
    spacing: 5

    anchors {
        rightMargin: 15
        leftMargin: 15
    }

    MaterialIcon {
        text: "Calendar_Month"
        fill: 1
        rightPadding: 5
        height: parent.height
    }

    StyledText {
        id: fecha
        height: parent.height
        bottomPadding: 3

        text: Date.date
    }
}

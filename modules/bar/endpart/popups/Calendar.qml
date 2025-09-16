import QtQuick
import QtQuick.Controls
import QtQuick.Effects
import Quickshell.Widgets
import qs.config
import qs.components
import "settings"

ClippingRectangle {
    id: root

    implicitHeight: 250
    implicitWidth: 400
    // radius: 15

    bottomLeftRadius: 25
    color: ColorsConfig.palette.current.bar_background

    Column {
        id: column
        anchors.fill: parent

        DayOfWeekRow {
            id: dayOfWeek
            width: column.width
            locale: grid.locale

            delegate: StyledText {
                required property var model
                horizontalAlignment: Text.AlignHCenter
                text: model.shortName
                font.bold: true
            }
        }

        MonthGrid {
            id: grid
            locale: Qt.locale("es")
            year: 2025
            month: Calendar.September
            width: column.width
            height: column.height

            delegate: StyledText {
                required property var model
                opacity: model.month === grid.month ? 1 : 0
                horizontalAlignment: Text.AlignHCenter
                text: model.day
            }
        }
    }
}

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
        text: {
            switch (Battery.icon) {
                case 0 : {
                    return "Battery_Android_Bolt";
                }
                case 1 : {
                    return "Battery_Android_0";
                }
                case 2 : {
                    return "Battery_Android_5";
                }
                case 3 : {
                    return "Battery_Android_3";
                }
                default : {
                    return "Battery_Android_1";
                }

            }
        }
        fill: 1
        rightPadding: 5
        height: parent.height
    }

    StyledText {
        id: bateria
        font.family: FontsConfig.font.tempesta
        height: parent.height
        bottomPadding: 5

        font.pixelSize: 21
        text: `${Battery.percen} %`
    }
}

import QtQuick
import QtQuick.Controls
import Quickshell.Widgets
import qs.components
import qs.services
import qs.config

Column {
    id: column

    property int childHeight: 50
    property int childPixelSize: 30

    anchors.fill: parent
    spacing: 0

    Item {
        id: volumeContainer
        width: column.width
        height: volumeRow.implicitHeight
        Row {
            id: volumeRow
            height: column.childHeight
            width: column.width

            spacing: 15
            MaterialIcon {
                text: "Volume_Up"
                height: parent.height
                font.pixelSize: childPixelSize
            }
            Slider {
                id: volumeSlider

                width: parent.width - 80
                height: 20

                y: (volumeContainer.height / 2) - volumeSlider.height / 2

                from: 0
                to: 100
                value: Math.round(Audio.volume * 100)

                background: ClippingRectangle {
                    width: volumeSlider.width
                    height: volumeSlider.height
                    radius: 25
                    color: ColorsConfig.palette.current.surface_bright

                    Rectangle {
                        width: volumeSlider.visualPosition * parent.width
                        height: parent.height
                        color: ColorsConfig.palette.current.primary
                        radius: 25
                    }
                }
                handle: Rectangle {
                    height: volumeSlider.height
                    width: 20
                    radius: 25
                    color: ColorsConfig.palette.current.primary
                }
                onMoved: {
                    Audio.setVolume(value / 100);
                }
            }
            StyledText {
                text: Math.round(volumeSlider.value)
                font.family: FontsConfig.font.tempesta
                bottomPadding: 5
                font.pixelSize: 20
                height: parent.height
            }
        }
    }

    Item {
        id: brilloContainer
        width: column.width
        height: brilloRow.implicitHeight

        Row {
            id: brilloRow
            height: column.childHeight
            width: column.width
            spacing: 15

            MaterialIcon {
                text: "Brightness_6"
                font.pixelSize: childPixelSize
                height: parent.height
            }
            Slider {
                id: brilloSlider

                width: parent.width - 80
                height: 20

                y: (brilloContainer.height / 2) - brilloSlider.height / 2
                from: 5
                to: 100
                value: Brillo.currentBrillo
                stepSize: 1

                background: ClippingRectangle {
                    width: brilloSlider.width
                    height: brilloSlider.height
                    radius: 25
                    color: ColorsConfig.palette.current.surface_bright

                    Rectangle {
                        width: brilloSlider.visualPosition * parent.width
                        height: parent.height
                        color: ColorsConfig.palette.current.primary
                        radius: 25
                    }
                }
                handle: Rectangle {
                    height: brilloSlider.height
                    width: 20
                    radius: 25
                    color: ColorsConfig.palette.current.primary
                }

                onMoved: {
                    Brillo.setBrillo(Math.round(value));
                }
            }
            StyledText {
                text: Math.round(brilloSlider.value)
                bottomPadding: 5
                font.family: FontsConfig.font.tempesta
                font.pixelSize: 20
                height: parent.height
            }
        }
    }
}

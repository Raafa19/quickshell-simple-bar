// import Quickshell.Io
// import Quickshell
import QtQuick
import qs.config

StyledText {
    property real fill
    font.family: FontsConfig.font.material
    renderType: Text.NativeRendering
    textFormat: Text.PlainText
    font.pixelSize: 21

    font.variableAxes: ({
            FILL: fill ?? 0,
            GRAD: 0,
            opsz: fontInfo.pixelSize,
            wght: fontInfo.weight
        })
}

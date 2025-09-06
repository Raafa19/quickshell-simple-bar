import QtQuick

Item {
    id: marquee
    required property bool run
    anchors.horizontalCenter: run ? undefined : parent.horizontalCenter
    height: parent.height
    x: 15

    SequentialAnimation {
        id: marqueeAnim
        loops: Animation.Infinite
        running: marquee.run
        property int diff: parent.width - marquee.width

        PauseAnimation {
            duration: 5000
        }
        NumberAnimation {
            target: marquee
            properties: "x"
            from: 15
            to: marqueeAnim.diff - 15
            duration: 10000
        }
        PauseAnimation {
            duration: 5000
        }
        NumberAnimation {
            target: marquee
            properties: "x"
            from: marqueeAnim.diff - 15
            to: 15
            duration: 5000
        }
        PauseAnimation {
            duration: 5000
        }
    }
}

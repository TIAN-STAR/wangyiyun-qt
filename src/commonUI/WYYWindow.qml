import QtQuick 2.15
import QtQuick.Window 2.15
Window {
    id: window
    visible: true
    title: qsTr("Hello World")
    flags: Qt.FramelessWindowHint | Qt.Window |Qt.WindowsSystemMenuHint |
           Qt.WindowMaximizeButtonHint |Qt.WindowMinimizeButtonHint
    MouseArea{
        anchors.fill:parent
        property point clickPos:"0,0"
        onPressed: function(mouse){
            clickPos = Qt.point(mouse.x,mouse.y)
            console.log(clickPos)

        }
        onPositionChanged: function(mouse){
            let delta = Qt.point(mouse.x-clickPos.x,mouse.y-clickPos.y)
            window.x += delta.x
            window.y += delta.y
        }

    }




}

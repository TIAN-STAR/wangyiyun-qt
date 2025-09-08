import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import QtGraphicalEffects 1.15
import "../rightPage"
Window {
    id: window
    visible: true
    title: qsTr("Hello World")
    flags: Qt.FramelessWindowHint | Qt.Window
           |Qt.WindowsSystemMenuHint |
           Qt.WindowMaximizeButtonHint |Qt.WindowMinimizeButtonHint

    property real imgopacity: 0.6



    MouseArea{
        anchors.fill:parent
        property point clickPos:"0,0"
        onPressed: function(mouse){
            clickPos = Qt.point(mouse.x,mouse.y)

        }
        onPositionChanged: function(mouse){
            let delta = Qt.point(mouse.x-clickPos.x,mouse.y-clickPos.y)
            window.x += delta.x
            window.y += delta.y
        }

    }


}

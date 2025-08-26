import QtQuick 2.15
import QtQuick.Window 2.15

Window {
    id: window
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")
    flags: Qt.FramelessWindowHint | Qt.Window |Qt.WindowsSystemMenuHint |
           Qt.WindowMaximizeButtonHint |Qt.WindowMinimizeButtonHint
    Rectangle{
        id:leftRect
        width: 204
        anchors.top:parent.top
        anchors.bottom:bottomRect.top
        color: "#f0f3f6"
    }
    Rectangle{
        id:rightRect
        anchors.top:parent.top
        anchors.bottom:bottomRect.top
        anchors.left: leftRect.right
        anchors.right: parent.right
        color: "#f7f9fc"
        Rectangle{
            height:70
            anchors.top:parent.top
            anchors.right: parent.right
            anchors.left: parent.left
            Row{

                Image {
                    id:
                    source: "file"
                }
            }
        }


    }
    Rectangle{
        id:bottomRect
        anchors.top: leftRect
        height:80
        anchors.left: parent.left
        anchors.bottom: parent.bottom
        anchors.right: parent.right
        gradient: Gradient{
            orientation:Gradient.Horizontal
            GradientStop { position: 0.0;color: "#fcfcfd"}
            GradientStop { position: 0.5;color: "#fcfcfc"}
            GradientStop { position: 0.1;color: "#fdfefe"}

        }
    }
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

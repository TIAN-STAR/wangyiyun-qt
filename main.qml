import QtQuick 2.15
import QtQuick.Window 2.15
import QtGraphicalEffects 1.15
import "./src/leftPage"
import "./src/rightPage"
import "./src/playMusic"
import "./src/commonUI"

WYYWindow {
    id: window
    width: 1280
    height: 960
    LeftPage{
        id:leftRect
        width: 204
        anchors.top:parent.top
        anchors.bottom:bottomRect.top
        color: "#f0f3f6"
    }
    RightPage{
        id:rightRect
        anchors.top:parent.top
        anchors.bottom:bottomRect.top
        anchors.left: leftRect.right
        anchors.right: parent.right
        color: "#f7f9fc"
    }

    PlayMusic{
        id:bottomRect

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



}

import QtQuick 2.15
import QtQuick.Window 2.15
import "../commonUI"
Item{
    id:menuRec
    implicitWidth : menurow.implicitWidth+0.02*window.width


    Row{
        id: menurow
        anchors.verticalCenter: parent.verticalCenter
        anchors.right: parent.right
        anchors.rightMargin: 0.02*window.width
        spacing: 10

        Image {
            id:miniico
            sourceSize.width: menuRec.height/2.5
            anchors.verticalCenter: parent.verticalCenter
            fillMode :Image.PreserveAspectFit
            source: "qrc:/Resources/title/mini.svg"
        }
        Image {
            id:minico
            sourceSize.width: menuRec.height/3.4
            anchors.verticalCenter: parent.verticalCenter
            fillMode :Image.PreserveAspectFit
            source: "qrc:/Resources/title/min.svg"
            opacity: window.imgopacity

            MouseArea{
                anchors.fill: parent
                hoverEnabled: true
                onEntered: {
                    parent.opacity = 1  // 直接调整图标透明度
                }
                onExited: {
                    parent.opacity = window.imgopacity
                }
                onClicked: {
                    window.showMinimized()

                }
            }

        }
        Image {
            id:maxico
            sourceSize.width: menuRec.height/3.4
            anchors.verticalCenter: parent.verticalCenter
            fillMode :Image.PreserveAspectFit
            source: "qrc:/Resources/title/max_line.svg"
            opacity: window.imgopacity
            MouseArea{
                anchors.fill: parent
                hoverEnabled: true
                onEntered: {
                    parent.opacity = 1  // 直接调整图标透明度
                }
                onExited: {
                    parent.opacity = window.imgopacity
                }
                onClicked: {

                    if(window.visibility === Window.FullScreen){
                        window.visibility = Window.Windowed
                        parent.source = "qrc:/Resources/title/max_line.svg"
                    }
                    else{
                        window.visibility = Window.FullScreen
                        parent.source = "qrc:/Resources/title/max_line2.svg"
                    }


                    console.log(window.visibility)

                }
            }
        }
        Image {
            id:closeico
            sourceSize.width: menuRec.height/2.9
            anchors.verticalCenter: parent.verticalCenter
            fillMode :Image.PreserveAspectFit
            source: "qrc:/Resources/title/close.svg"
            opacity: window.imgopacity
            MouseArea{
                anchors.fill: parent
                hoverEnabled: true
                onEntered: {
                    parent.opacity = 1  // 直接调整图标透明度
                }
                onExited: {
                    parent.opacity = window.imgopacity
                }
                onClicked: {
                    Qt.quit()
                }
            }
        }
    }
}

import QtQuick 2.15
import QtQuick.Window 2.15
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
            opacity: 0.5

            MouseArea{
                anchors.fill: parent
                hoverEnabled: true
                onEntered: {
                    minico.opacity = 1  // 直接调整图标透明度
                }
                onExited: {
                    minico.opacity = 0.5
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
            opacity: 0.7
            MouseArea{
                anchors.fill: parent
                hoverEnabled: true
                onEntered: {
                    parent.opacity = 1  // 直接调整图标透明度
                }
                onExited: {
                    parent.opacity = 0.7
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
            opacity: 0.7
            MouseArea{
                anchors.fill: parent
                hoverEnabled: true
                onEntered: {
                    closeico.opacity = 1  // 直接调整图标透明度
                }
                onExited: {
                    closeico.opacity = 0.7
                }
                onClicked: {
                    Qt.quit()
                }
            }
        }
    }
}

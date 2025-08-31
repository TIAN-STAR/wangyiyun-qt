import QtQuick 2.15
import QtQuick.Controls 2.15
import "../commonUI"
//登录
Row{

    Item{
        height: 40
        implicitWidth : loginRow.implicitWidth
        anchors.verticalCenter: parent.verticalCenter
        Row{
            id:loginRow
            anchors.verticalCenter: parent.verticalCenter
            spacing: 8
            Rectangle{
                id: userIconRec
                width: 40
                height:width
                radius: width/2
                color:"#eaedf1"
                Image {
                    id: userlogo
                    anchors.centerIn: userIconRec
                    source: "qrc:/Resources/title/userlogo.svg"
                    sourceSize.width: userIconRec.width-10
                    fillMode :Image.PreserveAspectFit
                }
            }
            //未登录文本
            Text{
                id:loadStateText
                text:"未登录"
                color:"#666d7e"
                font.pixelSize: 16
                font.family: "微软雅黑 Light"
                anchors.verticalCenter: userIconRec.verticalCenter
                MouseArea{
                    anchors.fill: parent
                    hoverEnabled: true
                    onEntered: {
                        loadStateText.color = "#000000"
                    }
                    onExited: {
                        loadStateText.color = "#666d7e"
                    }
                }
            }
            //会员标识
            Item{
                height: userIconRec.height
                width: vipinfo.implicitWidth + vipRect.height+8 + bgBordRect.implicitWidth
                anchors.verticalCenter: parent.verticalCenter
                Rectangle{
                    id:vipRect
                    width:vipinfo.implicitWidth+vipRect.height+8
                    height: 16
                    radius: height/2
                    color: "#cccccc"
                    anchors.left : parent.left
                    anchors.verticalCenter: parent.verticalCenter
                    Label{
                        id:vipinfo
                        text:"VIP开通>"
                        anchors.left: parent.left
                        anchors.leftMargin:vipRect.height+8
                        color: "#ececec"
                        font.pixelSize: parent.height/2+1.5
                        font.family: "PingFang SC, Microsoft YaHei, Hiragino Sans GB, Heiti SC, Noto Sans CJK SC, sans-serif"
                        // font.weight: Font.Black
                        font.bold: true
                        anchors.verticalCenter: parent.verticalCenter
                    }
                }
                Rectangle{
                    id: bgBordRect
                    width: vipRect.height +6
                    height: width
                    radius: width/2
                    color: "#d8d8d8"
                    border.width: 2
                    border.color: "#f7f9fc"
                    anchors.verticalCenter: parent.verticalCenter
                    Rectangle{
                        width: parent.width-2
                        height: width
                        radius: width/2
                        color: "#dfdfde"
                        border.width: 2
                        border.color: "#d1d1d1"
                        anchors.centerIn:  parent
                        Rectangle{
                            width: parent.width/2
                            height: width
                            radius: width/2
                            color: "#dcdcdc"
                            border.width: 1
                            border.color: "#c0bebe"
                            anchors.centerIn:  parent
                            opacity:0.7

                        }

                    }
                }
            }
        }

    }
    //下拉登录
    Image{
        id:loginImg
        source: "qrc:/Resources/title/upselect.svg"
        sourceSize.width: parent.height/1.5
        anchors.verticalCenter: parent.verticalCenter
        fillMode :Image.PreserveAspectFit
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
                console.log("弹出登录窗口")

            }
        }
    }
    //消息中心
    Image{
        id:message
        source: "qrc:/Resources/title/message.svg"
        sourceSize.width: parent.height/1.7
        anchors.verticalCenter: parent.verticalCenter
        fillMode :Image.PreserveAspectFit
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
                console.log("弹出消息中心")

            }
        }
    }
    //设置
    Image{
        id:setting
        source: "qrc:/Resources/title/setting.svg"
        sourceSize.width: parent.height/1.7
        anchors.verticalCenter: parent.verticalCenter
        fillMode :Image.PreserveAspectFit
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
                console.log("弹出设置")

            }
        }
    }
    //皮肤
    Image{
        id:skin
        source: "qrc:/Resources/title/skin.svg"
        sourceSize.width: parent.height/1.9
        anchors.verticalCenter: parent.verticalCenter
        fillMode :Image.PreserveAspectFit
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
                console.log("弹出皮肤")

            }
        }
    }
    Rectangle{
        height: 24
        width:1
        color:"#e2e5e9"
        anchors.verticalCenter: parent.verticalCenter
    }

}



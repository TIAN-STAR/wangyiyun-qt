import QtQuick 2.15
import QtQuick.Controls 2.15
import "../commonUI"
//搜索框
Row{

    Rectangle{
        id: backForwardRect
        width:35
        height:40
        color:"#f7f9fc"
        border.width: 1
        border.color: "#f1f3f6"
        Image{
            anchors.centerIn: parent
            width: parent.height/1.5
            source: "qrc:/Resources/title/back.svg"
            fillMode :Image.PreserveAspectFit
            opacity:0.3
        }
    }

    WYYSearchBox{
        id:searchTextField
        height:backForwardRect.height
        width:320

        leftPadding: 60
        font {
            pixelSize: 18
            family: "PingFang SC, Microsoft YaHei, Hiragino Sans GB, Heiti SC, Noto Sans CJK SC, sans-serif"
        }
    }
    ListModel{
        id:historyListM
        ListElement{singleName:"邓紫棋"}
        ListElement{singleName:"张杰"}
        ListElement{singleName:"See you agin"}
        ListElement{singleName:"go go go"}
        ListElement{singleName:"周杰伦"}
    }

    Popup{
        id: searchPopup
        width: 500
        height: 600
        y:searchTextField.height+20
        background: Rectangle{
            anchors.fill:parent
            radius: 20
            color : "#ffffff"
            Item {
                id: historyItem
                anchors.left : parent.left
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.topMargin: 30
                anchors.leftMargin: 30
                //height
                Label{
                    id:searchLabel
                    color: "#283248"
                    text: "搜索历史"
                    font {
                        pixelSize: 16
                        family: "PingFang SC, Microsoft YaHei, Hiragino Sans GB, Heiti SC, Noto Sans CJK SC, sans-serif"
                    }

                }
                Image{
                    id: removeIcon
                    anchors.left: searchLabel.right
                    anchors.leftMargin: 30
                    anchors.top: searchLabel.top
                    anchors.verticalCenter: searchLabel.verticalCenter
                    width: searchLabel.height/1.5
                    source: "qrc:/Resources/title/delete.svg"
                    fillMode :Image.PreserveAspectFit
                    opacity:0.5
                    MouseArea{
                        anchors.fill: parent
                        hoverEnabled: true
                        onEntered: {
                            parent.opacity = 1  // 直接调整图标透明度
                        }
                        onExited: {
                            parent.opacity = 0.5
                        }
                        onClicked: {
                            console.log("Todo:清空历史")

                        }
                    }

                }
            }
            Flow{
                id : historyFlow
                anchors.top:historyItem.bottom
                anchors.left:historyItem.left
                anchors.right: historyItem.right
                anchors.topMargin: 30
                spacing: 20
                //?
                Repeater{
                    id: historyRep
                    anchors.fill: parent
                    model: historyListM
                    delegate: Rectangle{
                        width: dataLabel.implicitWidth+20
                        height:40
                        radius: height/2
                        color: "#f2f3f4"
                        border{
                            width:1
                            color: "#eff0f2"
                        }

                        Label{
                            id:dataLabel
                            text:modelData
                            anchors.centerIn: parent
                            color:"#646b7c"
                            font {
                                pixelSize: 17
                                family: "PingFang SC, Microsoft YaHei, Hiragino Sans GB, Heiti SC, Noto Sans CJK SC, sans-serif"
                            }
                        }
                        Image {
                            id: deleteIcon
                            source: "qrc:/Resources/title/delete_min.svg"
                            // 关键：中心点对齐右上角，然后通过负边距偏移
                            anchors.right: parent.right
                            anchors.top: parent.top
                            anchors.margins: -width / 2 // 负边距，让中心点对齐顶点
                            width: parent.height/3
                            fillMode :Image.PreserveAspectFit
                            visible: parent.hoverArea.containsMouse || hoverAreaImg.containsMouse
                            opacity: hoverAreaImg.containsMouse ? 0.9 : 0.4
                            MouseArea{
                                id:hoverAreaImg
                                anchors.fill: parent
                                hoverEnabled: true
                                onEntered: {
                                    parent.opacity = 1  // 直接调整图标透明度
                                    cursorShape = Qt.PointingHandCursor
                                }
                                onExited: {
                                    parent.opacity = window.imgopacity
                                    cursorShape = Qt.ArrowCursor
                                }
                                onClicked: {
                                    console.log("Todo:删除指定历史")

                                }
                            }
                        }
                        opacity:window.imgopacity
                        MouseArea{
                            id:hoverArea
                            anchors.fill: parent
                            hoverEnabled: true
                            onEntered: {
                                parent.opacity = 1  // 直接调整图标透明度
                                cursorShape = Qt.PointingHandCursor

                            }
                            onExited: {
                                parent.opacity = window.imgopacity
                                cursorShape = Qt.ArrowCursor
                            }
                            onClicked: {
                                console.log("Todo:清空历史")

                            }
                        }

                    }

                }
            }


        }

    }

    Rectangle{
        id: soundHoundRect
        radius: 8
        height:backForwardRect.height
        width:height
        gradient: Gradient{
            orientation:Gradient.Horizontal
            GradientStop { position: 0;color: "#f2e5f2"}
            GradientStop { position: 1;color: "#f7e3e2"}

        }
        Rectangle{
            anchors.fill: parent
            anchors.topMargin: 1
            anchors.leftMargin: 1
            anchors.rightMargin: 2
            anchors.bottomMargin: 2

            radius: 8
            gradient: Gradient{
                orientation:Gradient.Horizontal
                GradientStop { position: 0;color: recordGradientStopZero}
                GradientStop { position: 1;color: recordGradientStopOne}

            }

            MouseArea{
                anchors.fill: parent
                hoverEnabled: true
                onEntered: {
                    recordGradientStopZero = "#f2e7f7"
                    recordGradientStopOne = "#f7e6f3"
                }
                onExited: {
                    recordGradientStopZero = "#f5f0fa"
                    recordGradientStopOne = "#f7eff7"
                }
            }

        }


        Image{
            anchors.centerIn: parent
            width: parent.height/1.8
            source: "qrc:/Resources/title/linsen1.svg"
            fillMode :Image.PreserveAspectFit
            opacity:0.7
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
    }

}


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
        ListElement{singleName:"马頔"}
        ListElement{singleName:"南山南"}
        ListElement{singleName:"汪苏泷"}
        ListElement{singleName:"薛之谦"}
        ListElement{singleName:"张碧晨"}
        ListElement{singleName:"年轮"}
        ListElement{singleName:"听夜雨"}
        ListElement{singleName:"像风一样"}
        ListElement{singleName:"认真的雪"}
        ListElement{singleName:"Always online"}
        ListElement{singleName:"演员"}
        ListElement{singleName:"山谷"}
    }
    ListModel{
        id:likeListM
        ListElement{singleName:"斑马，斑马"}
        ListElement{singleName:"薛之谦"}
        ListElement{singleName:"泽典"}
        ListElement{singleName:"傲寒"}
        ListElement{singleName:"天外来物"}
        ListElement{singleName:"当那一天来临"}
        ListElement{singleName:"麒麟"}
        ListElement{singleName:"强军战歌"}
        ListElement{singleName:"句号"}
        ListElement{singleName:"林俊杰"}
        ListElement{singleName:"淘汰"}
        ListElement{singleName:"光年之外"}
        ListElement{singleName:"恋人"}
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
                property int threshold: 7
                property bool openAndCloseStatus: true
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
                        visible: (historyFlow.openAndCloseStatus && index>historyFlow.threshold) ?  false:true
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
                        opacity:window.imgopacity
                        MouseArea{
                            id:hoverArea
                            anchors.fill: parent
                            hoverEnabled: true
                            onEntered: {
                                parent.opacity = 1  // 直接调整图标透明度
                                cursorShape = Qt.PointingHandCursor
                                deleteIcon.statusMouse = 2

                            }
                            onExited: {
                                parent.opacity = window.imgopacity
                                cursorShape = Qt.ArrowCursor
                                deleteIcon.statusMouse = 0
                            }
                            onClicked: {
                                console.log("Todo:选中历史：",modelData)


                            }
                        }
                        Image {
                            id: deleteIcon
                            property int statusMouse: 0
                            source: "qrc:/Resources/title/delete_min.svg"
                            // 关键：中心点对齐右上角，然后通过负边距偏移
                            anchors.right: parent.right
                            anchors.top: parent.top
                            anchors.margins: -width / 2 // 负边距，让中心点对齐顶点
                            width: parent.height/3
                            fillMode :Image.PreserveAspectFit
                            function opacityImg(){
                                if(statusMouse === 1)
                                    return 0.9
                                else if(statusMouse === 2){
                                    return 0.4
                                }
                                else{
                                    return 0.0
                                }

                            }

                            // visible: hoverArea.containsMouse || hoverAreaImg.containsMouse
                            opacity: opacityImg()
                            MouseArea{
                                id:hoverAreaImg
                                anchors.fill: parent
                                hoverEnabled: true
                                onEntered: {
                                    cursorShape = Qt.PointingHandCursor
                                    deleteIcon.statusMouse = 1

                                }
                                onExited: {
                                    cursorShape = Qt.ArrowCursor
                                    deleteIcon.statusMouse = 0

                                }
                                onClicked: {
                                    console.log("Todo:删除指定历史")


                                }
                            }
                        }


                    }

                }
                //收起和展开
                Item {
                    width: 40

                    height: 40
                    Rectangle{
                        id:openAndClose
                        anchors.verticalCenter: parent.verticalCenter
                        width: 30
                        height:30
                        radius: height/2
                        border.width: 1
                        border.color: "#e9eaec"
                        color: "#ffffff"
                        opacity: 0.2
                        Image {
                            anchors.centerIn: parent
                            anchors.topMargin: 2
                            id: openAndCloseImg
                            source: "qrc:/Resources/title/OpenOther.svg"
                            width: parent.width/2
                            rotation: historyFlow.openAndCloseStatus ? 0 : 180

                            fillMode :Image.PreserveAspectFit
                        }
                        MouseArea{
                            anchors.fill: parent
                            hoverEnabled: true
                            onEntered: {
                                parent.opacity = 0.5  // 直接调整图标透明度
                                parent.color="#e9eaec"
                            }
                            onExited: {
                                parent.opacity = 0.2
                                parent.color="#ffffff"
                            }
                            onClicked: {
                                historyFlow.openAndCloseStatus = !historyFlow.openAndCloseStatus

                            }
                        }

                    }
                }

            }
            Item {
                id: likeItem
                anchors.left : parent.left
                anchors.right: parent.right
                anchors.top: historyFlow.bottom
                anchors.topMargin: 30
                anchors.leftMargin: 30
                //height
                Label{
                    id:likeLabel
                    color: "#283248"
                    text: "猜你喜欢"
                    font {
                        pixelSize: 16
                        family: "PingFang SC, Microsoft YaHei, Hiragino Sans GB, Heiti SC, Noto Sans CJK SC, sans-serif"
                    }

                }

            }
            Flow{
                id : likeFlow
                anchors.top:likeItem.bottom
                anchors.left:likeItem.left
                anchors.right: likeItem.right
                anchors.topMargin: 30
                spacing: 20
                property int threshold: 10
                property bool openAndCloseStatus: true

                //?
                Repeater{
                    id: likeRep
                    anchors.fill: parent
                    model: likeListM
                    delegate: Rectangle{
                        width: likedataLabel.implicitWidth+20
                        height:40
                        radius: height/2
                        color: "#f2f3f4"
                        border{
                            width:1
                            color: "#eff0f2"
                        }
                        visible: (likeFlow.openAndCloseStatus && index>likeFlow.threshold) ?  false:true

                        Label{
                            id:likedataLabel
                            text:modelData
                            anchors.centerIn: parent
                            color:"#646b7c"
                            font {
                                pixelSize: 17
                                family: "PingFang SC, Microsoft YaHei, Hiragino Sans GB, Heiti SC, Noto Sans CJK SC, sans-serif"
                            }
                        }
                        opacity:window.imgopacity
                        MouseArea{
                            id:likehoverArea
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
                                console.log("Todo:选中历史：",modelData)


                            }
                        }



                    }

                }
                //收起和展开
                Item {
                    width: 40

                    height: 40
                    Rectangle{
                        id:openAndCloseLike
                        anchors.verticalCenter: parent.verticalCenter
                        width: 30
                        height:30
                        radius: height/2
                        border.width: 1
                        border.color: "#e9eaec"
                        color: "#ffffff"
                        opacity: 0.2
                        Image {
                            anchors.centerIn: parent
                            anchors.topMargin: 2
                            id: openAndCloseLikeImg
                            source: "qrc:/Resources/title/OpenOther.svg"
                            width: parent.width/2
                            rotation: likeFlow.openAndCloseStatus ? 0 : 180

                            fillMode :Image.PreserveAspectFit
                        }
                        MouseArea{
                            anchors.fill: parent
                            hoverEnabled: true
                            onEntered: {
                                parent.opacity = 0.5  // 直接调整图标透明度
                                parent.color="#e9eaec"
                            }
                            onExited: {
                                parent.opacity = 0.2
                                parent.color="#ffffff"
                            }
                            onClicked: {
                                likeFlow.openAndCloseStatus = !likeFlow.openAndCloseStatus

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


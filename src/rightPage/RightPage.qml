import QtQuick 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15
import QtQuick.Layouts 1.15
import "../title"

Rectangle{
    id:rightRect
    //搜索框
    Row{
        id:searchRow
        anchors.left: parent.left
        anchors.leftMargin: 36
        anchors.verticalCenter: othersRo.verticalCenter
        spacing: 20
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
        TextField{
            id:searchTextField
            height:backForwardRect.height
            width:320

            leftPadding: 60
            // 设置背景圆角
            background: Rectangle {
                id: bgRect
                anchors.fill: parent
                radius: 8
                gradient: Gradient{
                    orientation:Gradient.Horizontal
                    GradientStop { position: 0;color: "#dae6fa"}
                    GradientStop { position: 1;color: "#f7e3f1"}

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
                        GradientStop { position: 0;color: "#ebf0fb"}
                        GradientStop { position: 1;color: "#f7eff7"}

                    }

                }


                RowLayout {
                    Layout.fillWidth: true    // 宽度与父组件一致
                    Layout.fillHeight: true   // 高度与父组件一致

                    anchors.verticalCenter: parent.verticalCenter

                    spacing: 10
                    // 最左边的空白占位元素，宽度 40 像素
                    Item {
                        Layout.preferredWidth: 15  // 固定宽度 40 像素
                        Layout.preferredHeight: 0  // 高度不占用空间（仅占位宽度）
                    }
                    Image{

                        id:searchIcon
                        Layout.preferredWidth: bgRect.height/1.7

                        // anchors.leftMargin: 40
                        fillMode :Image.PreserveAspectFit
                        opacity:0.4
                        Layout.alignment: Qt.AlignVCenter
                        source: "qrc:/Resources/title/search.svg"
                    }

                    Image {

                        Layout.preferredWidth: bgRect.height/1.7
                        fillMode :Image.PreserveAspectFit
                        opacity:0.4
                        source: "qrc:/Resources/title/fire.svg"
                        Layout.alignment: Qt.AlignVCenter

                    }

                    Text {
                        Layout.leftMargin:-10
                        text: "大家都在搜"
                        Layout.alignment: Qt.AlignVCenter
                        color: "#A9A9A9"
                        font {
                            pixelSize: 18
                            family: "PingFang SC, Microsoft YaHei, Hiragino Sans GB, Heiti SC, Noto Sans CJK SC, sans-serif"
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
                    GradientStop { position: 0;color: "#f5f0fa"}
                    GradientStop { position: 1;color: "#f7eff7"}

                }

            }


            Image{
                anchors.centerIn: parent
                width: parent.height/1.8
                source: "qrc:/Resources/title/linsen1.svg"
                fillMode :Image.PreserveAspectFit
                opacity:0.5
                MouseArea{
                    anchors.fill: parent
                    hoverEnabled: true
                    onEntered: {
                        parent.opacity = 1  // 直接调整图标透明度
                    }
                    onExited: {
                        parent.opacity = minAndmax.imgopacity
                    }
                    onClicked: {
                        console.log("弹出消息中心")

                    }
                }
            }
        }

    }

    //登录&设置
    UserCommonSetting{
        id:othersRo
        anchors.verticalCenter: minAndmax.verticalCenter
        anchors.right: minAndmax.left
        anchors.rightMargin: 10
        spacing: 10
    }



    //最大、最小、关闭
    MinAndMax{
        id:minAndmax
        height:70
        anchors.top:parent.top
        anchors.right: parent.right
    }

}

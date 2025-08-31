import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
TextField{

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
            id:innerRect
            anchors.fill: parent
            anchors.topMargin: 1
            anchors.leftMargin: 1
            anchors.rightMargin: 2
            anchors.bottomMargin: 2
            radius: 8
            property int gradientStoppos: 1
            gradient: Gradient{
                orientation:Gradient.Horizontal
                GradientStop { position: 0;color: "#ebf0fb"}
                GradientStop { position: innerRect.gradientStoppos;color: "#f7eff7"}

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
        MouseArea{
            anchors.fill:parent
            onClicked:{
                innerRect.gradientStoppos=0
                searchPopup.open()
            }
        }

    }

}

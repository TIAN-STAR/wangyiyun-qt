import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import "../title"

Rectangle{
    id:rightRect
    property color recordGradientStopZero: "#f5f0fa"
    property color recordGradientStopOne: "#f7eff7"

    //搜索框
    Search{
        id:searchRow
        anchors.left: parent.left
        anchors.leftMargin: 36
        anchors.verticalCenter: othersRo.verticalCenter
        spacing: 20
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

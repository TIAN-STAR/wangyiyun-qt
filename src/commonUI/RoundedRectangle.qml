// RoundedRectangle.qml
import QtQuick 2.15
import QtQuick.Shapes 1.15

Shape {
    id: root

    // 公共属性 - 与Rectangle保持一致
    property color color: "white"                    // 填充颜色
    property color borderColor: "transparent"        // 边框颜色
    property int borderWidth: 0                      // 边框宽度

    // 圆角属性 - 支持分别设置四个角
    property real radius: 0                          // 统一圆角半径
    property real topLeftRadius: radius              // 左上角半径
    property real topRightRadius: radius             // 右上角半径
    property real bottomLeftRadius: radius           // 左下角半径
    property real bottomRightRadius: radius          // 右下角半径

    // 确保圆角不会超过宽度/高度的一半
    function validateRadius(r, max) {
        return Math.min(r, max / 2);
    }

    // 计算有效的圆角半径
    property real validTopLeftRadius: validateRadius(topLeftRadius, Math.min(width, height))
    property real validTopRightRadius: validateRadius(topRightRadius, Math.min(width, height))
    property real validBottomLeftRadius: validateRadius(bottomLeftRadius, Math.min(width, height))
    property real validBottomRightRadius: validateRadius(bottomRightRadius, Math.min(width, height))

    // 形状路径
    ShapePath {
        id: shapePath
        strokeColor: root.borderWidth > 0 ? root.borderColor : "transparent"
        strokeWidth: root.borderWidth
        fillColor: root.color
        joinStyle: ShapePath.RoundJoin

        // 计算路径点
        property real w: root.width
        property real h: root.height
        property real tl: validTopLeftRadius
        property real tr: validTopRightRadius
        property real bl: validBottomLeftRadius
        property real br: validBottomRightRadius

        // 路径起点
        startX: tl
        startY: 0

        // 绘制路径
        PathLine { x: shapePath.w - shapePath.tr; y: 0 } // 上边
        PathArc {
            x: shapePath.w; y: shapePath.tr
            radiusX: shapePath.tr; radiusY: shapePath.tr
        } // 右上角

        PathLine { x: shapePath.w; y: shapePath.h - shapePath.br } // 右边
        PathArc {
            x: shapePath.w - shapePath.br; y: shapePath.h
            radiusX: shapePath.br; radiusY: shapePath.br
        } // 右下角

        PathLine { x: shapePath.bl; y: shapePath.h } // 下边
        PathArc {
            x: 0; y: shapePath.h - shapePath.bl
            radiusX: shapePath.bl; radiusY: shapePath.bl
        } // 左下角

        PathLine { x: 0; y: shapePath.tl } // 左边
        PathArc {
            x: shapePath.tl; y: 0
            radiusX: shapePath.tl; radiusY: shapePath.tl
        } // 左上角
    }
}

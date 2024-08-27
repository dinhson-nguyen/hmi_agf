import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts

Page {
    id: change_language
    TextField {
        id: _id_hang
        objectName: "__id_hang"
        font.pixelSize: 20
        text: "-------------------"
        property bool isBold: false
        property real radius: 12
        placeholderText: qsTr("Trống")
        placeholderTextColor: "#F44336" //AppStyle.placeholderColor
        font.family: isBold ? FontStyle.getContentFontBold.name : FontStyle.getContentFont.name
        font.bold: isBold ? Font.Bold : Font.Normal
        font.weight: isBold ? Font.Bold : Font.Normal

        background: Rectangle {
            // implicitHeight: _id_hang.implicitHeight
            // implicitWidth: _id_hang.implicitWidth
            radius: 12
            border.color: "#3850ff"
            border.width: control.activeFocus ? 2 : 1
            anchors.fill: parent
        }
    }
}

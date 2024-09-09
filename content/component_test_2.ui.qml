import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import QtQuick.VirtualKeyboard

Page {
    visible: true
    width: 400
    height: 400



    InputPanel {
        id: inputPanel
        visible: Qt.inputMethod.visible
        anchors.fill: parent
        anchors.leftMargin: 33
        anchors.rightMargin: 33
        anchors.topMargin: 256
        anchors.bottomMargin: 37
    }

    TextEdit {
        id: textEdit
        x: 54
        y: 92
        width: 80
        height: 20
        text: qsTr("Text Edit")
        font.pixelSize: 12
    }

}

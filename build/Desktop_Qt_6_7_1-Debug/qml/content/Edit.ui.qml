

/*
This is a UI file (.ui.qml) that is intended to be edited in Qt Design Studio only.
It is supposed to be strictly declarative and only uses a subset of QML. If you edit
this file manually, you might introduce QML code that is not supported by Qt Design Studio.
Check out https://doc.qt.io/qtcreator/creator-quick-ui-forms.html for details on .ui.qml files.
*/
import QtQuick 6.2
import QtQuick.Controls 6.2
import QtQuick.Layouts 6.2

// import backendqt 1.0

Page {
    id: ga
    // width: parent.width * 0.22
    // height: parent.height * 0.88
    anchors.right: parent.right
    anchors.top: parent.top
    anchors.bottom: left_down_panel.top
    anchors.rightMargin: 0
    anchors.topMargin: 0
    anchors.bottomMargin: 0
    ColumnLayout {
        id: left_edit
        width: parent.width * 0.5
        height: parent.height
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.bottom: left_down_panel.top
        anchors.rightMargin: 0
        anchors.topMargin: 0
        anchors.bottomMargin: 0
        Text {
            text: qsTr("ID")
            font.family: "Ubuntu"
            font.bold: true
            font.pointSize: 20
        }
        Text {
            text: qsTr("ID Hàng")
            font.pointSize: 20
            font.bold: true
            font.family: "Ubuntu"
        }
        Text {
            text: qsTr("Trạng thái ")
            font.pointSize: 20
            font.family: "Ubuntu"
            font.bold: true
        }
        Text {
            text: qsTr("Số thứ tự")
            font.pointSize: 20
            font.family: "Ubuntu"
            font.bold: true
        }
        Text {
            text: qsTr("height")
            font.pointSize: 20
            font.family: "Ubuntu"
            font.bold: true
        }

        Text {
            text: qsTr("column_id")
            font.pointSize: 20
            font.family: "Ubuntu"
            font.bold: true
        }
        Text {
            text: qsTr("destination")
            font.pointSize: 20
            font.family: "Ubuntu"
            font.bold: true
        }
        Text {
            text: qsTr("length")
            font.pointSize: 20
            font.family: "Ubuntu"
            font.bold: true
        }
        Text {
            text: qsTr("location_id")
            font.pointSize: 20
            font.family: "Ubuntu"
            font.bold: true
        }

        Text {
            text: qsTr("pallet_type")
            font.pointSize: 20
            font.family: "Ubuntu"
            font.bold: true
        }
        Text {
            text: qsTr("width")
            font.pointSize: 20
            font.family: "Ubuntu"
            font.bold: true
        }
    }
    ColumnLayout {
        id: right_edit
        width: parent.width * 0.5
        height: parent.height
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: left_down_panel.top
        anchors.rightMargin: 0
        anchors.topMargin: 0
        anchors.bottomMargin: 0
        TextEdit {
            id: _id
            text: qsTr("None")
            font.pixelSize: 20
        }
        TextEdit {
            id: _id_hang
            text: qsTr("None")
            font.pixelSize: 20
        }
        TextEdit {
            id: _status
            text: qsTr("None")
            font.pixelSize: 20
        }
        TextEdit {
            id: _stt
            text: qsTr("None")
            font.pixelSize: 20
        }
        TextEdit {
            id: _height
            text: qsTr("None")
            font.pixelSize: 20
        }
        TextEdit {
            id: _column_id
            text: qsTr("None")
            font.pixelSize: 20
        }
        TextEdit {
            id: _destination
            text: qsTr("None")
            font.pixelSize: 20
        }
        TextEdit {
            id: _length
            text: qsTr("None")
            font.pixelSize: 20
        }
        TextEdit {
            id: _location_id
            text: qsTr("None")
            font.pixelSize: 20
        }
        TextEdit {
            id: _pallet_type
            text: qsTr("None")
            font.pixelSize: 20
        }
        TextEdit {
            id: _width
            text: qsTr("None")
            font.pixelSize: 20
        }
        // TextEdit {
        //     id: id
        //     text: qsTr("None")
        //     font.pixelSize: 20
        // }            TextEdit {
        //     id: id
        //     text: qsTr("None")
        //     font.pixelSize: 20
        // }
        // TextEdit {
        //     id: id
        //     text: qsTr("None")
        //     font.pixelSize: 20
        // }
        // TextEdit {
        //     id: id
        //     text: qsTr("None")
        //     font.pixelSize: 20
        // }
        // TextEdit {
        //     id: id
        //     text: qsTr("None")
        //     font.pixelSize: 20
        // }
    }
}

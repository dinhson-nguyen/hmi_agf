

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
    id: edit_buffer
    // width: parent.width * 0.22
    // height: parent.height * 0.88
    anchors.right: parent.right
    anchors.top: parent.top
    anchors.bottom: left_down_panel.top
    anchors.rightMargin: 0
    anchors.topMargin: 0
    anchors.bottomMargin: 0
    property string text_default: "--------"

    // Dữ liệu JSON dưới dạng chuỗi
    

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
            text: qsTr("Unique ID")
            font.family: "Ubuntu"
            font.bold: true
            font.pointSize: 20
        }
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
            text: qsTr("type")
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
            text: qsTr("width")
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
            text: qsTr("zone_id")
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
            text: qsTr("location_id")
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
        
        TextField {
            id: ___id
            font.pixelSize:  25 * _id.height / 45
            text: text_default
            readOnly: true
            objectName: "____id"
            property bool isBold: false
            property real radius: 12
            placeholderText: qsTr("Trống")
            placeholderTextColor: "#F44336"//AppStyle.placeholderColor

            background:Rectangle{
                anchors.fill: parent
                radius: 12
                border.color: "#3850ff"
            }
        }

        TextField {
            id: _id
            font.pixelSize:  25 * _id.height / 45
            text: text_default
            objectName: "___id"
            property bool isBold: false
            property real radius: 12
            placeholderText: qsTr("Trống")
            placeholderTextColor: "#F44336"//AppStyle.placeholderColor

            background:Rectangle{
                anchors.fill: parent
                radius: 12
                border.color: "#3850ff"
            }
        }
        TextField {
            id: _id_hang
            objectName: "___id_hang"
            font.pixelSize:  25 * _id_hang.height / 45
            text: text_default
            property bool isBold: false
            property real radius: 12
            placeholderText: qsTr("Trống")
            placeholderTextColor: "#F44336"//AppStyle.placeholderColor

            background:Rectangle{
                anchors.fill: parent
                radius: 12
                border.color: "#3850ff"
            }
        }
        TextField {
            id: _status
            objectName: "___status"
            font.pixelSize:  25 * _status.height / 45
            text: text_default
            property bool isBold: false
            property real radius: 12
            placeholderText: qsTr("Trống")
            placeholderTextColor: "#F44336"//AppStyle.placeholderColor

            background:Rectangle{
                anchors.fill: parent
                radius: 12
                border.color: "#3850ff"
            }
        }
        TextField {
            id: _stt
            objectName: "___stt"
            font.pixelSize:  25 * _stt.height / 45
            text: text_default
            property bool isBold: false
            property real radius: 12
            placeholderText: qsTr("Trống")
            placeholderTextColor: "#F44336"//AppStyle.placeholderColor

            background:Rectangle{
                anchors.fill: parent
                radius: 12
                border.color: "#3850ff"
            }
        }
        TextField {
            id: _type
            objectName: "___type"
            font.pixelSize:  25 * _type.height / 45
            text: text_default
            property bool isBold: false
            property real radius: 12
            placeholderText: qsTr("Trống")
            placeholderTextColor: "#F44336"//AppStyle.placeholderColor

            background:Rectangle{
                anchors.fill: parent
                radius: 12
                border.color: "#3850ff"
            }
        }

        TextField {
            id: _height
            objectName: "___height"
            font.pixelSize:  25 * _type.height / 45
            text: text_default
            property bool isBold: false
            property real radius: 12
            placeholderText: qsTr("Trống")
            placeholderTextColor: "#F44336"//AppStyle.placeholderColor

            background:Rectangle{
                anchors.fill: parent
                radius: 12
                border.color: "#3850ff"
            }
        }

        TextField {
            id: _width
            objectName: "___width"
            font.pixelSize:  25 * _type.height / 45
            text: text_default
            property bool isBold: false
            property real radius: 12
            placeholderText: qsTr("Trống")
            placeholderTextColor: "#F44336"//AppStyle.placeholderColor

            background:Rectangle{
                anchors.fill: parent
                radius: 12
                border.color: "#3850ff"
            }
        }

        TextField {
            id: _length
            objectName: "___length"
            font.pixelSize:  25 * _type.height / 45
            text: text_default
            property bool isBold: false
            property real radius: 12
            placeholderText: qsTr("Trống")
            placeholderTextColor: "#F44336"//AppStyle.placeholderColor

            background:Rectangle{
                anchors.fill: parent
                radius: 12
                border.color: "#3850ff"
            }
        }

        TextField {
            id: _zone_id
            objectName: "___zone_id"
            font.pixelSize:  25 * _type.height / 45
            text: text_default
            property bool isBold: false
            property real radius: 12
            placeholderText: qsTr("Trống")
            placeholderTextColor: "#F44336"//AppStyle.placeholderColor

            background:Rectangle{
                anchors.fill: parent
                radius: 12
                border.color: "#3850ff"
            }
        }

        TextField {
            id: _column_id
            objectName: "___column_id"
            font.pixelSize:  25 * _type.height / 45
            text: text_default
            property bool isBold: false
            property real radius: 12
            placeholderText: qsTr("Trống")
            placeholderTextColor: "#F44336"//AppStyle.placeholderColor

            background:Rectangle{
                anchors.fill: parent
                radius: 12
                border.color: "#3850ff"
            }
        }

        TextField {
            id: _location_id
            objectName: "___location_id"
            font.pixelSize:  25 * _type.height / 45
            text: text_default
            property bool isBold: false
            property real radius: 12
            placeholderText: qsTr("Trống")
            placeholderTextColor: "#F44336"//AppStyle.placeholderColor

            background:Rectangle{
                anchors.fill: parent
                radius: 12
                border.color: "#3850ff"
            }
        }

    }
    Page {
        id: save_1
        width: parent.width * 0.3
        height: page1.height - parent.height
        anchors.left: parent.left
        anchors.top: parent.bottom
        anchors.leftMargin: 0
        anchors.topMargin: 0
        Button {
            id: edit_button
            text: "Lưu"
            anchors.fill: parent
            font.pointSize: 25 * edit_button.height / 118
            font.family: "ubuntu"
            font.bold: true
            display: AbstractButton.TextOnly

            background: Rectangle {
                color: "#FFFFFF"
                radius: 10
                border.color: "#4CAF50"
                border.width: 5
            }
            onClicked: {
                var jsonObject = {
                    "_id": ___id.text,
                    "id": _id.text,
                    "id_hang": _id_hang.text,
                    "status": _status.text,
                    "stt": _stt.text,
                    "type": _type.text,

                    "height": _height.text,
                    "width": _width.text,
                    "length": _length.text,
                    "zone_id": _zone_id.text,
                    "column_id": _column_id.text,
                    "location_id": _location_id.text,
                    
                
                };
                backend.saveDataBuffer(JSON.stringify(jsonObject, null, 2))
            }
            onPressedChanged: {
                if (pressed) {
                    background.color = "#4CAF50"; 
                    
                } else {
                    background.color = "#FFFFFF"; 
                    
                }
            }

        }
    }

    Page {
        id: delete_page
        width: parent.width * 0.3
        height: (page1.height - parent.height ) 
        anchors.left: save_1.right 
        anchors.top: parent.bottom 
        anchors.leftMargin: parent.width * 0.03
        anchors.bottomMargin: 0
        Button {
            id: delete_button
            text: "Xóa"
            anchors.fill: parent
            font.pointSize: 25 * edit_button.height / 118
            font.family: "ubuntu"
            font.bold: true
            display: AbstractButton.TextOnly

            background: Rectangle {
                color: "#FFFFFF"
                radius: 10
                border.color: "#F44336"
                border.width: 5
            }
            onClicked: {
                var jsonObject = {
                    "_id": ___id.text,
                    "id": _id.text,
                    "id_hang": _id_hang.text,
                    "status": _status.text,
                    "stt": _stt.text,
                    "type": _type.text,

                    "height": _height.text,
                    "width": _width.text,
                    "length": _length.text,
                    "zone_id": _zone_id.text,
                    "column_id": _column_id.text,
                    "location_id": _location_id.text,
                    
                
                };
                backend.deleteDataBuffer(JSON.stringify(jsonObject, null, 2))
                
                // backend.deleteDataBuffer(___id.text)
            }
            onPressedChanged: {
                if (pressed) {
                    background.color = "#F44336"; 
                    
                } else {
                    background.color = "#FFFFFF"; 
                    
                }
            }
        }
    }
}

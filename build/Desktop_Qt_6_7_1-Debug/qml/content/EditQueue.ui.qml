

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
    id: edit_queue
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
        width: parent.width * 0.4
        height: parent.height
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.bottom: left_down_panel.top
        anchors.rightMargin: 0
        anchors.topMargin: 0
        anchors.bottomMargin: 0

        Text {
            text: qsTr("Unique ID")
            font.pointSize: 18
            font.family: "Ubuntu"
            font.bold: true
        }
        Text {
            text: qsTr("ID")
            font.pointSize: 18
            font.family: "Ubuntu"
            font.bold: true
        }
        Text {
            text: qsTr("ID Cột")
            font.family: "Ubuntu"
            font.bold: true
            font.pointSize: 18
        }
        Text {
            text: qsTr("Zone ID")
            font.pointSize: 18
            font.bold: true
            font.family: "Ubuntu"
        }
        Text {
            text: qsTr("ID vị trí")
            font.pointSize: 18
            font.family: "Ubuntu"
            font.bold: true
        }

        Text {
            text: qsTr("Chiều cao")
            font.pointSize: 18
            font.family: "Ubuntu"
            font.bold: true
        }

        Text {
            text: qsTr("Chiều dài")
            font.pointSize: 18
            font.family: "Ubuntu"
            font.bold: true
        }
        Text {
            text: qsTr("Chiều rộng")
            font.pointSize: 18
            font.family: "Ubuntu"
            font.bold: true
        }
        Text {
            text: qsTr("Điểm đến")
            font.pointSize: 18
            font.family: "Ubuntu"
            font.bold: true
        }
        Text {
            text: qsTr("Mechandise")
            font.pointSize: 18
            font.family: "Ubuntu"
            font.bold: true
        }
        Text {
            text: qsTr("Model")
            font.pointSize: 18
            font.family: "Ubuntu"
            font.bold: true
        }

        Text {
            text: qsTr("Tên model")
            font.pointSize: 18
            font.family: "Ubuntu"
            font.bold: true
        }
        Text {
            text: qsTr("Type")
            font.pointSize: 18
            font.family: "Ubuntu"
            font.bold: true
        }
        Text {
            text: qsTr("Vị trí")
            font.pointSize: 18
            font.family: "Ubuntu"
            font.bold: true
            
        }
    }
    ColumnLayout {
        id: right_edit
        width: parent.width * 0.6
        height: parent.height
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: left_down_panel.top
        anchors.rightMargin: 0
        anchors.topMargin: 0
        anchors.bottomMargin: 0
        TextField {
            id: uuid_queue
            objectName: "uuid_queue"
            font.pixelSize:  25 * uuid_queue.height / 45
            text: "-----"
            readOnly: true
            property bool isBold: false
            property real radius: 12
            placeholderText: qsTr("Trống")
            placeholderTextColor: "#F44336"//AppStyle.placeholderColor
            font.styleName: "Medium Italic"


            background:Rectangle{
                anchors.fill: parent
                radius: 12
                border.color: "#3850ff"
            }
        }
        TextField {
            id: _id
            objectName: "_id"
            font.pixelSize:  25 * _id.height / 45
            text: "-----"
            property bool isBold: false
            property real radius: 12
            placeholderText: qsTr("Trống")
            placeholderTextColor: "#F44336"//AppStyle.placeholderColor
            font.styleName: "Medium Italic"


            background:Rectangle{
                anchors.fill: parent
                radius: 12
                border.color: "#3850ff"
            }
        }
        TextField {
            id: _column_id
            objectName: "_column_id"
            font.pixelSize:  25 * _column_id.height / 45
            text: "-----"
            property bool isBold: false
            property real radius: 12
            placeholderText: qsTr("Trống")
            placeholderTextColor: "#F44336"//AppStyle.placeholderColor
            font.styleName: "Medium Italic"


            background:Rectangle{
                anchors.fill: parent
                radius: 12
                border.color: "#3850ff"
            }
        }
        TextField {
            id: _zone_id
            objectName: "_zone_id"
            font.pixelSize:  25 * _zone_id.height / 45
            text: "-----"
            property bool isBold: false
            property real radius: 12
            placeholderText: qsTr("Trống")
            placeholderTextColor: "#F44336"//AppStyle.placeholderColor
            font.styleName: "Medium Italic"


            background:Rectangle{
                anchors.fill: parent
                radius: 12
                border.color: "#3850ff"
            }
        }
        
        TextField {
            id: _location_id
            objectName: "_location_id"
            font.pixelSize:  25 * _location_id.height / 45
            text: "-----"
            property bool isBold: false
            property real radius: 12
            placeholderText: qsTr("Trống")
            placeholderTextColor: "#F44336"//AppStyle.placeholderColor
            font.styleName: "Medium Italic"


            background:Rectangle{
                anchors.fill: parent
                radius: 12
                border.color: "#3850ff"
            }
        }
    
        TextField {
            id: _height
            objectName: "_height"
            font.pixelSize:  25 * _height.height / 45
            text: "-----"
            property bool isBold: false
            property real radius: 12
            placeholderText: qsTr("Trống")
            placeholderTextColor: "#F44336"//AppStyle.placeholderColor
            font.styleName: "Medium Italic"


            background:Rectangle{
                anchors.fill: parent
                radius: 12
                border.color: "#3850ff"
            }
        }
        
        TextField {
            id: _length
            objectName: "_length"
            font.pixelSize:  25 * _length.height / 45
            text: "-----"
            property bool isBold: false
            property real radius: 12
            placeholderText: qsTr("Trống")
            placeholderTextColor: "#F44336"//AppStyle.placeholderColor
            font.styleName: "Medium Italic"
            background:Rectangle{
                anchors.fill: parent
                radius: 12
                border.color: "#3850ff"
            }
        }

        TextField {
            id: _width
            objectName: "_width"
            font.pixelSize:  25 * _width.height / 45
            text: "-----"
            property bool isBold: false
            property real radius: 12
            placeholderText: qsTr("Trống")
            placeholderTextColor: "#F44336"//AppStyle.placeholderColor
            font.styleName: "Medium Italic"


            background:Rectangle{
                anchors.fill: parent
                radius: 12
                border.color: "#3850ff"
            }
        }
        
        TextField {
            id: _destination
            objectName: "_destination"
            font.pixelSize:  25 * _destination.height / 45
            text: "-----"
            property bool isBold: false
            property real radius: 12
            placeholderText: qsTr("Trống")
            placeholderTextColor: "#F44336"//AppStyle.placeholderColor
            font.styleName: "Medium Italic"


            background:Rectangle{
                anchors.fill: parent
                radius: 12
                border.color: "#3850ff"
            }
        }

        TextField {
            id: _mechandise
            objectName: "_mechandise"
            font.pixelSize:  25 * _mechandise.height / 45
            text: "-----"
            property bool isBold: false
            property real radius: 12
            placeholderText: qsTr("Trống")
            placeholderTextColor: "#F44336"//AppStyle.placeholderColor
            font.styleName: "Medium Italic"


            background:Rectangle{
                anchors.fill: parent
                radius: 12
                border.color: "#3850ff"
            }
        }

        TextField {
            id: _model
            objectName: "_model"
            font.pixelSize:  25 * _model.height / 45
            text: "-----"
            property bool isBold: false
            property real radius: 12
            placeholderText: qsTr("Trống")
            placeholderTextColor: "#F44336"//AppStyle.placeholderColor
            font.styleName: "Medium Italic"


            background:Rectangle{
                anchors.fill: parent
                radius: 12
                border.color: "#3850ff"
            }
        }

        TextField {
            id: _name_model
            objectName: "_name_model"
            font.pixelSize:  25 * _name_model.height / 45
            text: "-----"
            property bool isBold: false
            property real radius: 12
            placeholderText: qsTr("Trống")
            placeholderTextColor: "#F44336"//AppStyle.placeholderColor
            font.styleName: "Medium Italic"


            background:Rectangle{
                anchors.fill: parent
                radius: 12
                border.color: "#3850ff"
            }
        }

        TextField {
            id: _type
            objectName: "_type"
            font.pixelSize:  25 * _type.height / 45
            text: "-----"
            property bool isBold: false
            property real radius: 12
            placeholderText: qsTr("Trống")
            placeholderTextColor: "#F44336"//AppStyle.placeholderColor
            font.styleName: "Medium Italic"


            background:Rectangle{
                anchors.fill: parent
                radius: 12
                border.color: "#3850ff"
            }
        }

        TextField {
            id: _queue
            objectName: "_queue"
            font.pixelSize:  25 * _queue.height / 45
            text: "-----"
            property bool isBold: false
            property real radius: 12
            placeholderText: qsTr("Trống")
            placeholderTextColor: "#F44336"//AppStyle.placeholderColor
            font.styleName: "Medium Italic"


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
        // anchors.bottom: parent.bottom
        anchors.leftMargin: 0
        anchors.topMargin: 0
        Button {
            id: edit_button
            // height: left_panel.height * 0.12
            text: "Lưu"
            // width: parent.width
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
                    "_id": uuid_queue.text,
                    "id": _id.text,
                    "column_id": _column_id.text,
                    "zone_id": _zone_id.text,
                    "location_id": _location_id.text,
                    "height": _height.text,
                    "length": _length.text,
                    "width": _width.text,
                    "destination": _destination.text,
                    "mechandise": _mechandise.text,
                    "model": _model.text,
                    "name_model": _name_model.text,

                    "type": _type.text,
                    "queue": _queue.text,
                
                };
                // console.log(JSON.stringify(jsonObject, null, 2))
                
                backend.saveDataQueue(JSON.stringify(jsonObject, null, 2))
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
                
                backend.deleteDataQueue(uuid_queue.text)
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

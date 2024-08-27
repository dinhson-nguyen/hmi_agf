import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts

StackLayout {
    id: stackLayout
    x: 0
    y: 0
    width: 1700
    height: 500
    anchors.verticalCenter: parent.verticalCenter
    currentIndex: 1
    Item {
        id: buffer_item
        GridLayout {
            id: main_layout
            anchors.top: parent.top
            rowSpacing: 15
            columnSpacing: 20
            anchors.left: parent.left
            anchors.right: parent.right
            height: parent.height
            anchors.verticalCenter: parent.verticalCenter
            rows: 4
            columns: 6
            Text {
                text: qsTr("Unique ID: ")
                Layout.preferredWidth: parent.width * 0.15
                Layout.fillHeight: true
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                font.bold: true
                font.pointSize: 20
                Layout.column: 0
                Layout.row: 0
            }
            Text {
                text: qsTr("ID: ")
                Layout.preferredWidth: parent.width * 0.15
                Layout.fillHeight: true
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                font.bold: true
                font.pointSize: 20
                Layout.column: 2
                Layout.row: 0
            }
            Text {
                text: qsTr("ID Hàng: ")
                Layout.preferredWidth: parent.width * 0.15
                Layout.fillHeight: true
                font.pointSize: 20
                font.bold: true
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                Layout.column: 4
                Layout.row: 0
            }
            Text {
                text: qsTr("Trạng thái: ")
                font.pointSize: 20
                Layout.preferredWidth: parent.width * 0.15
                Layout.fillHeight: true
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                font.bold: true
                Layout.column: 0
                Layout.row: 1
            }
            Text {
                text: qsTr("Số thứ tự: ")
                font.pointSize: 20
                Layout.preferredWidth: parent.width * 0.15
                Layout.fillHeight: true
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                font.bold: true
                Layout.column: 2
                Layout.row: 1
            }
            Text {
                text: qsTr("type: ")
                font.pointSize: 20
                Layout.preferredWidth: parent.width * 0.15
                Layout.fillHeight: true
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                font.bold: true
                Layout.column: 4
                Layout.row: 1
            }
            Text {
                text: qsTr("height")
                font.pointSize: 20
                Layout.preferredWidth: parent.width * 0.15
                Layout.fillHeight: true
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                font.bold: true
                Layout.column: 0
                Layout.row: 2
            }
            Text {
                text: qsTr("width: ")
                font.pointSize: 20
                Layout.preferredWidth: parent.width * 0.15
                Layout.fillHeight: true
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                font.bold: true
                Layout.column: 2
                Layout.row: 2
            }
            Text {
                text: qsTr("length: ")
                font.pointSize: 20
                Layout.preferredWidth: parent.width * 0.15
                Layout.fillHeight: true
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                font.bold: true
                Layout.column: 4
                Layout.row: 2
            }
            Text {
                text: qsTr("zone_id: ")
                font.pointSize: 20
                Layout.preferredWidth: parent.width * 0.15
                Layout.fillHeight: true
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                font.bold: true
                Layout.column: 0
                Layout.row: 3
            }
            Text {
                text: qsTr("column_id: ")
                font.pointSize: 20
                Layout.preferredWidth: parent.width * 0.15
                Layout.fillHeight: true
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                font.bold: true
                Layout.column: 2
                Layout.row: 3
            }
            Text {
                text: qsTr("location_id: ")
                font.pointSize: 20
                Layout.preferredWidth: parent.width * 0.15
                Layout.fillHeight: true
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                font.bold: true
                Layout.column: 4
                Layout.row: 3
            }

            TextField {
                id: ___id
                font.pixelSize: 25 * _id.height / 45
                Layout.fillWidth: true
                text: "---"
                Layout.preferredWidth: parent.width * 0.2
                Layout.fillHeight: true
                readOnly: true
                objectName: "____id"
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                Layout.column: 1
                Layout.row: 0
                width: 150

                placeholderTextColor: "#F44336" //AppStyle.placeholderColor

                background: Rectangle {
                    radius: 5
                    border.color: "#3850ff"
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    anchors.horizontalCenter: parent.horizontalCenter
                }
            }

            TextField {
                id: _id
                objectName: "___id"
                font.pixelSize: 25 * _id.height / 45
                Layout.fillWidth: true
                text: "---"

                property bool isBold: false
                property real radius: 5
                width: 150
                Layout.preferredWidth: parent.width * 0.2
                Layout.fillHeight: true
                Layout.column: 3
                Layout.row: 0
                placeholderTextColor: "#F44336" //AppStyle.placeholderColor

                background: Rectangle {
                    anchors.fill: parent
                    radius: 5
                    border.color: "#3850ff"
                }
            }
            TextField {
                id: _id_hang
                objectName: "___id_hang"
                font.pixelSize: 25 * _id_hang.height / 45

                text: "---"
                Layout.preferredWidth: parent.width * 0.2
                Layout.fillHeight: true
                property bool isBold: false
                property real radius: 5
                Layout.column: 5
                Layout.row: 0
                placeholderTextColor: "#F44336" //AppStyle.placeholderColor

                background: Rectangle {
                    anchors.fill: parent
                    radius: 5
                    border.color: "#3850ff"
                }
            }
            TextField {
                id: _status
                objectName: "___status"
                font.pixelSize: 25 * _status.height / 45
                Layout.fillWidth: true
                text: "---"
                Layout.preferredWidth: parent.width * 0.2
                Layout.fillHeight: true
                property bool isBold: false
                property real radius: 5
                Layout.column: 1
                Layout.row: 1
                placeholderTextColor: "#F44336" //AppStyle.placeholderColor

                background: Rectangle {
                    anchors.fill: parent
                    radius: 5
                    border.color: "#3850ff"
                }
            }
            TextField {
                id: _stt
                objectName: "___stt"
                font.pixelSize: 25 * _stt.height / 45
                Layout.fillWidth: true
                text: "---"
                Layout.preferredWidth: parent.width * 0.2
                Layout.fillHeight: true
                property bool isBold: false
                property real radius: 5
                Layout.column: 3
                Layout.row: 1
                placeholderTextColor: "#F44336" //AppStyle.placeholderColor

                background: Rectangle {
                    anchors.fill: parent
                    radius: 5
                    border.color: "#3850ff"
                }
            }
            TextField {
                id: _type
                objectName: "___type"
                font.pixelSize: 25 * _type.height / 45
                Layout.fillWidth: true
                text: "---"
                Layout.preferredWidth: parent.width * 0.2
                Layout.fillHeight: true
                property bool isBold: false
                property real radius: 5
                Layout.column: 5
                Layout.row: 1
                placeholderTextColor: "#F44336" //AppStyle.placeholderColor

                background: Rectangle {
                    anchors.fill: parent
                    radius: 5
                    border.color: "#3850ff"
                }
            }

            TextField {
                id: _height
                objectName: "___height"
                font.pixelSize: 25 * _type.height / 45
                Layout.fillWidth: true
                text: "---"
                Layout.preferredWidth: parent.width * 0.2
                Layout.fillHeight: true
                property bool isBold: false
                property real radius: 5
                Layout.column: 1
                Layout.row: 2
                placeholderTextColor: "#F44336" //AppStyle.placeholderColor

                background: Rectangle {
                    anchors.fill: parent
                    radius: 5
                    border.color: "#3850ff"
                }
            }

            TextField {
                id: _width
                objectName: "___width"
                font.pixelSize: 25 * _type.height / 45
                Layout.fillWidth: true
                text: "---"
                Layout.preferredWidth: parent.width * 0.2
                Layout.fillHeight: true
                property bool isBold: false
                property real radius: 5
                Layout.column: 3
                Layout.row: 2
                placeholderTextColor: "#F44336" //AppStyle.placeholderColor

                background: Rectangle {
                    anchors.fill: parent
                    radius: 5
                    border.color: "#3850ff"
                }
            }

            TextField {
                id: _length
                objectName: "___length"
                font.pixelSize: 25 * _type.height / 45
                Layout.fillWidth: true
                text: "---"
                Layout.preferredWidth: parent.width * 0.2
                Layout.fillHeight: true
                property bool isBold: false
                property real radius: 5
                Layout.column: 5
                Layout.row: 2
                placeholderTextColor: "#F44336" //AppStyle.placeholderColor

                background: Rectangle {
                    anchors.fill: parent
                    radius: 5
                    border.color: "#3850ff"
                }
            }

            TextField {
                id: _zone_id
                objectName: "___zone_id"
                font.pixelSize: 25 * _type.height / 45
                Layout.fillWidth: true
                text: "---"
                Layout.preferredWidth: parent.width * 0.2
                Layout.fillHeight: true
                property bool isBold: false
                property real radius: 5
                Layout.column: 1
                Layout.row: 3
                placeholderTextColor: "#F44336" //AppStyle.placeholderColor

                background: Rectangle {
                    anchors.fill: parent
                    radius: 5
                    border.color: "#3850ff"
                }
            }

            TextField {
                id: _column_id
                objectName: "___column_id"
                font.pixelSize: 25 * _type.height / 45
                Layout.fillWidth: true
                text: "---"
                Layout.preferredWidth: parent.width * 0.2
                Layout.fillHeight: true
                property bool isBold: false
                property real radius: 5
                Layout.column: 3
                Layout.row: 3
                placeholderTextColor: "#F44336" //AppStyle.placeholderColor

                background: Rectangle {
                    anchors.fill: parent
                    radius: 5
                    border.color: "#3850ff"
                }
            }

            TextField {
                id: _location_id
                objectName: "___location_id"
                font.pixelSize: 25 * _type.height / 45
                Layout.fillWidth: true
                text: "---"
                Layout.preferredWidth: parent.width * 0.2
                Layout.fillHeight: true
                property bool isBold: false
                property real radius: 5
                Layout.column: 5
                Layout.row: 3
                placeholderTextColor: "#F44336" //AppStyle.placeholderColor

                background: Rectangle {
                    anchors.fill: parent
                    radius: 5
                    border.color: "#3850ff"
                }
            }
        }
    }
    Item {
        id: grid_queue
        GridLayout {
            id: main_layout_queue
            anchors.top: parent.top
            rowSpacing: 15
            columnSpacing: 20
            anchors.left: parent.left
            anchors.right: parent.right
            height: parent.height
            anchors.verticalCenter: parent.verticalCenter
            rows: 5
            columns: 6

            Text {
                text: qsTr("Unique ID")
                font.pointSize: 18
                font.family: "Ubuntu"
                font.bold: true
                Layout.preferredWidth: parent.width * 0.15
                Layout.fillHeight: true
                Layout.row: 0
                Layout.column: 0
            }
            Text {
                text: qsTr("ID")
                font.pointSize: 18
                font.family: "Ubuntu"
                font.bold: true
                Layout.preferredWidth: parent.width * 0.15
                Layout.fillHeight: true
                Layout.row: 0
                Layout.column: 2
            }
            Text {
                text: qsTr("ID Cột")
                font.family: "Ubuntu"
                font.bold: true
                Layout.preferredWidth: parent.width * 0.15
                Layout.fillHeight: true
                font.pointSize: 18
                Layout.row: 0
                Layout.column: 4
            }
            Text {
                text: qsTr("Zone ID")
                font.pointSize: 18
                font.bold: true
                Layout.preferredWidth: parent.width * 0.15
                Layout.fillHeight: true
                font.family: "Ubuntu"
                Layout.row: 1
                Layout.column: 0
            }
            Text {
                text: qsTr("ID vị trí")
                font.pointSize: 18
                font.family: "Ubuntu"
                Layout.preferredWidth: parent.width * 0.15
                Layout.fillHeight: true
                font.bold: true
                Layout.row: 1
                Layout.column: 2
            }

            Text {
                text: qsTr("Chiều cao")
                font.pointSize: 18
                font.family: "Ubuntu"
                Layout.preferredWidth: parent.width * 0.15
                Layout.fillHeight: true
                font.bold: true
                Layout.row: 1
                Layout.column: 4
            }

            Text {
                text: qsTr("Chiều dài")
                font.pointSize: 18
                font.family: "Ubuntu"
                Layout.preferredWidth: parent.width * 0.15
                Layout.fillHeight: true
                font.bold: true
                Layout.row: 2
                Layout.column: 0
            }
            Text {
                text: qsTr("Chiều rộng")
                font.pointSize: 18
                font.family: "Ubuntu"
                Layout.preferredWidth: parent.width * 0.15
                Layout.fillHeight: true
                font.bold: true
                Layout.row: 2
                Layout.column: 2
            }
            Text {
                text: qsTr("Điểm đến")
                font.pointSize: 18
                font.family: "Ubuntu"
                Layout.preferredWidth: parent.width * 0.15
                Layout.fillHeight: true
                font.bold: true
                Layout.row: 2
                Layout.column: 4
            }
            Text {
                text: qsTr("Mechandise")
                font.pointSize: 18
                font.family: "Ubuntu"
                Layout.preferredWidth: parent.width * 0.15
                Layout.fillHeight: true
                font.bold: true
                Layout.row: 3
                Layout.column: 0
            }
            Text {
                text: qsTr("Model")
                font.pointSize: 18
                font.family: "Ubuntu"
                Layout.preferredWidth: parent.width * 0.15
                Layout.fillHeight: true
                font.bold: true
                Layout.row: 3
                Layout.column: 2
            }

            Text {
                text: qsTr("Tên model")
                font.pointSize: 18
                font.family: "Ubuntu"
                Layout.preferredWidth: parent.width * 0.15
                Layout.fillHeight: true
                font.bold: true
                Layout.row: 3
                Layout.column: 4
            }
            Text {
                text: qsTr("Type")
                font.pointSize: 18
                font.family: "Ubuntu"
                Layout.preferredWidth: parent.width * 0.15
                Layout.fillHeight: true
                font.bold: true
                Layout.row: 4
                Layout.column: 0
            }
            Text {
                text: qsTr("Vị trí")
                font.pointSize: 18
                font.family: "Ubuntu"
                Layout.preferredWidth: parent.width * 0.15
                Layout.fillHeight: true
                font.bold: true
                Layout.row: 4
                Layout.column: 2
            }

            TextField {
                id: uuid_queue
                objectName: "uuid_queue"
                font.pixelSize: 25 * _id.height / 45
                Layout.fillWidth: true
                text: "---"

                property bool isBold: false
                property real radius: 5
                width: 150
                Layout.preferredWidth: parent.width * 0.2
                Layout.fillHeight: true
                Layout.column: 1
                Layout.row: 0
                placeholderTextColor: "#F44336" //AppStyle.placeholderColor

                background: Rectangle {
                    anchors.fill: parent
                    radius: 5
                    border.color: "#3850ff"
                }
            }
            TextField {
                id: _id_
                objectName: "_id"
                font.pixelSize: 25 * _id.height / 45
                Layout.fillWidth: true
                text: "---"

                property bool isBold: false
                property real radius: 5
                width: 150
                Layout.preferredWidth: parent.width * 0.2
                Layout.fillHeight: true
                Layout.column: 3
                Layout.row: 0
                placeholderTextColor: "#F44336" //AppStyle.placeholderColor

                background: Rectangle {
                    anchors.fill: parent
                    radius: 5
                    border.color: "#3850ff"
                }
            }
            TextField {
                id: _column_id_
                objectName: "_column_id"
                font.pixelSize: 25 * _id.height / 45
                Layout.fillWidth: true
                text: "---"

                property bool isBold: false
                property real radius: 5
                width: 150
                Layout.preferredWidth: parent.width * 0.2
                Layout.fillHeight: true
                Layout.column: 5
                Layout.row: 0
                placeholderTextColor: "#F44336" //AppStyle.placeholderColor

                background: Rectangle {
                    anchors.fill: parent
                    radius: 5
                    border.color: "#3850ff"
                }
            }
            TextField {
                id: _zone_id_
                objectName: "_zone_id"
                font.pixelSize: 25 * _id.height / 45
                Layout.fillWidth: true
                text: "---"

                property bool isBold: false
                property real radius: 5
                width: 150
                Layout.preferredWidth: parent.width * 0.2
                Layout.fillHeight: true
                Layout.column: 1
                Layout.row: 1
                placeholderTextColor: "#F44336" //AppStyle.placeholderColor

                background: Rectangle {
                    anchors.fill: parent
                    radius: 5
                    border.color: "#3850ff"
                }
            }

            TextField {
                id: _location_id_
                objectName: "_location_id"
                font.pixelSize: 25 * _id.height / 45
                Layout.fillWidth: true
                text: "---"

                property bool isBold: false
                property real radius: 5
                width: 150
                Layout.preferredWidth: parent.width * 0.2
                Layout.fillHeight: true
                Layout.column: 3
                Layout.row: 1
                placeholderTextColor: "#F44336" //AppStyle.placeholderColor

                background: Rectangle {
                    anchors.fill: parent
                    radius: 5
                    border.color: "#3850ff"
                }
            }

            TextField {
                id: _height_
                objectName: "_height"
                font.pixelSize: 25 * _id.height / 45
                Layout.fillWidth: true
                text: "---"

                property bool isBold: false
                property real radius: 5
                width: 150
                Layout.preferredWidth: parent.width * 0.2
                Layout.fillHeight: true
                Layout.column: 5
                Layout.row: 1
                placeholderTextColor: "#F44336" //AppStyle.placeholderColor

                background: Rectangle {
                    anchors.fill: parent
                    radius: 5
                    border.color: "#3850ff"
                }
            }

            TextField {
                id: _length_
                objectName: "_length"
                font.pixelSize: 25 * _id.height / 45
                Layout.fillWidth: true
                text: "---"

                property bool isBold: false
                property real radius: 5
                width: 150
                Layout.preferredWidth: parent.width * 0.2
                Layout.fillHeight: true
                Layout.column: 1
                Layout.row: 2
                placeholderTextColor: "#F44336" //AppStyle.placeholderColor

                background: Rectangle {
                    anchors.fill: parent
                    radius: 5
                    border.color: "#3850ff"
                }
            }

            TextField {
                id: _width_
                objectName: "_width"
                font.pixelSize: 25 * _id.height / 45
                Layout.fillWidth: true
                text: "---"

                property bool isBold: false
                property real radius: 5
                width: 150
                Layout.preferredWidth: parent.width * 0.2
                Layout.fillHeight: true
                Layout.column: 3
                Layout.row: 2
                placeholderTextColor: "#F44336" //AppStyle.placeholderColor

                background: Rectangle {
                    anchors.fill: parent
                    radius: 5
                    border.color: "#3850ff"
                }
            }

            TextField {
                id: _destination_
                objectName: "_destination"
                font.pixelSize: 25 * _id.height / 45
                Layout.fillWidth: true
                text: "---"

                property bool isBold: false
                property real radius: 5
                width: 150
                Layout.preferredWidth: parent.width * 0.2
                Layout.fillHeight: true
                Layout.column: 5
                Layout.row: 2
                placeholderTextColor: "#F44336" //AppStyle.placeholderColor

                background: Rectangle {
                    anchors.fill: parent
                    radius: 5
                    border.color: "#3850ff"
                }
            }

            TextField {
                id: _mechandise_
                objectName: "_mechandise"
                font.pixelSize: 25 * _id.height / 45
                Layout.fillWidth: true
                text: "---"

                property bool isBold: false
                property real radius: 5
                width: 150
                Layout.preferredWidth: parent.width * 0.2
                Layout.fillHeight: true
                Layout.column: 1
                Layout.row: 3
                placeholderTextColor: "#F44336" //AppStyle.placeholderColor

                background: Rectangle {
                    anchors.fill: parent
                    radius: 5
                    border.color: "#3850ff"
                }
            }

            TextField {
                id: _model_
                objectName: "_model"
                font.pixelSize: 25 * _id.height / 45
                Layout.fillWidth: true
                text: "---"

                property bool isBold: false
                property real radius: 5
                width: 150
                Layout.preferredWidth: parent.width * 0.2
                Layout.fillHeight: true
                Layout.column: 3
                Layout.row: 3
                placeholderTextColor: "#F44336" //AppStyle.placeholderColor

                background: Rectangle {
                    anchors.fill: parent
                    radius: 5
                    border.color: "#3850ff"
                }
            }

            TextField {
                id: _name_model_
                objectName: "_name_model"
                font.pixelSize: 25 * _id.height / 45
                Layout.fillWidth: true
                text: "---"

                property bool isBold: false
                property real radius: 5
                width: 150
                Layout.preferredWidth: parent.width * 0.2
                Layout.fillHeight: true
                Layout.column: 5
                Layout.row: 3
                placeholderTextColor: "#F44336" //AppStyle.placeholderColor

                background: Rectangle {
                    anchors.fill: parent
                    radius: 5
                    border.color: "#3850ff"
                }
            }

            TextField {
                id: _type_
                objectName: "_type"
                font.pixelSize: 25 * _id.height / 45
                Layout.fillWidth: true
                text: "---"

                property bool isBold: false
                property real radius: 5
                width: 150
                Layout.preferredWidth: parent.width * 0.2
                Layout.fillHeight: true
                Layout.column: 1
                Layout.row: 4
                placeholderTextColor: "#F44336" //AppStyle.placeholderColor

                background: Rectangle {
                    anchors.fill: parent
                    radius: 5
                    border.color: "#3850ff"
                }
            }

            TextField {
                id: _queue
                objectName: "_queue"
                font.pixelSize: 25 * _id.height / 45
                Layout.fillWidth: true
                text: "---"

                property bool isBold: false
                property real radius: 5
                width: 150
                Layout.preferredWidth: parent.width * 0.2
                Layout.fillHeight: true
                Layout.column: 3
                Layout.row: 4
                placeholderTextColor: "#F44336" //AppStyle.placeholderColor

                background: Rectangle {
                    anchors.fill: parent
                    radius: 5
                    border.color: "#3850ff"
                }
            }
        }
    }
}

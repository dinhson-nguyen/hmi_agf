import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import QtQuick.VirtualKeyboard

Page {
    visible: true
    width: 800
    height: 400

    RowLayout {
        id: footer_layout
        anchors.top: stackLayout.bottom
        anchors.bottom: parent.bottom
        layoutDirection: Qt.RightToLeft
        spacing: 10
        // width: parent.width * 0.5
        anchors.right: parent.right
        anchors.topMargin: 10

        Button {
            id: view_button
            // height: parent.height * 0.12
            text: "Trở về"
            Layout.preferredWidth: parent.width * 0.2
            Layout.fillHeight: true

            font.pointSize: 25 * view_button.height / 118
            font.family: "ubuntu"
            font.bold: true
            display: AbstractButton.TextOnly
            background: Rectangle {
                color: "#FFFFFF"
                radius: 10
                border.color: "#607D8B"
                border.width: 5
            }
        }
        Button {
            id: del_button
            // height: parent.height * 0.12
            text: "Xóa"
            Layout.preferredWidth: parent.width * 0.2
            Layout.fillHeight: true

            font.pointSize: 25 * del_button.height / 118
            font.family: "ubuntu"
            font.bold: true
            display: AbstractButton.TextOnly
            background: Rectangle {
                color: "#FFFFFF"
                radius: 10
                border.color: "#F44336"
                border.width: 5
            }

            //     animation_goout.start();
            //     animation_forward.start();
        }
        Button {
            id: save_button
            // height: parent.height * 0.12
            text: "Lưu"
            Layout.preferredWidth: parent.width * 0.2
            Layout.fillHeight: true

            font.pointSize: 25 * save_button.height / 118
            font.family: "ubuntu"
            font.bold: true
            display: AbstractButton.TextOnly
            background: Rectangle {
                color: "#FFFFFF"
                radius: 10
                border.color: "#4CAF50"
                border.width: 5
            }

            //     animation_goout.start();
            //     animation_forward.start();
        }
        Button {
            id: add_button
            // height: parent.height * 0.12
            text: "Thêm"

            Layout.preferredWidth: parent.width * 0.2
            Layout.fillHeight: true

            font.pointSize: 25 * add_button.height / 118
            font.family: "ubuntu"
            font.bold: true
            display: AbstractButton.TextOnly
            background: Rectangle {
                color: "#FFFFFF"
                radius: 10
                border.color: "#9E9E9E"
                border.width: 5
            }

            //     animation_goout.start();
            //     animation_forward.start();
        }

        Button {
            id: model_button
            // height: parent.height * 0.12
            text: "Model"
            Layout.preferredWidth: parent.width * 0.2
            Layout.fillHeight: true

            font.pointSize: 25 * view_button.height / 118
            font.family: "ubuntu"
            font.bold: true
            display: AbstractButton.TextOnly
            background: Rectangle {
                color: "#FFFFFF"
                radius: 10
                border.color: "#607D8B"
                border.width: 5
            }
        }
    }
}

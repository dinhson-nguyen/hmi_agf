

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
    id: left_panel
    // width: parent.width * 0.22
    // height: parent.height * 0.88
    anchors.right: parent.right
    anchors.top: parent.top
    anchors.bottom: left_down_panel.top
    anchors.rightMargin: 0
    anchors.topMargin: 0
    anchors.bottomMargin: 0


    Button {
        id: control_button
        text: qsTr(control_mode)
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        // anchors.bottom: parent.bottom
        height: left_panel.width * 0.275
        anchors.leftMargin: 5
        anchors.rightMargin: 5
        anchors.topMargin: 10
        anchors.bottomMargin: 0
        highlighted: false
        font.bold: true
        font.pointSize: 45 * left_panel.width / 430

        background: Rectangle {
            color: "#2196F3"
            radius: 30 * parent.height / 104
            border.color: control_button.background.color
            border.width: 1
        }
    }
    Button {
        id: status_button
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: control_button.bottom
        // anchors.bottom: parent.bottom
        height: left_panel.width * 0.275
        text: "INITIATING"
        anchors.leftMargin: 5
        anchors.rightMargin: 5
        anchors.topMargin: 20
        anchors.bottomMargin: 0
        highlighted: false
        font.bold: true
        font.pointSize: 45 * left_panel.width / 430
        background: Rectangle {
            color: "white"
            radius: 30 * parent.height / 104
            border.color: status_button.background.color
            border.width: 1
        }
    }
    Button {
        id: mode_button
        text: qsTr(mode_mode)
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: status_button.bottom
        height: left_panel.width * 0.275
        anchors.leftMargin: 5
        anchors.rightMargin: 5
        anchors.topMargin: 20
        anchors.bottomMargin: 0
        font.bold: true
        font.pointSize: 45 * left_panel.width / 430
        background: Rectangle {
            color: "#4CAF50"
            radius: 30 * parent.height / 104
            border.color: mode_button.background.color
            border.width: 1
        }
    }

    ColumnLayout {
        id: batt_info
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: mode_button.bottom
        anchors.bottom: parent.bottom
        anchors.leftMargin: 5
        anchors.rightMargin: 5
        anchors.topMargin: 20 * parent.height / 980
        anchors.bottomMargin: 0

        Rectangle {
            id: row
            anchors.fill: parent

            Rectangle {
                id: batt_number
                width: parent.width * 0.35
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                ColumnLayout {
                    anchors.fill: parent
                    spacing: 2
                    Button {
                        id: mute_button_main
                        Layout.fillWidth: true
                        Layout.preferredHeight: parent.height * 0.25
                        font.family: "ubuntu"
                        font.bold: true
                        icon.color: "#448AFF"
                        icon.height: 75
                        icon.width: 75
                        icon.source: state_mute
                        display: AbstractButton.IconOnly

                        background: Rectangle {
                            color: "#F5F5F5"
                            radius: 10
                            border.color: "#FFFFFF"
                            border.width: 5
                        }
                        // onPressedChanged: {
                        //     if (pressed) {
                        //         background.color = "#B0BEC5"
                        //     } else {
                        //         background.color = "#F5F5F5"
                        //     }
                        // }
                        // onClicked: {
                        //     if (state_mute == "qrc:/content/asset/sound.svg") {
                        //         state_mute = "qrc:/content/asset/mute.svg"
                        //         backend.getVolume_on_off(0)
                        //     } else {
                        //         state_mute = "qrc:/content/asset/sound.svg"
                        //         backend.getVolume_on_off(1)
                        //     }
                        // }
                    }

                    Text {
                        id: percent_text
                        height: parent.height * 0.2
                        text: batteryPercentage.toFixed(2) + qsTr(" %")
                        Layout.fillWidth: true
                        Layout.preferredHeight: parent.height * 0.2
                        font.pixelSize: 40 * batt_number.width / 150
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        font.italic: true
                        font.bold: true
                    }

                    Text {
                        id: vol_text
                        height: parent.height * 0.2
                        text: batteryVoltage.toFixed(2) + qsTr(" V")
                        Layout.fillWidth: true
                        Layout.preferredHeight: parent.height * 0.2
                        font.pixelSize: 40 * batt_number.width / 150
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        font.italic: true
                        font.bold: true
                    }
                    Text {
                        id: ampe_text
                        // height: parent.height * 0.2
                        text: batteryCurrent.toFixed(2) + qsTr(" A")

                        Layout.fillWidth: true
                        Layout.preferredHeight: parent.height * 0.2
                        font.pixelSize: 40 * batt_number.width / 150
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        font.italic: true
                        font.bold: true
                    }
                }
            }

            Rectangle {
                id: rectangle
                color: "#ffffff"
                anchors.left: parent.left
                anchors.right: batt_number.left
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                anchors.rightMargin: 0
                anchors.topMargin: 30 * parent.height / 480

                Rectangle {
                    id: pin_head
                    color: "#ffffff"
                    radius: 40 * pin_head.width / 167
                    border.color: "#84f5a2"
                    border.width: 20
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.bottom: pin.bottom
                    anchors.leftMargin: parent.width * 0.32
                    anchors.rightMargin: parent.width * 0.32
                    anchors.topMargin: parent.height * 0.03
                    anchors.bottomMargin: 0
                }

                Rectangle {
                    id: pin
                    color: "#ffffff"
                    radius: 50 * pin.width / 278
                    border.color: "#84f5a2"
                    border.width: 20
                    anchors.fill: parent
                    anchors.leftMargin: parent.width * 0.05
                    anchors.rightMargin: parent.width * 0.05
                    anchors.topMargin: parent.height * 0.1
                    anchors.bottomMargin: parent.height * 0.025

                    Rectangle {
                        id: column1

                        opacity: 1
                        color: "#00000000"
                        anchors.fill: parent
                        anchors.leftMargin: 20
                        anchors.rightMargin: 20
                        anchors.topMargin: 30
                        anchors.bottomMargin: 30

                        Rectangle {
                            id: batt_20
                            height: (column1.height) * 0.2
                            color: "#00ff18"
                            border.color: "#c18df984"
                            radius: 20 * column1.width / 206
                            border.width: 10 * column1.width / 206
                            anchors.left: parent.left
                            anchors.right: parent.right
                            anchors.top: batt_40.bottom
                            anchors.leftMargin: 10
                            anchors.rightMargin: 10
                            anchors.topMargin: 0
                            visible: true
                        }

                        Rectangle {
                            id: batt_40
                            height: (column1.height) * 0.2
                            color: "#00ff18"
                            border.color: "#c18df984"
                            radius: 20 * column1.width / 206
                            border.width: 10 * column1.width / 206
                            anchors.left: parent.left
                            anchors.right: parent.right
                            anchors.top: batt_60.bottom
                            anchors.leftMargin: 10
                            anchors.rightMargin: 10
                            anchors.topMargin: 0
                            visible: true
                        }

                        Rectangle {
                            id: batt_60
                            height: (column1.height) * 0.2
                            color: "#00ff18"
                            border.color: "#c18df984"
                            radius: 20 * column1.width / 206
                            border.width: 10 * column1.width / 206
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.left: parent.left
                            anchors.right: parent.right
                            anchors.leftMargin: 10
                            anchors.rightMargin: 10
                            visible: true
                        }

                        Rectangle {
                            id: batt_80
                            height: (column1.height) * 0.2
                            color: "#00ff18"
                            border.color: "#c18df984"
                            radius: 20 * column1.width / 206
                            border.width: 10 * column1.width / 206
                            anchors.left: parent.left
                            anchors.right: parent.right
                            anchors.bottom: batt_60.top
                            anchors.leftMargin: 10
                            anchors.rightMargin: 10
                            anchors.bottomMargin: 0
                            visible: true
                        }

                        Rectangle {
                            id: batt_100
                            height: (column1.height) * 0.2
                            color: "#00ff18"
                            radius: 20 * column1.width / 206
                            border.color: "#c18df984"
                            border.width: 10 * column1.width / 206
                            anchors.left: parent.left
                            anchors.right: parent.right
                            anchors.bottom: batt_80.top
                            anchors.leftMargin: 10
                            anchors.rightMargin: 10
                            anchors.bottomMargin: 0
                            visible: true
                        }
                    }
                }

                Image {
                    id: charge_icon
                    anchors.fill: parent
                    source: "qrc:/content/asset/charge (1).svg"
                    rotation: -90
                    fillMode: Image.PreserveAspectFit
                    visible: true
                }
            }
        }
    }
}

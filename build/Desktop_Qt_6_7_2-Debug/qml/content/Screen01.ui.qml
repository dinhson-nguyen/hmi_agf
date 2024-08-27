

/*
This is a UI file (.ui.qml) that is intended to be edited in Qt Design Studio only.
It is supposed to be strictly declarative and only uses a subset of QML. If you edit
this file manually, you might introduce QML code that is not supported by Qt Design Studio.
Check out https://doc.qt.io/qtcreator/creator-quick-ui-forms.html for details on .ui.qml files.
*/
import QtQuick 6.2
import QtQuick.Controls 6.2
import QtQuick.Layouts 6.2

import backendqt 1.0

Page {
    id: page1
    visible: true
    // width: 1720
    // height: 980
    // color: "#FAFAFA"
    property double batteryPercentage: 0
    property double batteryVoltage: 0
    property double batteryCurrent: 0
    property int popup_mode: 0
    property string control_mode: "RUNNING"
    property string mode_mode: "MANUAL"
    property string status_mode: "INITIATING"
    property string state_mute: "qrc:/content/asset/sound.svg"
    property double vel_linear: 0
    property double vel_angular: 0
    property int volume_current: 80
    property int volume_: 80
    property string ip_agf: ""
    property string ready_icon_source: "qrc:/content/asset/svg.svg"
    property string color_state: ""

    Popup {
        id: popup
        x: page1.width * 0.15
        y: page1.height * 0.1
        width: page1.width * 0.7
        height: page1.height * 0.8
        visible: false
        font.italic: true
        font.pointSize: 50
        font.family: "Ubuntu"
        modal: true
        focus: true
        closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutside

        background: Rectangle {
            color: "#F0F8FF"
            radius: 20
            border.color: "#F0F8FF"
            border.width: 1
        }
        enter: Transition {
            ParallelAnimation {
                NumberAnimation {
                    properties: "opacity"
                    from: 0
                    to: 1
                    duration: 64
                }
                NumberAnimation {
                    properties: "scale"
                    from: 0.75
                    to: 1
                    duration: 64
                }
            }
        }
        exit: Transition {
            ParallelAnimation {
                NumberAnimation {
                    properties: "opacity"
                    from: 1
                    to: 0
                    duration: 64
                }
                NumberAnimation {
                    properties: "scale"
                    from: 1
                    to: 0.75
                    duration: 64
                }
            }
        }
        Text {
            id: status_popup
            text: qsTr("Loading...")
            height: popup.height * 0.6
            anchors.top: header_popup.bottom
            anchors.left: popup.left
            anchors.right: popup.right
            anchors.rightMargin: 50
            anchors.leftMargin: 50
            anchors.topMargin: 10
            font.pixelSize: 45 * popup.width / 884
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.italic: true
        }
        Text {
            id: header_popup
            text: qsTr("Message")
            height: popup.height * 0.2
            anchors.top: popup.top
            anchors.left: popup.left
            anchors.right: popup.right
            anchors.rightMargin: 20
            font.pixelSize: 45 * popup.width / 884
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.italic: true
        }
        Button {
            id: confirm_button_popup
            text: qsTr("Confirm")
            width: popup.width * 0.25
            anchors.top: status_popup.bottom
            anchors.bottom: parent.bottom
            anchors.right: close_button_popup.left
            anchors.rightMargin: 25
            anchors.leftMargin: 25
            anchors.topMargin: 0
            anchors.bottomMargin: 10

            font.pixelSize: 40 * popup.width / 884
            background: Rectangle {
                color: "white"
                radius: 15
                border.color: "blue"
                border.width: 2
            }
        }
        Button {
            id: close_button_popup
            text: qsTr("Close")
            width: popup.width * 0.25
            anchors.top: status_popup.bottom
            anchors.bottom: parent.bottom
            anchors.right: parent.right
            anchors.rightMargin: 25
            anchors.leftMargin: 25
            anchors.topMargin: 0
            anchors.bottomMargin: 10

            font.pixelSize: 40 * popup.width / 884
            background: Rectangle {
                color: "white"
                radius: 15
                border.color: "red"
                border.width: 2
            }
        }
    }
    Page {
        id: left_panel
        width: parent.width * 0.22
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
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
        Button {
            id: view_button
            height: left_panel.height * 0.12
            text: "Xem"
            width: left_panel.width / 2
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            anchors.rightMargin: 0
            anchors.bottomMargin: 0
            font.pointSize: 40 * view_button.height / 118
            font.family: "ubuntu"
            font.bold: true
            display: AbstractButton.TextOnly
            background: Rectangle {
                color: "#F5F5F5"
                radius: 10
                border.color: "#FFFFFF"
                border.width: 5
            }
        }
        Button {
            id: edit_button
            height: left_panel.height * 0.12
            text: "Sửa"
            width: left_panel.width / 2
            anchors.right: view_button.left
            anchors.bottom: parent.bottom
            anchors.rightMargin: 0
            anchors.bottomMargin: 0
            font.pointSize: 40 * view_button.height / 118
            font.family: "ubuntu"
            font.bold: true
            display: AbstractButton.TextOnly

            background: Rectangle {
                color: "#F5F5F5"
                radius: 10
                border.color: "#FFFFFF"
                border.width: 5
            }
            // onClicked: {
            //     animation_goout.start();
            //     animation_forward.start();
            // }
        }
        ColumnLayout {
            id: batt_info
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: mode_button.bottom
            anchors.bottom: view_button.top
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
    Page {
        id: right_panel
        width: parent.width * 0.78
        anchors.left: parent.left
        // anchors.right: left_panel.left
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.leftMargin: 0
        anchors.rightMargin: 0
        anchors.topMargin: 0
        anchors.bottomMargin: 0

        Page {
            id: up_panel
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            height: (left_panel.height) * 0.6
            anchors.leftMargin: 0
            anchors.rightMargin: 0
            anchors.topMargin: 0
            anchors.bottomMargin: 0
            Button {
                id: header
                height: page1.height * 0.1
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.leftMargin: 5
                anchors.rightMargin: 5
                anchors.topMargin: 10
                background: Rectangle {

                    color: "#90CAF9"
                    radius: 25 * header.height / 94
                }

                Text {
                    id: status_header
                    text: qsTr("Initializing")
                    anchors.fill: parent
                    font.pixelSize: 45
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.italic: true
                }
            }
            ColumnLayout {
                id: none
                width: 75 * parent.width / 1290
                anchors.left: parent.left
                anchors.top: header.bottom
                anchors.bottom: parent.bottom
                anchors.leftMargin: 15
                anchors.topMargin: 100
                anchors.bottomMargin: 100
                Text {
                    text: qsTr("Hàng") + '\n' + qsTr("chờ")
                    anchors.fill: parent
                    font.pixelSize: 40 * parent.width / 78
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.italic: false
                }
            }
            GridLayout {
                id: waiting
                width: (waiting.height) * 2.5
                anchors.left: none.right
                // anchors.right: parent.right
                anchors.top: header.bottom
                anchors.bottom: parent.bottom
                anchors.leftMargin: 20
                // anchors.rightMargin: 230
                anchors.topMargin: 60 * parent.height / 441
                anchors.bottomMargin: 60 * parent.height / 441
                rows: 2
                columns: 5
                implicitHeight: (waiting.height - 50) / 2
                implicitWidth: (waiting.height - 50) / 2
                columnSpacing: 10
                rowSpacing: 10
                Button {

                    text: qsTr("1")
                    Layout.row: 0
                    Layout.column: 0
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    font.bold: true
                    font.pointSize: 40

                    background: Rectangle {
                        objectName: "zone_1"
                        color : "#607D8B"
                    }
                }

                Button {
                    
                    text: qsTr("2")
                    Layout.row: 0
                    Layout.column: 1
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    font.bold: true
                    font.pointSize: 40

                    background: Rectangle {
                        objectName: "zone_2"
                        color : "#607D8B"
                    }
                }
                Button {
                    
                    text: qsTr("3")
                    Layout.row: 0
                    Layout.column: 2
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    font.bold: true
                    font.pointSize: 40

                    background: Rectangle {
                        objectName: "zone_3"
                        color : "#607D8B"
                    }
                }
                Button {
                    
                    text: qsTr("4")
                    Layout.row: 0
                    Layout.column: 3
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    font.bold: true
                    font.pointSize: 40

                    background: Rectangle {
                        objectName: "zone_4"
                        color : "#607D8B"
                    }
                }

                Button {
                    
                    text: qsTr("5")
                    Layout.row: 0
                    Layout.column: 4
                    Layout.preferredWidth: waiting.height / 2 - 5
                    Layout.fillHeight: true
                    font.bold: true
                    font.pointSize: 40

                    background: Rectangle {
                        objectName: "zone_5"
                        color : "#607D8B"
                    }
                }

                Button {
                    
                    text: qsTr("6")
                    Layout.row: 1
                    Layout.column: 0
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    font.bold: true
                    font.pointSize: 40

                    background: Rectangle {
                        objectName: "zone_6"
                        color : "#607D8B"
                    }
                }
                Button {
                    
                    text: qsTr("7")
                    Layout.row: 1
                    Layout.column: 1
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    font.bold: true
                    font.pointSize: 40

                    background: Rectangle {
                        objectName: "zone_7"
                        color : "#607D8B"
                    }
                }

                Button {
                    
                    text: qsTr("8")
                    Layout.row: 1
                    Layout.column: 2
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    font.bold: true
                    font.pointSize: 40

                    background: Rectangle {
                        objectName: "zone_8"
                        color : "#607D8B"
                    }
                }
                Button {
                    
                    text: qsTr("9")
                    Layout.row: 1
                    Layout.column: 3
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    font.bold: true
                    font.pointSize: 40

                    background: Rectangle {
                        objectName: "zone_9"
                        color : "#607D8B"
                    }
                }
                Button {
                    
                    text: qsTr("10")
                    Layout.row: 1
                    Layout.column: 4
                    Layout.preferredWidth: waiting.height / 2 - 5
                    Layout.fillHeight: true
                    font.bold: true
                    font.pointSize: 40

                    background: Rectangle {
                        objectName: "zone_10"
                        color : "#607D8B"
                    }
                }
            }
            GridLayout {
                id: note

                height: 220
                anchors.right: parent.right
                anchors.left: waiting.right
                anchors.top: header.bottom
                // anchors.bottom: waiting.bottom
                anchors.leftMargin: 90
                anchors.topMargin: 50
                // anchors.bottomMargin: 0
                ColumnLayout {
                    id: layout_note_1
                    width: 50
                    anchors.left: parent.left
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    anchors.leftMargin: 0
                    anchors.topMargin: 0
                    anchors.bottomMargin: 0
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                    spacing: 5
                    Rectangle {
                        color: "#CFD8DC"
                        Layout.preferredWidth: 50
                        Layout.fillHeight: true
                    }
                    Rectangle {
                        color: "#FFEB3B"
                        Layout.preferredWidth: 50
                        Layout.fillHeight: true
                    }
                    Rectangle {
                        color: "#FF9800"
                        Layout.preferredWidth: 50
                        Layout.fillHeight: true
                    }
                    Rectangle {
                        color: "#4CAF50"
                        Layout.preferredWidth: 50
                        Layout.fillHeight: true
                    }
                }
                ColumnLayout {

                    id: layout_note_2
                    anchors.left: layout_note_1.right
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    anchors.leftMargin: 0
                    anchors.topMargin: 0
                    anchors.bottomMargin: 0
                    spacing: 5
                    Text {
                        height: 50
                        text: "Trống"
                        font.pixelSize: 35 * up_panel.height / 588
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        Layout.fillHeight: true
                        Layout.fillWidth: true
                    }

                    Text {

                        height: 50
                        text: "Pallet thấp"
                        font.pixelSize: 35 * up_panel.height / 588
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        Layout.fillHeight: true
                        Layout.fillWidth: true
                    }

                    Text {

                        height: 50
                        text: "Pallet cao"
                        font.pixelSize: 35 * up_panel.height / 588
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        Layout.fillHeight: true
                        Layout.fillWidth: true
                    }

                    Text {

                        height: 50
                        text: "Pallet kép"
                        font.pixelSize: 35 * up_panel.height / 588
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        Layout.fillHeight: true
                        Layout.fillWidth: true
                    }
                }
            }
        }
        Page {
            id: down_panel
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: up_panel.bottom
            anchors.bottom: parent.bottom
            anchors.leftMargin: 0
            anchors.rightMargin: 0
            anchors.topMargin: 0
            anchors.bottomMargin: 0

            ColumnLayout {
                id: may_cuon_phim
                width: 120
                Rectangle {
                    anchors.fill: parent
                    color: "#81D4FA"
                }
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                anchors.leftMargin: 15
                anchors.topMargin: 100 * down_panel.height / 431
                anchors.bottomMargin: 100 * down_panel.height / 431
                Text {
                    text: qsTr("Máy") + '\n' + qsTr(
                              "cuốn") + '\n' + qsTr("phim")
                    anchors.fill: parent
                    font.pixelSize: 40 * parent.width / 125
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.italic: false
                }
            }
            Rectangle {
                anchors.fill: parent
                anchors.leftMargin: 25 + may_cuon_phim.width
                anchors.rightMargin: 15

                anchors.topMargin: 100 * down_panel.height / 445
                anchors.bottomMargin: 100 * down_panel.height / 445
                color: "#90A4AE"
            }
            RowLayout {
                id: bang_tai

                anchors.left: may_cuon_phim.right
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                anchors.leftMargin: 15
                anchors.rightMargin: 15
                anchors.topMargin: 100 * down_panel.height / 445
                anchors.bottomMargin: 100 * down_panel.height / 445

                Button {
                    id: palet_1
                    width: palet_1.height
                    text: qsTr("1")
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    anchors.rightMargin: 20
                    anchors.topMargin: 15 + 35 * may_cuon_phim.height / 250
                    anchors.bottomMargin: 15 + 35 * may_cuon_phim.height / 250
                    font.bold: true
                    font.pointSize: 40

                    background: Rectangle {
                        id: animation_palet_1
                        objectName: "zone_1_queue"
                        color: "#607D8B"
                    }
                    // onClicked: {
                    //     animation_goout.start();
                    //     animation_forward.start();
                    // }
                    Rectangle {
                        id: animation_palet_2
                        x: 0
                        y: 00
                        width: parent.width
                        height: parent.height
                        color: "#00000000"
                    }
                    SequentialAnimation {
                        id: animation_goout
                        running: false

                        ColorAnimation {
                            target: animation_palet_2
                            property: "color"
                            to: animation_palet_1.color
                            duration: 000
                        }

                        ParallelAnimation {
                            PropertyAnimation {
                                target: animation_palet_2
                                property: "y"
                                to: animation_palet_2.y - 200
                                duration: 1000
                            }
                            OpacityAnimator {
                                target: animation_palet_2
                                to: 0
                                duration: 1000
                            }
                        }

                        PropertyAnimation {
                            target: animation_palet_2
                            property: "y"
                            to: animation_palet_2.y
                            duration: 000
                        }
                        OpacityAnimator {
                            target: animation_palet_2
                            to: 1000
                            duration: 000
                        }
                    }
                }
                Button {
                    id: palet_2
                    width: palet_2.height
                    text: qsTr("2")
                    anchors.right: palet_1.left
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    anchors.rightMargin: 50 * parent.height / 216
                    anchors.topMargin: 15 + 35 * may_cuon_phim.height / 250
                    anchors.bottomMargin: 15 + 35 * may_cuon_phim.height / 250
                    font.bold: true
                    font.pointSize: 40

                    background: Rectangle {
                        id: animation_palet_3
                        objectName: "zone_2_queue"
                        color: "#607D8B"
                    }
                    Rectangle {
                        id: animation_palet_4
                        x: 0
                        y: 00
                        width: parent.width
                        height: parent.height
                        color: "#00000000"
                    }
                    SequentialAnimation {
                        id: animation_forward
                        running: false

                        ColorAnimation {
                            target: animation_palet_4
                            property: "color"
                            to: animation_palet_3.color
                            duration: 000
                        }

                        ParallelAnimation {
                            PropertyAnimation {
                                target: animation_palet_4
                                property: "x"
                                to: animation_palet_4.x + 100
                                duration: 1000
                            }
                            OpacityAnimator {
                                target: animation_palet_4
                                to: 0
                                duration: 1000
                            }
                        }

                        PropertyAnimation {
                            target: animation_palet_4
                            property: "x"
                            to: animation_palet_4.x
                            duration: 000
                        }
                        OpacityAnimator {
                            target: animation_palet_4
                            to: 1000
                            duration: 000
                        }
                    }
                }
                Button {
                    id: palet_3
                    width: palet_3.height
                    text: qsTr("3")
                    anchors.right: palet_2.left
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    anchors.rightMargin: 10
                    anchors.topMargin: 15 + 35 * may_cuon_phim.height / 250
                    anchors.bottomMargin: 15 + 35 * may_cuon_phim.height / 250
                    font.bold: true
                    font.pointSize: 40

                    background: Rectangle {
                        objectName: "zone_3_queue"
                        color: "#607D8B"
                    }
                }
                Button {
                    id: palet_4
                    width: palet_4.height
                    text: qsTr("4")
                    anchors.right: palet_3.left
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    anchors.rightMargin: 10
                    anchors.topMargin: 15 + 35 * may_cuon_phim.height / 250
                    anchors.bottomMargin: 15 + 35 * may_cuon_phim.height / 250
                    font.bold: true
                    font.pointSize: 40

                    background: Rectangle {
                        objectName: "zone_4_queue"
                        color: "#607D8B"
                    }
                }
                Button {
                    id: palet_5
                    width: palet_5.height
                    text: qsTr("5")
                    anchors.right: palet_4.left
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    anchors.rightMargin: 10
                    anchors.topMargin: 15 + 35 * may_cuon_phim.height / 250
                    anchors.bottomMargin: 15 + 35 * may_cuon_phim.height / 250
                    font.bold: true
                    font.pointSize: 40

                    background: Rectangle {
                        objectName: "zone_5_queue"
                        color: "#607D8B"
                    }
                }
                Button {
                    id: palet_6
                    width: palet_6.height
                    text: qsTr("6")
                    anchors.right: palet_5.left
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    anchors.rightMargin: 10
                    anchors.topMargin: 15 + 35 * may_cuon_phim.height / 250
                    anchors.bottomMargin: 15 + 35 * may_cuon_phim.height / 250
                    font.bold: true
                    font.pointSize: 40

                    background: Rectangle {
                        objectName: "zone_6_queue"
                        color: "#607D8B"
                    }
                }
                Button {
                    id: palet_7
                    width: palet_7.height
                    text: qsTr("7")
                    anchors.right: palet_6.left
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    anchors.rightMargin: 10
                    anchors.topMargin: 15 + 35 * may_cuon_phim.height / 250
                    anchors.bottomMargin: 15 + 35 * may_cuon_phim.height / 250
                    font.bold: true
                    font.pointSize: 40

                    background: Rectangle {
                        objectName: "zone_7_queue"
                        color: "#607D8B"
                    }
                }
                Button {
                    id: palet_8
                    width: palet_8.height
                    text: qsTr("8")
                    anchors.right: palet_7.left
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    anchors.rightMargin: 10
                    anchors.topMargin: 15 + 35 * may_cuon_phim.height / 250
                    anchors.bottomMargin: 15 + 35 * may_cuon_phim.height / 250
                    font.bold: true
                    font.pointSize: 40

                    background: Rectangle {
                        objectName: "zone_8_queue"
                        color: "#607D8B"
                    }
                }
            }

            Image {
                id: ready_icon
                x: bang_tai.x + bang_tai.width - palet_1.width / 2 - 20 - ready_icon.height / 2
                y: bang_tai.y - ready_icon.height - 10
                source: ready_icon_source
                rotation: -180
                fillMode: Image.PreserveAspectFit
                // visible: true
                height: (down_panel.height - bang_tai.height) * parent.height / 784
                width: ready_icon.height
            }
        }
    }

    Connections {
        target: backend
        onBatteryPercentageChanged: {
            batteryPercentage = backend.batteryPercentage
        }
        onBatteryVoltageChanged: {
            batteryVoltage = backend.batteryVoltage
        }
        onBatteryCurrentChanged: {
            batteryCurrent = backend.batteryCurrent
        }
        onRobotDetailChanged: {
            if (status_mode === "ERROR") {
                status_header.text = backend.robotError
            } else {
                status_header.text = backend.robotDetail
            }
        }
        onRobotModeChanged: {
            mode_mode = backend.robotMode
            if (mode_mode === "MANUAL") {
                mode_button.background.color = "#03A9F4"
            } else if (mode_mode === "AUTO") {
                mode_button.background.color = "#4CAF50"
            } else
                mode_button.background.color = "#FF9800"
        }
        onRobotStatusChanged: {
            status_mode = backend.robotStatus

            if ((status_mode === "ERROR") || (status_mode === "EMG")) {
                status_button.background.color = "#F44336"
            } else if (status_mode === "WAITING_INIT_POSE") {
                status_button.background.color = "#FFFFFF"
            } else if (status_mode === "NORMAL") {
                status_button.background.color = "#4CAF50"
            } else if (status_mode === "WAITING") {
                status_button.background.color = "#FFEB3B"
            } else
                status_button.background.color = "#FF9800"
        }
        onGetControlChanged: {
            control_mode = backend.getControl
            if (mode_mode === "AUTO" && control_mode === "RUNNING") {
                if (status_mode === "WAITING") {
                    control_button.background.color = "#2196F3"
                } else {
                    control_button.background.color = "#4CAF50"
                }
            } else if (mode_mode === "MANUAL" && control_mode === "RUNNING") {
                control_button.background.color = "#2196F3"
            } else if (control_mode === "PAUSE") {
                control_button.background.color = "#FFEB3B"
            } else
                control_button.background.color = "#FFEB3B"
        }
    }
}

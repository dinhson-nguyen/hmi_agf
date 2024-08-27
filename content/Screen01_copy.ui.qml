

/*
This is a UI file (.qml) that is intended to be edited in Qt Design Studio only.
It is supposed to be strictly declarative and only uses a subset of QML. If you edit
this file manually, you might introduce QML code that is not supported by Qt Design Studio.
Check out https://doc.qt.io/qtcreator/creator-quick-ui-forms.html for details on .qml files.
*/
import QtQuick 6.2
import QtQuick.Controls 6.2
import QtQuick.Layouts 6.2

// import backendqt 1.0
Page {
    id: page1
    visible: true
    width: 1720
    height: 980
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
    property bool state_panel_edit: false
    property bool state_panel_queue: false

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
    StackView {
        id: stack_view_status
        width: parent.width * 0.45
        anchors.bottom: left_down_panel.top
        anchors.right: parent.right
        anchors.top: up_panel.top
        anchors.rightMargin: 0
        anchors.topMargin: 0
        initialItem: status_agf
    }

    Page {
        id: left_down_panel
        width: parent.width * 0.22
        height: parent.height * 0.12
        anchors.right: parent.right
        // anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.rightMargin: 0
        anchors.topMargin: 0
        anchors.bottomMargin: 0
        Button {
            id: view_button
            // height: parent.height * 0.12
            text: "Xem"
            width: parent.width / 3
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.rightMargin: 0
            anchors.bottomMargin: 0
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

    Page {
        id: up_panel
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: down_panel.bottom
        anchors.bottom: parent.bottom

        RowLayout {
            id: waiting
            height: waiting.width / 6
            width: parent.width * 0.45
            visible: true
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.leftMargin: 20
            anchors.topMargin: 25
            anchors.bottomMargin: 380
            // anchors.rightMargin: 230
            spacing: 10

            Rectangle {
                id: none
                anchors.fill: parent
                Text {
                    text: qsTr("Hàng ") + qsTr("chờ")
                    anchors.bottom: parent.top
                    anchors.left: parent.left
                    font.pixelSize: 40
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.italic: false
                }
            }
            Button {

                text: qsTr("1")

                Layout.fillWidth: true
                Layout.fillHeight: true
                font.bold: true
                font.pointSize: 40

                background: Rectangle {
                    objectName: "zone_1"
                    color: "#CFD8DC"
                }

            }

            Button {

                text: qsTr("2")
                Layout.fillWidth: true
                Layout.fillHeight: true
                font.bold: true
                font.pointSize: 40

                background: Rectangle {
                    objectName: "zone_2"
                    color: "#CFD8DC"
                }
            }
            Button {

                text: qsTr("3")

                Layout.fillWidth: true
                Layout.fillHeight: true
                font.bold: true
                font.pointSize: 40

                background: Rectangle {
                    objectName: "zone_3"
                    color: "#CFD8DC"
                }
            }
            Button {

                text: qsTr("4")

                Layout.fillWidth: true
                Layout.fillHeight: true
                font.bold: true
                font.pointSize: 40

                background: Rectangle {
                    objectName: "zone_4"
                    color: "#CFD8DC"
                }
            }

            Button {

                text: qsTr("5")

                Layout.fillWidth: true
                Layout.fillHeight: true
                font.bold: true
                font.pointSize: 40

                background: Rectangle {
                    objectName: "zone_5"
                    color: "#CFD8DC"
                }
            }

            Button {

                text: qsTr("6")

                Layout.fillWidth: true
                Layout.fillHeight: true
                font.bold: true
                font.pointSize: 40

                background: Rectangle {
                    objectName: "zone_6"
                    color: "#CFD8DC"
                }
            }
        }
        GridLayout {
            id: note

            width: parent.width * 0.15
            // anchors.right: parent.right
            anchors.left: parent.left
            anchors.bottom: parent.bottom
            // anchors.bottom: waiting.bottom
            anchors.leftMargin: 20
            anchors.bottomMargin: 20
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
        Component {
            id: status_agf
            Page {
                id: left_panel
                width: parent.width * 0.5
                // height: parent.height * 0.88
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
            }
        }
    }
    Page {
        id: down_panel
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        height: (parent.height) * 0.45
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
            id: may_cuon_phim
            width: 120
            Rectangle {
                anchors.fill: parent
                color: "#81D4FA"
            }
            anchors.left: parent.left
            anchors.top: header.bottom
            anchors.bottom: parent.bottom
            anchors.leftMargin: 15
            anchors.rightMargin: 15
            anchors.topMargin: 50 * down_panel.height / 445
            anchors.bottomMargin: 50 * down_panel.height / 445
            Text {
                text: qsTr("Máy") + '\n' + qsTr("cuốn") + '\n' + qsTr("phim")
                anchors.fill: parent
                font.pixelSize: 40 * parent.width / 125
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font.italic: false
            }
        }
        // Rectangle {
        //     anchors.fill: parent
        //     anchors.leftMargin: 25 + may_cuon_phim.width
        //     anchors.rightMargin: 15

        //     anchors.topMargin: 100 * down_panel.height / 445
        //     anchors.bottomMargin: 100 * down_panel.height / 445
        //     color: "#90A4AE"
        // }
        RowLayout {
            id: bang_tai

            anchors.left: may_cuon_phim.right
            anchors.right: parent.right
            anchors.top: header.bottom
            anchors.bottom: parent.bottom
            anchors.leftMargin: 15
            anchors.rightMargin: 15
            anchors.topMargin: 75 * down_panel.height / 445
            anchors.bottomMargin: 75 * down_panel.height / 445
            layoutDirection: Qt.RightToLeft

            Rectangle {
                anchors.fill: parent
                Layout.fillHeight: true
                Layout.fillWidth: false
                color: "#90A4AE"
            }

            Button {
                id: palet_1
                width: palet_1.height
                text: qsTr("1")
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                anchors.rightMargin: 20
                anchors.topMargin: 15 + 22 * parent.height / 150
                anchors.bottomMargin: 15 + 22 * parent.height / 150
                font.bold: true
                font.pointSize: 40

                background: Rectangle {
                    id: animation_palet_1
                    objectName: "zone_1_queue"
                    color: "#CFD8DC"
                }

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
                anchors.topMargin: 15 + 22 * parent.height / 150
                anchors.bottomMargin: 15 + 22 * parent.height / 150
                font.bold: true
                font.pointSize: 40

                background: Rectangle {
                    id: animation_palet_3
                    objectName: "zone_2_queue"
                    color: "#CFD8DC"
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
                anchors.topMargin: 15 + 22 * parent.height / 150
                anchors.bottomMargin: 15 + 22 * parent.height / 150
                font.bold: true
                font.pointSize: 40

                background: Rectangle {
                    objectName: "zone_3_queue"
                    color: "#CFD8DC"
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
                anchors.topMargin: 15 + 22 * parent.height / 150
                anchors.bottomMargin: 15 + 22 * parent.height / 150
                font.bold: true
                font.pointSize: 40

                background: Rectangle {
                    objectName: "zone_4_queue"
                    color: "#CFD8DC"
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
                anchors.topMargin: 15 + 22 * parent.height / 150
                anchors.bottomMargin: 15 + 22 * parent.height / 150
                font.bold: true
                font.pointSize: 40

                background: Rectangle {
                    objectName: "zone_5_queue"
                    color: "#CFD8DC"
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
                anchors.topMargin: 15 + 22 * parent.height / 150
                anchors.bottomMargin: 15 + 22 * parent.height / 150
                font.bold: true
                font.pointSize: 40

                background: Rectangle {
                    objectName: "zone_6_queue"
                    color: "#CFD8DC"
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
                anchors.topMargin: 15 + 22 * parent.height / 150
                anchors.bottomMargin: 15 + 22 * parent.height / 150
                font.bold: true
                font.pointSize: 40

                background: Rectangle {
                    objectName: "zone_7_queue"
                    color: "#CFD8DC"
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
                anchors.topMargin: 15 + 22 * parent.height / 150
                anchors.bottomMargin: 15 + 22 * parent.height / 150
                font.bold: true
                font.pointSize: 40

                background: Rectangle {
                    objectName: "zone_8_queue"
                    color: "#CFD8DC"
                }
            }
            Button {
                id: palet_9
                width: palet_9.height
                text: qsTr("9")
                anchors.right: palet_8.left
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                anchors.rightMargin: 10
                anchors.topMargin: 15 + 22 * parent.height / 150
                anchors.bottomMargin: 15 + 22 * parent.height / 150
                font.bold: true
                font.pointSize: 40

                background: Rectangle {
                    objectName: "zone_9_queue"
                    color: "#CFD8DC"
                }
            }

            Button {
                id: palet_10
                width: palet_10.height
                text: qsTr("10")
                anchors.right: palet_9.left
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                anchors.rightMargin: 10
                anchors.topMargin: 15 + 22 * parent.height / 150
                anchors.bottomMargin: 15 + 22 * parent.height / 150
                font.bold: true
                font.pointSize: 40

                background: Rectangle {
                    objectName: "zone_10_queue"
                    color: "#CFD8DC"
                }
            }

            Button {
                id: palet_11
                width: palet_11.height
                text: qsTr("11")
                anchors.right: palet_10.left
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                anchors.rightMargin: 10
                anchors.topMargin: 15 + 22 * parent.height / 150
                anchors.bottomMargin: 15 + 22 * parent.height / 150
                font.bold: true
                font.pointSize: 40

                background: Rectangle {
                    objectName: "zone_11_queue"
                    color: "#CFD8DC"
                }
            }

            Button {
                id: palet_12
                width: palet_12.height
                text: qsTr("12")
                anchors.right: palet_11.left
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                anchors.rightMargin: 10
                anchors.topMargin: 15 + 22 * parent.height / 150
                anchors.bottomMargin: 15 + 22 * parent.height / 150
                font.bold: true
                font.pointSize: 40

                background: Rectangle {
                    objectName: "zone_12_queue"
                    color: "#CFD8DC"
                }
            }

            Button {
                id: palet_13
                width: palet_13.height
                text: qsTr("13")
                anchors.right: palet_12.left
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                anchors.rightMargin: 10
                anchors.topMargin: 15 + 22 * parent.height / 150
                anchors.bottomMargin: 15 + 22 * parent.height / 150
                font.bold: true
                font.pointSize: 40

                background: Rectangle {
                    objectName: "zone_13_queue"
                    color: "#CFD8DC"
                }
            }
            Button {
                id: palet_14
                width: palet_14.height
                text: qsTr("14")
                anchors.right: palet_13.left
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                anchors.rightMargin: 10
                anchors.topMargin: 15 + 22 * parent.height / 150
                anchors.bottomMargin: 15 + 22 * parent.height / 150
                font.bold: true
                font.pointSize: 40

                background: Rectangle {
                    objectName: "zone_14_queue"
                    color: "#CFD8DC"
                }
            }

            Image {
                id: ready_icon
                x: palet_1.x
                y: palet_1.y - palet_1.width * 1.5
                source: ready_icon_source
                rotation: -180
                fillMode: Image.PreserveAspectFit
                // visible: true
                height: palet_1.height
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

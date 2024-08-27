

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
        onClicked: {
                    if (control_mode === "RUNNING") {
                        backend.requestControl("STOP")
                    } else if (control_mode === "PAUSED") {
                        backend.requestControl("RUN")
                    }
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
        onClicked: {
                    popup_mode = 0
                    if (status_mode === "ERROR") {
                        status_popup.text = backend.robotError
                    } else
                        status_popup.text = backend.robotDetail

                    popup.open()
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
        onClicked: {
                    popup_mode = 1
                    if (mode_mode === "MANUAL") {
                        // mode_mode ="AUTO"
                        status_popup.text = qsTr("Change robot mode to AUTO")
                        mode_button.background.color = "#4CAF50"
                    } else if (mode_mode === "AUTO") {
                        // mode_mode =  "MANUAL"
                        status_popup.text = qsTr("Change robot mode to MANUAL")
                        mode_button.background.color = "#03A9F4"
                    } else
                        status_popup.text = qsTr("Data false")
                    popup.open()
                    
                }
    }

    
}

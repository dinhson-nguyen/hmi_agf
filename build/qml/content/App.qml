// Copyright (C) 2021 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only

import QtQuick 6.2
// import hmi_agf
import QtQuick.Controls 6.2
import QtQuick.Layouts 6.2

// import backendqt 1.0


Window {
    //width: 1920
    //height: 1080
    id: window
    visible: true
    flags: Qt.FramelessWindowHint  
    visibility: Window.FullScreen
    title: "HMI_appication"


    StackView {
          id: stackView
        

        anchors.left: toolBar.right
        anchors.right: parent.right
        anchors.top: control_panel.bottom
        anchors.bottom: parent.bottom
        anchors.leftMargin: 0
        anchors.topMargin: 0
        anchors.verticalCenter: window.verticalCenter
        Loader
        {
            id: loader
            anchors.fill: parent
            onLoaded: {
                fadeIn.start(); // Start fade-in animation after content is loaded
                
            }

            // Property to control the opacity for animation
            opacity: 0

        }


        initialItem: loader.setSource("qrc:/content/Screen01.qml")
        
    }
    PropertyAnimation {
        id: fadeIn
        target: loader
        property: "opacity"
        to: 1
        duration: 500
    }



    ToolBar {
        id: toolBar

        width: window.width * 0.1
        height: window.height
        anchors {
            horizontalCenter: window.horizontalCenter
            bottom: window.bottom
            bottomMargin: 20
        }
        background: Rectangle {
                    color: "#FFFFFF" 
                }




        Button {
            id: dashboard_button
            height: (toolBar.height -120) * 0.2
            palette.buttonText: "#448AFF"
            font.bold: true
            font.family: "ubuntu"
            icon.height: 60 * dashboard_button.width / 170
            icon.width: 60 * dashboard_button.width / 170
            icon.color: "#448AFF"
            icon.source: "qrc:/content/asset/Vector 48 (Stroke).svg"
            display: AbstractButton.IconOnly
            font.pointSize: 25 * dashboard_button.height / 276

            text: qsTr("DASHBOARD")
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.topMargin: 20
            anchors.leftMargin: 5
            anchors.rightMargin: 5
            background: Rectangle {
                color: "#F5F5F5"
                radius: 25
                border.color: "#3D5AFE"
                border.width: 5
            }
            onClicked: {
                loader.setSource("qrc:/content/Screen01.qml");
                Qt.callLater(function() {
                    backend.initColor();
                });
            }
            
            onPressedChanged: {
                if (pressed) {
                    background.color = "#B0BEC5"; 
                    
                } else {
                    background.color = "#F5F5F5"; 
                    
                }
            }
        }

        Button {
            id: setup_button
            height: (toolBar.height -120) * 0.2
            palette.buttonText: "#448AFF"
            font.bold: true
            font.family: "ubuntu"
            icon.height: 60 * setup_button.width / 170
            icon.width: 60 * setup_button.width / 170
            icon.color: "#448AFF"
            icon.source: "qrc:/content/asset/setup.svg"
            display: AbstractButton.IconOnly
            font.pointSize: 25 * dashboard_button.height / 276
            text: qsTr("SETUP")
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: mission_button.bottom
            anchors.topMargin: 20
            anchors.leftMargin: 5
            anchors.rightMargin: 5
            background: Rectangle {
                color: "#F5F5F5"
                radius: 25
                border.color: "#3D5AFE"
                border.width: 5
            }
            onClicked: loader.setSource("qrc:/content/Screen02.qml")
            onPressedChanged: {
                if (pressed) {
                    background.color = "#B0BEC5"; 
                } else {
                    background.color = "#F5F5F5";
                }
            }
        }

        Button {
            id: monitoring_button
            height: (toolBar.height -120) * 0.2
            text: qsTr("MONITORING")
            palette.buttonText: "#448AFF"
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: setup_button.bottom
            anchors.leftMargin: 5
            anchors.rightMargin: 5
            anchors.topMargin: 20
            font.family: "ubuntu"
            font.bold: true
            icon.color: "#448AFF"
            icon.height: 60 * monitoring_button.width / 170
            icon.width: 60 * monitoring_button.width / 170
            icon.source: "qrc:/content/asset/tv.svg"
            display: AbstractButton.IconOnly
            font.pointSize: 25 * dashboard_button.height / 276

            background: Rectangle {
                color: "#F5F5F5"
                radius: 25
                border.color: "#3D5AFE"
                border.width: 5
            }
            onPressedChanged: {
                if (pressed) {
                    background.color = "#B0BEC5"; 
                } else {
                    background.color = "#F5F5F5"; 
                }
            }
            onClicked: loader.setSource("qrc:/content/Screen03.qml")
        }
        Button {
            id: mission_button
            height: (toolBar.height -120) * 0.2
            text: qsTr("MONITORING")
            palette.buttonText: "#448AFF"
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: dashboard_button.bottom
            anchors.leftMargin: 5
            anchors.rightMargin: 5
            anchors.topMargin: 20
            font.family: "ubuntu"
            font.bold: true
            icon.color: "#448AFF"
            icon.height: 60 * monitoring_button.width / 170
            icon.width: 60 * monitoring_button.width / 170
            icon.source: "qrc:/content/asset/dart-mission-goal-success-svgrepo-com.svg"
            display: AbstractButton.IconOnly
            font.pointSize: 25 * dashboard_button.height / 276

            background: Rectangle {
                color: "#F5F5F5"
                radius: 25
                border.color: "#3D5AFE"
                border.width: 5
            }
            onPressedChanged: {
                if (pressed) {
                    background.color = "#B0BEC5";
                } else {
                    background.color = "#F5F5F5";
                }
            }
            onClicked: loader.setSource("qrc:/content/Mission.qml")
        }
        Button {
            id: system_button
            text: qsTr("SYSTEM")
            palette.buttonText: "#448AFF"
            height: (toolBar.height -120) * 0.2
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            anchors.leftMargin: 5
            anchors.rightMargin: 5
            anchors.bottomMargin: 20
            font.family: "ubuntu"
            focusPolicy: Qt.NoFocus
            font.bold: true
            icon.height: 60 * system_button.width / 170
            icon.width: 60 * system_button.width / 170
            icon.source: "qrc:/content/asset/Setting.svg"
            icon.color: "#448AFF"
            display: AbstractButton.IconOnly
            font.pointSize: 25 * dashboard_button.height / 276
            background: Rectangle {
                color: "#F5F5F5"
                radius: 25
                border.color: "#3D5AFE"
                border.width: 5
            }
            onPressedChanged: {
                if (pressed) {
                    background.color = "#B0BEC5"; 
                } else {
                    background.color = "#F5F5F5"; 
                }
            }
            onClicked: loader.setSource(pageComponent)
        }
    }


    ToolBar {
        id: control_panel
        width: stackView.width
        // anchors.left: toolBar.right
        anchors.right: parent.right
        anchors.top: parent.top
        height: 25 + 75 * window.height / 1080
        anchors.leftMargin: 0
        anchors.rightMargin: 0
        anchors.topMargin: 0
        anchors.bottomMargin: 0
        background: Rectangle {
            color: "#BBDEFB"
            radius: 10 
        }
        RowLayout {
            anchors.left: parent.left
            anchors.right: minimal_button.left
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.rightMargin: 100
            spacing: 5
            Text {
                id: agv_name
                text:  qsTr("AGF Name: ")
                width: parent.width * 0.4
                Layout.fillHeight:  true
                Layout.preferredWidth:  parent.width * 0.4
                font.pixelSize: 40 * agv_name.height / 100
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignVCenter
                font.italic: true
            }
            Text {
                id: ip
                text:  qsTr("AGF IP: ")
                Layout.fillHeight:  true
                Layout.preferredWidth:  parent.width * 0.4
                font.pixelSize: 40 * agv_name.height / 100
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignVCenter
                font.italic: true
            }
        }

        MouseArea {
                    id: dragArea
                    anchors.fill: parent
                    drag.target: window
                    onPositionChanged: {
                        if (window.visibility !== Window.FullScreen)
                        {
                        window.x += dragArea.mouseX - dragArea.width / 2
                        window.y += dragArea.mouseY - dragArea.height / 2
                        }
                    }
        }

        Button {
                id: close_button
                width: close_button.height
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                anchors.rightMargin: 10
                anchors.topMargin: 10
                anchors.bottomMargin: 10
                rightPadding: 16
                leftPadding: 16
                spacing: 0
                icon.height: 50
                icon.width: 50
                display: AbstractButton.IconOnly
                icon.source: "qrc:/content/asset/close.svg"
                background: Rectangle {
                    color: "#ECEFF1"
                    radius: 10
                    border.color: "#78909C"
                    border.width: 2
                }
                onClicked: {
                    Qt.quit();
                }
            }

            Button {
                id: zoom_button
                width: close_button.height
                height: close_button.height
                anchors.right: close_button.left
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                anchors.rightMargin: 10
                anchors.topMargin: 10
                anchors.bottomMargin: 10
                rightPadding: 16
                leftPadding: 16
                icon.height: 50
                icon.width: 50
                icon.source: "qrc:/content/asset/zoom.svg"
                display: AbstractButton.IconOnly
                background: Rectangle {
                    color: "#ECEFF1"
                    radius: 10
                    border.color: "#78909C"
                    border.width: 2
                }
                onClicked: {
                                if (window.visibility === Window.FullScreen) {
                                    window.width = Screen.width / 1.5;
                                    window.height = Screen.height / 1.5;
                                    window.x = (Screen.width - window.width) / 2;
                                    window.y = (Screen.height - window.height) / 2;
                                } else {
                                    window.visibility = Window.FullScreen
                                }
            }
            }

            Button {
                id: minimal_button
                width: close_button.height
                height: close_button.height
                anchors.right: zoom_button.left
                anchors.bottom: parent.bottom
                anchors.rightMargin: 10
                anchors.bottomMargin: 10
                leftPadding: 16
                rightPadding: 16
                icon.height: 50
                icon.width: 50
                icon.source: "qrc:/content/asset/minimize.svg"
                display: AbstractButton.IconOnly
                background: Rectangle {
                    color: "#ECEFF1"
                    radius: 10
                    border.color: "#78909C"
                    border.width: 2
                }
                onClicked: {
                    window.showMinimized();
                }
            }
    }


    Component {
        id: pageComponent
        Page {
            id: change_language

            Button {
                id: eng
                width: change_language.width * 0.45
                height: change_language.width * 0.25
                text: qsTr("ENGLISH")
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                font.pointSize: 50

                display: AbstractButton.TextOnly
                background: Rectangle {
                    color: "#F5F5F5"
                    radius: 20
                    border.color: "#FFFFFF"
                    border.width: 5
                }
                onClicked: {
                        backend.change_to_eng()

                    }
                onPressedChanged: {
                    if (pressed) {
                        background.color = "#B0BEC5";
                    } else {
                        background.color = "#F5F5F5";
                    }
                }
            }

            Button {
                id: japan

                width: change_language.width * 0.45
                height: change_language.width * 0.25
                text: qsTr("JAPANESE")
                anchors.verticalCenter: parent.verticalCenter
                anchors.right: parent.right
                anchors.rightMargin: 20
                font.pointSize: 50
                display: AbstractButton.TextOnly
                background: Rectangle {
                    color: "#F5F5F5"
                    radius: 20
                    border.color: "#FFFFFF"
                    border.width: 5
                }
                onClicked: {
                        backend.change_to_japan()

                    }
                onPressedChanged: {
                    if (pressed) {
                        background.color = "#B0BEC5";
                    } else {
                        background.color = "#F5F5F5";
                    }
                }
            }
        }
    }



}


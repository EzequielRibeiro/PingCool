import QtQuick 2.9
import QtQuick.Controls 2.12
import QtQuick.Window 2.12
import QtQuick.Layouts 1.12
import "size.js" as Size

Rectangle {
    id: pingWindow
    width: Screen.widht
    height: Screen.height
    color: "#000000"
    visible: true

    FontLoader {
        id: myFont
        source: "font.ttf"
    }

    Connections {
        target: start
        onSendValueToQml: {

            if (start.getValueFromC() === "fim") {

                buttonStart.text = "Start"
                animatedImage.source = "img/button_blue.png"
                start.stopPing()
                animationButton.stop()
            } else {
                console.log("append", start.getValueFromC())
                listModelPing.append({
                                         "ping": start.getValueFromC()
                                     })
            }
        }
    }

    //rolar lista
    function scrollViewToEnd() {
        var newIndex = listViewPing.count - 1
        // last index
        listViewPing.positionViewAtEnd()
        listViewPing.currentIndex = newIndex
    }
    GridLayout {
        id: gridLayout
        anchors.rightMargin: 15
        anchors.leftMargin: 15
        anchors.bottomMargin: 15
        anchors.topMargin: 15
        anchors.fill: parent
        anchors.margins: 5
        rowSpacing: 5
        columnSpacing: 5
        flow: width > height ? GridLayout.LeftToRight : GridLayout.TopToBottom
        Rectangle {
            id: rectangle1
            Layout.fillWidth: true
            Layout.fillHeight: true
            color: "#151413"
            radius: 20
            transformOrigin: Item.Center

            AnimatedImage {
                id: animatedImage
                visible: true
                source: "img/button_blue.png"

                property int imageSize: (rectangle1.width + rectangle1.height) / 2
                property int imageH: animatedImage.height
                property int imageW: animatedImage.width
                x: 160
                width: 100
                height: 100
                anchors.top: rectangle2.bottom
                anchors.topMargin: 10
                anchors.horizontalCenter: parent.horizontalCenter

                Component.onCompleted: {

                    //  animatedImage.width  = S.size(imageH,imageSize)
                    //  animatedImage.height = S.size(imageW,imageSize)
                }

                MouseArea {
                    id: mouseArea
                    anchors.fill: parent

                    onClicked: {

                        if (textInput.length !== 0) {
                            animationButtonCenter.start()

                            if (buttonStart.text == "Start") {
                                //hide keyboard
                                Qt.inputMethod.hide()

                                start.startPing(textInput.text, slider.value)
                                buttonStart.text = "Stop"
                                animatedImage.source = "img/button_red.png"
                                animationButton.start()
                            } else {

                                buttonStart.text = "Start"
                                animatedImage.source = "img/button_blue.png"
                                start.stopPing()
                                animationButton.stop()
                            }
                        }
                    }

                    BorderImage {
                        id: borderImage
                        x: 25
                        y: 25
                        width: 100
                        height: 100
                        anchors.verticalCenter: parent.verticalCenter
                        visible: true
                        anchors.horizontalCenter: parent.horizontalCenter
                        source: "img/button_border.png"

                        RotationAnimation on rotation {

                            id: animationButton
                            loops: Animation.Infinite
                            from: 0
                            to: 360
                            duration: 10 * Math.abs(to - from)
                            Component.onCompleted: stop()
                        }

                        RotationAnimation on rotation {

                            id: animationButtonCenter
                            from: 360
                            to: 0
                            duration: 1 * Math.abs(from - to)
                            Component.onCompleted: stop()
                        }
                    }
                }

                Text {
                    id: buttonStart
                    color: "#ffffff"
                    text: qsTr("Start")
                    font.family: "Courier"
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.pixelSize: 18
                }
            }

            Rectangle {
                id: rectangle2
                height: 45
                color: "#767676"
                radius: 20
                anchors.right: parent.right
                anchors.rightMargin: 50
                anchors.left: parent.left
                anchors.leftMargin: 50
                anchors.verticalCenter: parent.verticalCenter
                border.color: "#00000000"
                border.width: 0

                TextInput {
                    id: textInput
                    y: 14
                    height: 25
                    text: qsTr("127.0.0.1")
                    mouseSelectionMode: TextInput.SelectCharacters
                    font.bold: false
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.right: parent.right
                    anchors.rightMargin: 10
                    anchors.left: parent.left
                    anchors.leftMargin: 10
                    cursorVisible: true
                    transformOrigin: Item.Center
                    horizontalAlignment: Text.AlignHCenter
                    font.pixelSize: 22
                }
            }

            Text {
                id: logoText
                y: 176
                width: 300
                height: 60
                color: "#589bf7"
                text: qsTr("Ping Cool")
                fontSizeMode: Text.FixedSize
                anchors.right: parent.right
                anchors.rightMargin: 0
                anchors.left: parent.left
                anchors.leftMargin: 0
                textFormat: Text.PlainText
                verticalAlignment: Text.AlignVCenter
                clip: true
                lineHeight: 1
                horizontalAlignment: Text.AlignHCenter
                elide: Text.ElideMiddle
                wrapMode: Text.WordWrap
                visible: true
                anchors.bottom: rectangle2.top
                anchors.bottomMargin: 20
                font.letterSpacing: 1.4
                font.pixelSize: 50
                font.family: myFont.name
            }

            Slider {
                id: slider
                x: 185
                width: 300
                height: 40
                anchors.horizontalCenter: parent.horizontalCenter
                topPadding: 0
                padding: 0
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 5
                anchors.top: animatedImage.bottom
                anchors.topMargin: 10
                to: 2024
                stepSize: 32
                value: 32
                snapMode: Slider.SnapAlways
                from: 32

                Text {
                    id: textSliderValue
                    color: "#ffffff"

                    text: slider.value + " bytes"
                    anchors.left: parent.left
                    anchors.leftMargin: 305
                    anchors.verticalCenter: parent.verticalCenter
                    font.pixelSize: 15
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignLeft
                }
            }
        }
        Rectangle {
            id: rectangle
            Layout.fillWidth: true
            Layout.fillHeight: true
            color: "#1d1b18"
            radius: 20
            ListView {
                id: listViewPing
                anchors.top: parent.top
                anchors.topMargin: 0
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 0
                anchors.right: parent.right
                anchors.rightMargin: 0
                anchors.left: parent.left
                anchors.leftMargin: 0
                spacing: 2
                clip: true
                flickableDirection: Flickable.HorizontalAndVerticalFlick
                keyNavigationWraps: true

                delegate: Text {
                    id: delegatePing
                    textFormat: Text.RichText
                    font.pointSize: 16
                    anchors.right: parent.right
                    anchors.rightMargin: 5
                    anchors.left: parent.left
                    anchors.leftMargin: 5
                    elide: Text.ElideRight
                    horizontalAlignment: Text.AlignHCenter
                    color: "green"
                    wrapMode: Text.WordWrap
                    text: ping
                }

                model: ListModel {
                    id: listModelPing
                    ListElement {
                        ping: qsTr(" ")
                        triggered: function () {
                            console.log("ping", ping)
                        }
                    }

                    onCountChanged: scrollViewToEnd()
                }
            }
        }
    }

    Component.onCompleted: {
        setSizeItem()
    }

    function setSizeItem() {

        var screenSize = (Screen.width * Screen.height)

        logoText.font.pixelSize = Size.size(screenSize, logoText.font.pixelSize)
        logoText.height = Size.size(screenSize, logoText.height)

        rectangle2.width = Size.size(screenSize, rectangle2.width)
        rectangle2.height = Size.size(screenSize, rectangle2.height)

        textInput.font.pixelSize = Size.size(screenSize,
                                             textInput.font.pixelSize)
        textInput.height = Size.size(screenSize, textInput.height)

        animatedImage.width = Size.size(screenSize, animatedImage.width)
        animatedImage.height = Size.size(screenSize, animatedImage.height)

        borderImage.width = Size.size(screenSize, borderImage.width)
        borderImage.height = Size.size(screenSize, borderImage.height)

        buttonStart.font.pixelSize = Size.size(screenSize,
                                               buttonStart.font.pixelSize)
        buttonStart.height = Size.size(screenSize, buttonStart.height)

        slider.width = Size.size(screenSize, slider.width)
        slider.height = Size.size(screenSize, slider.height)

        textSliderValue.font.pixelSize = Size.size(
                    screenSize, textSliderValue.font.pixelSize)
        textSliderValue.height = Size.size(screenSize, textSliderValue.height)
    }
}

/*##^##
Designer {
    D{i:0;height:800;width:600}D{i:7;anchors_height:120;anchors_width:120;anchors_x:160;anchors_y:640}
D{i:6;anchors_height:120;anchors_y:640}D{i:5;anchors_x:195}D{i:10;anchors_width:350}
D{i:11;anchors_width:250}D{i:12;anchors_width:225;anchors_x:185}
}
##^##*/


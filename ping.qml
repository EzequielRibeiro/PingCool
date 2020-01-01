import QtQuick 2.9
import QtQuick.Controls 2.5
import QtQuick.Window 2.2
import QtQuick.Layouts 1.12

import "size.js" as S


Rectangle {
    id: pingWindow
    color: "#000000"
    visible: true



    FontLoader { id: myFont; source: "font.ttf" }


    Connections {
        target: start
        onSendValueToQml:{


            if(start.getValueFromC() === "fim"){

                buttonStart.text = "Start"
                animatedImage.source = "img/button_blue.png"
                start.stopPing();
                animationButton.stop()

            }else{
                console.log("append",start.getValueFromC())
                listModelPing.append({ping: start.getValueFromC()})
            }


        }


    }

    //rolar lista
    function scrollViewToEnd() {
        var newIndex = listViewPing.count - 1; // last index
        listViewPing.positionViewAtEnd();
        listViewPing.currentIndex = newIndex;
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
        flow:  width > height ? GridLayout.LeftToRight : GridLayout.TopToBottom
        Rectangle {
            id: rectangle1
            Layout.fillWidth: true
            Layout.fillHeight: true
            color: "#151413"
            radius: 20

            Switch {
                id: switchloop
                x: 195
                width: 80
                anchors.right: parent.right
                anchors.rightMargin: 20
                anchors.top: rectangle2.bottom
                anchors.topMargin: 0
                spacing: 0
                display: AbstractButton.IconOnly
                checked: true
                checkable: true
            }


            AnimatedImage {
                id: animatedImage
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 10
                visible: true
                source: "img/button_blue.png"


                property int imageSize: (rectangle1.width + rectangle1.height) / 2
                property int imageH: animatedImage.height
                property int imageW: animatedImage.width
                x: 160
                y: 640
                width: 120
                height: 120
                anchors.horizontalCenter: parent.horizontalCenter

                Component.onCompleted:{

                //  animatedImage.width  = S.size(imageH,imageSize)
                //  animatedImage.height = S.size(imageW,imageSize)

                }


                MouseArea {
                    id: mouseArea
                    anchors.fill: parent

                    onClicked: {

                        if(textInput.length !== 0){
                            animationButtonCenter.start()

                            if(buttonStart.text == "Start"){
                                //hide keyboard
                                Qt.inputMethod.hide();
                                start.startPing(textInput.text,switchloop.checked)
                                buttonStart.text = "Stop"
                                animatedImage.source = "img/button_red.png"
                                animationButton.start()

                            }else{

                                buttonStart.text = "Start"
                                animatedImage.source = "img/button_blue.png"
                                start.stopPing();
                                animationButton.stop()

                            }
                        }


                    }

                    BorderImage {
                        id: borderImage
                        x: 25
                        y: 25
                        width: 120
                        height: 120
                        visible: true
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.horizontalCenter: parent.horizontalCenter
                        source: "img/button_border.png"

                        RotationAnimation on rotation {

                            id: animationButton
                            loops: Animation.Infinite
                            from:0
                            to : 360
                            duration: 10 * Math.abs(to - from)
                            Component.onCompleted: stop()

                        }

                        RotationAnimation on rotation {

                            id: animationButtonCenter
                            from:360
                            to : 0
                            duration: 1 * Math.abs(from - to)
                            Component.onCompleted: stop()

                        }





                    }


                }

                Text {
                    id:  buttonStart
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
                anchors.bottom: animatedImage.top
                anchors.bottomMargin: 20
                anchors.right: parent.right
                anchors.rightMargin: 20
                anchors.left: parent.left
                anchors.leftMargin: 20
                border.color: "#00000000"
                border.width: 0

                TextInput {
                    id: textInput
                    y: 14
                    height: 25
                    text: qsTr("127.0.0.1")
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
                color: "#589bf7"
                text: qsTr("Ping Cool")
                font.letterSpacing: 1.4
                anchors.bottom: rectangle2.top
                anchors.bottomMargin: 15
                anchors.horizontalCenter: parent.horizontalCenter
                font.pixelSize: 35
                font.family: myFont.name
            }


        }
        Rectangle {
            id: rectangle
            Layout.fillWidth: true
            Layout.fillHeight: true
            color: "#1d1b18"
            radius: 20
            ListView{
                id:listViewPing
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

                model: ListModel{
                    id: listModelPing
                    ListElement{
                        ping: qsTr(" ")
                        triggered: function (){console.log("ping",ping);}

                    }

                    onCountChanged: scrollViewToEnd()
                }



            }


        }


    }



}
























































































































































































































































































/*##^## Designer {
    D{i:0;autoSize:true;height:480;width:800}D{i:7;anchors_height:120;anchors_width:120;anchors_x:160;anchors_y:640}
D{i:11;anchors_width:250}
}
 ##^##*/

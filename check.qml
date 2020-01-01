import QtQuick 2.9
import QtQuick.Controls 2.5
import QtQuick.Window 2.2
import QtQuick.Layouts 1.12


Page {
    id: checkWindow
    width: Screen.width
    height: Screen.height - 60
    title: "Check Port"

    FontLoader { id: myFont; source: "font.ttf" }

    Rectangle {
        id: rectangle3
        width: checkWindow.width
        height: checkWindow.height
        color: "#000000"
        anchors.fill: parent

       Component.onDestruction: start.checkPortStop()

        GridLayout {
            x: 15
            y: 15
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


                Text {
                    id: logoText
                    color: "#4cce21"
                    text: qsTr("Check Port")
                    anchors.bottom: rectangle2.top
                    anchors.bottomMargin: 20
                    anchors.horizontalCenter: parent.horizontalCenter
                    font.letterSpacing: 1.4
                    font.pixelSize: 35
                    font.family: myFont.name
                }


                Rectangle {
                    id: rectangle2
                    height: 45
                    color: "#767676"
                    radius: 20
                    anchors.bottom: rectangle4.top
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
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.right: parent.right
                        anchors.rightMargin: 5
                        anchors.left: parent.left
                        anchors.leftMargin: 5
                        cursorVisible: true
                        transformOrigin: Item.Center
                        horizontalAlignment: Text.AlignHCenter
                        font.pixelSize: 22
                    }
                }

                Rectangle {
                    id: rectangle4
                    height: 120
                    color: "#1d1b18"
                    radius: 20
                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: 14
                    anchors.left: parent.left
                    anchors.leftMargin: 20
                    anchors.right: parent.right
                    anchors.rightMargin: 20
                    border.width: 0

                    Rectangle {
                        id: rectInputOne
                        width: 80
                        height: 40
                        color: "#d1cdca"
                        radius: 20
                        anchors.bottom: recInputMult2.top
                        anchors.bottomMargin: 5
                        anchors.right: imageOnePort.left
                        anchors.rightMargin: 10
                        border.color: "#00000000"
                        border.width: 0

                        TextInput {
                            id: textInputOne
                            y: 14
                            height: 25
                            validator: IntValidator { bottom:1; top: 65535}
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.right: parent.right
                            anchors.rightMargin: 5
                            anchors.left: parent.left
                            anchors.leftMargin: 5
                            cursorVisible: true
                            transformOrigin: Item.Center
                            horizontalAlignment: Text.AlignHCenter
                            font.pixelSize: 18
                        }
                    }


                    Rectangle {
                        id: recInputMult1
                        x: 109
                        y: 130
                        width: 80
                        height: 40
                        color: "#d1cdca"
                        radius: 20
                        anchors.bottom: parent.bottom
                        anchors.bottomMargin: 5
                        anchors.right: element2.left
                        anchors.rightMargin: 5
                        border.color: "#00000000"
                        border.width: 0

                        TextInput {
                            id: textInputMult1
                            y: 14
                            width: 70
                            height: 25
                            validator: IntValidator { bottom:1; top: 65535}
                            anchors.right: parent.right
                            anchors.rightMargin: 0
                            anchors.left: parent.left
                            anchors.leftMargin: 0
                            anchors.verticalCenter: parent.verticalCenter
                            cursorVisible: true
                            transformOrigin: Item.Center
                            horizontalAlignment: Text.AlignHCenter
                            font.pixelSize: 18
                        }
                    }

                    Rectangle {
                        id: recInputMult2
                        x: 239
                        y: 105
                        width: 80
                        height: 40
                        color: "#d1cdca"
                        radius: 20
                        anchors.bottom: parent.bottom
                        anchors.bottomMargin: 5
                        anchors.right: imageMultiPort.left
                        anchors.rightMargin: 10
                        border.color: "#00000000"
                        border.width: 0

                        TextInput {
                            id: textInputMult2
                            y: 14
                            height: 25
                            validator: IntValidator { bottom:1; top: 65535}
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.right: parent.right
                            anchors.rightMargin: 5
                            anchors.left: parent.left
                            anchors.leftMargin: 5
                            cursorVisible: true
                            transformOrigin: Item.Center
                            horizontalAlignment: Text.AlignHCenter
                            font.pixelSize: 18
                        }
                    }



                    Image {
                        id: imageOnePort
                        x: 118
                        width: 80
                        height: 40
                        anchors.bottom: imageMultiPort.top
                        anchors.bottomMargin: 5
                        anchors.right: parent.right
                        anchors.rightMargin: 5
                        source: "img/button.png"
                        fillMode: Image.PreserveAspectFit

                        Text {
                            id: textButtonOne
                            text: "check"
                            anchors.fill: parent
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                            lineHeight: 0.2
                            font.pixelSize: 16
                        }





                        MouseArea {
                            id: mouseAreaButtonOne
                            anchors.fill: parent

                            onClicked: {
                                if(textInput.length != 0)
                                    if ((textInputOne.length !== 0) && (textButtonOne.length !== 0)){
                                        start.checkPortStop();
                                        textButtonTwo.text = "check"
                                        start.checkPort(textInput.text,parseInt(textInputOne.text));
                                        textError.text = ""
                                        //hide keyboard
                                        Qt.inputMethod.hide();
                                }else{

                                     textError.text = "invalid Input"

                                }
                            }
                        }
                    }

                    Image {
                        id: imageMultiPort
                        x: 376
                        width: 80
                        height: 40
                        anchors.bottom: parent.bottom
                        anchors.bottomMargin: 5
                        anchors.right: parent.right
                        anchors.rightMargin: 5
                        source: "img/button.png"
                        fillMode: Image.PreserveAspectFit

                        Text {
                            id: textButtonTwo
                            text: qsTr("check")
                            anchors.fill: parent
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                            lineHeight: 0.2
                            font.pixelSize: 16
                        }

                        MouseArea {
                            id: mouseAreaButtonT
                            anchors.fill: parent

                            onClicked: {

                                if(textButtonTwo.text === "check"){
                                    if((textInput.length != 0))
                                      if((textInputMult1.length != 0) && (textInputMult2.length != 0) )
                                         if(parseInt(textInputMult1.text) < parseInt(textInputMult2.text)){
                                               start.checkPortRange(textInput.text,parseInt(textInputMult1.text),
                                                   parseInt(textInputMult2.text));
                                                    textButtonTwo.text = "stop"
                                                    textError.text = ""
                                             //hide keyboard
                                             Qt.inputMethod.hide();

                                           }else{
                                              textError.text = "invalid Input"
                                           }

                                }else{
                                    textButtonTwo.text = "check"
                                    start.checkPortStop()
                                }
                            }
                        }
                    }

                    Text {
                        id: element2
                        y: 138
                        color: "#ffffff"
                        text: qsTr("<")
                        anchors.bottom: parent.bottom
                        anchors.bottomMargin: 15
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        anchors.right: recInputMult2.left
                        anchors.rightMargin: 5
                        font.bold: true
                        font.pixelSize: 20
                    }


                }


                Text {
                    id: textError
                    height: 20
                    color: "#f63f3f"
                    text: qsTr("")
                    anchors.top: rectangle2.bottom
                    anchors.topMargin: 10
                    horizontalAlignment: Text.AlignHCenter
                    anchors.right: parent.right
                    anchors.rightMargin: 10
                    anchors.left: parent.left
                    anchors.leftMargin: 10
                    font.capitalization: Font.AllLowercase
                    font.family: "Tahoma"
                    font.pixelSize: 14
                }

            }


            Rectangle {
                id: rectangle
                Layout.fillWidth: true
                Layout.fillHeight: true
                color: "#1d1b18"
                radius: 20
                ListView{
                    id:listViewPort
                    anchors.right: parent.right
                    anchors.rightMargin: 15
                    anchors.left: parent.left
                    anchors.leftMargin: 15
                    anchors.top: parent.top
                    anchors.topMargin: 15
                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: 15
                    spacing: 2
                    clip: true
                    flickableDirection: Flickable.HorizontalAndVerticalFlick
                    keyNavigationWraps: true

                    delegate: Text {
                        id: delegatePort
                        textFormat: Text.RichText
                        font.pointSize: 16
                        anchors.right: parent.right
                        anchors.rightMargin: 5
                        anchors.left: parent.left
                        anchors.leftMargin: 5
                        elide: Text.ElideRight
                        horizontalAlignment: Text.AlignLeft
                        color: "white"
                        wrapMode: Text.WordWrap
                        text: port

                    }

                    model: ListModel{
                        id: listModelPort
                        ListElement{
                            port: qsTr(" ")
                            triggered: function (){console.log("check",port);}

                        }

                        onCountChanged: scrollViewToEnd()


                    }

                }


            }


        }
    }

    Connections {
        target: start
        onSendValuePortToQml:{

            var valueFromC = start.getValuePortFromC()

            if(valueFromC)
                if(valueFromC !== "fim")
                    listModelPort.append({port:valueFromC})
                 else{
                    textButtonOne.text = "check"
                    textButtonTwo.text = "check"
                }


        }


    }


    //rolar lista
    function scrollViewToEnd() {
        var newIndex = listModelPort.count - 1; // last index
        listViewPort.positionViewAtEnd();
        listViewPort.currentIndex = newIndex;
    }


    property real refValor: 800 * 480

    function size(value) {
       var sizeCurrent = Screen.width * Screen.heigth;
       return Math.round((value * sizeCurrent) / refValor);
    }


}

























































































































/*##^## Designer {
    D{i:0;height:800;width:480}D{i:5;anchors_width:268}D{i:15;anchors_height:40;anchors_y:105}
D{i:21;anchors_height:40}D{i:8;anchors_height:150}
}
 ##^##*/

import QtQuick 2.9
import QtQuick.Controls 2.5
import QtQuick.Window 2.2
import QtQuick.Layouts 1.12
import QtQuick.Controls.Styles 1.4
import QtQuick.Controls 1.4
import "size.js" as Size


Page {
    id: checkWindow
    width: Screen.width
    height: Screen.height
    title: "Check Port"

    property var aviso: "Check a port's status by entering an address and port number"


    FontLoader { id: myFont; source: "font.ttf" }

    Rectangle {
        id: rectangle3
        width: 460
        height: 720
        color: "#000000"
        anchors.fill: parent

        Component.onDestruction: start.checkPortStop()

        GridLayout {
            y: 15
            anchors.topMargin: 15
            anchors.right: parent.right
            anchors.rightMargin: 15
            anchors.left: parent.left
            anchors.leftMargin: 15
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 15
            anchors.top: parent.top
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
                    height: 60
                    color: "#4cce21"
                    text: qsTr("Check Port")
                    anchors.right: parent.right
                    anchors.rightMargin: 5
                    anchors.left: parent.left
                    anchors.leftMargin: 5
                    layer.enabled: true
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                    anchors.bottom: rectangle2.top
                    anchors.bottomMargin: 20
                    font.letterSpacing: 1.4
                    font.pixelSize: 50
                    font.family: myFont.name
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
                    width: 400
                    color: "#1d1b18"
                    radius: 20
                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: 10
                    anchors.left: parent.left
                    anchors.leftMargin: 10
                    anchors.right: parent.right
                    anchors.rightMargin: 10
                    anchors.top: rectangle2.bottom
                    anchors.topMargin: 10
                    border.width: 0

                    Rectangle {
                        id: rectInputOne
                        width: 100
                        height: 30
                        color: "#d1cdca"
                        radius: 20
                        anchors.left: element2.right
                        anchors.leftMargin: 5
                        anchors.bottom: recInputMult2.top
                        anchors.bottomMargin: 10
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
                        width: 100
                        height: 30
                        color: "#d1cdca"
                        radius: 20
                        anchors.verticalCenter: parent.verticalCenter
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
                        width: 100
                        height: 30
                        color: "#d1cdca"
                        radius: 20
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.verticalCenter: parent.verticalCenter
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



                    Text {
                        id: element2
                        y: 138
                        color: "#ffffff"
                        text: qsTr("<")
                        anchors.right: recInputMult2.left
                        anchors.rightMargin: 5
                        anchors.verticalCenter: parent.verticalCenter
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        font.bold: true
                        font.pixelSize: 20
                    }

                    Button {
                        id: button1
                        y: 30
                        height: 30
                        text: qsTr("CHECK")
                        iconSource: ""
                        anchors.left: rectInputOne.right
                        anchors.leftMargin: 10
                        anchors.bottom: button2.top
                        anchors.bottomMargin: 10
                        style: ButtonStyle {
                            background: Rectangle {
                                radius: 4
                                implicitHeight: 25
                                border.width: control.activeFocus ? 2 : 1
                                gradient: Gradient {
                                    GradientStop {
                                        position: 0
                                        color: control.pressed ? "#ccc" : "#eee"
                                    }

                                    GradientStop {
                                        position: 1
                                        color: control.pressed ? "#aaa" : "#ccc"
                                    }
                                }
                                border.color: "#888888"
                                implicitWidth: 100
                            }
                        }
                        onClicked: {
                            if(textInput.length != 0)
                                if ((textInputOne.length !== 0) && (button1.length !== 0)){
                                    start.checkPortStop();
                                    button2.text = "CHECK"
                                    start.checkPort(textInput.text,parseInt(textInputOne.text));
                                    textError.text = aviso
                                    //hide keyboard
                                    Qt.inputMethod.hide();
                                }else{

                                    textError.text = "invalid Input"

                                }
                        }
                    }

                    Button {
                        id: button2
                        y: 30
                        width: 100
                        height: 30
                        text: qsTr("CHECK")
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.left: recInputMult2.right
                        anchors.leftMargin: 10
                        style: ButtonStyle {
                            background: Rectangle {
                                radius: 4
                                implicitHeight: 25
                                border.width: control.activeFocus ? 2 : 1
                                gradient: Gradient {
                                    GradientStop {
                                        position: 0
                                        color: control.pressed ? "#ccc" : "#eee"
                                    }

                                    GradientStop {
                                        position: 1
                                        color: control.pressed ? "#aaa" : "#ccc"
                                    }
                                }
                                border.color: "#888888"
                                implicitWidth: 100
                            }
                        }

                        onClicked: {

                            if(button2.text === "CHECK"){
                                if((textInput.length != 0))
                                    if((textInputMult1.length != 0) && (textInputMult2.length != 0) )
                                        if(parseInt(textInputMult1.text) < parseInt(textInputMult2.text)){

                                            start.checkPortRange(textInput.text,parseInt(textInputMult1.text),
                                                                 parseInt(textInputMult2.text));
                                            button2.text = "STOP"
                                            textError.text = aviso
                                            Qt.inputMethod.hide();

                                        }else{
                                            textError.text = "invalid Input"
                                        }

                            }else{
                                button2.text = "CHECK"
                                start.checkPortStop()
                            }
                        }
                    }

                    Text {
                        id: textError
                        y: 154
                        height: 20
                        color: "#cfc5c5"
                        text: aviso
                        wrapMode: Text.WrapAnywhere
                        anchors.right: parent.right
                        anchors.rightMargin: 5
                        anchors.left: parent.left
                        anchors.leftMargin: 5
                        fontSizeMode: Text.Fit
                        anchors.bottom: parent.bottom
                        anchors.bottomMargin: 10
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignHCenter
                        font.capitalization: Font.MixedCase
                        font.family: "Tahoma"
                        font.pixelSize: 18
                    }





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
                    button1.text = "CHECK"
                    button2.text = "CHECK"
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


    Component.onCompleted: {
        setSizeItem()
    }

    function setSizeItem(){

        var screenSize =  (Screen.width * Screen.height);

        logoText.font.pixelSize = Size.size(screenSize,logoText.font.pixelSize);
        logoText.height = Size.size(screenSize,logoText.height);

        textInput.font.pixelSize = Size.size(screenSize,textInput.font.pixelSize);
        textInput.height = Size.size(screenSize,textInput.height);

        rectangle2.width = Size.size(screenSize,rectangle2.width);
        rectangle2.height = Size.size(screenSize,rectangle2.height);

        rectangle4.width = Size.size(screenSize,rectangle4.width);
        rectangle4.height = Size.size(screenSize,rectangle4.height);

        rectInputOne.width = Size.size(screenSize,rectInputOne.width);
        rectInputOne.height = Size.size(screenSize,rectInputOne.height);

        textInputOne.font.pixelSize = Size.size(screenSize,textInputOne.font.pixelSize);
        textInputOne.height = Size.size(screenSize,textInputOne.height);

        recInputMult1.width = Size.size(screenSize,recInputMult1.width);
        recInputMult1.height = Size.size(screenSize,recInputMult1.height);

        textInputMult1.font.pixelSize = Size.size(screenSize,textInputMult1.font.pixelSize);
        textInputMult1.height = Size.size(screenSize,textInputMult1.height);

        recInputMult2.width = Size.size(screenSize,recInputMult2.width);
        recInputMult2.height = Size.size(screenSize,recInputMult2.height);

        textInputMult2.font.pixelSize = Size.size(screenSize,textInputMult2.font.pixelSize);
        textInputMult2.height = Size.size(screenSize,textInputMult2.height);

        button1.width = Size.size(screenSize,button1.width);
        button1.height = Size.size(screenSize,button1.height);

        button2.width = Size.size(screenSize,button2.width);
        button2.height = Size.size(screenSize,button2.height);

        element2.width = Size.size(screenSize,element2.width);
        element2.height = Size.size(screenSize,element2.height);

        textError.width = Size.size(screenSize,textError.width);
        textError.height = Size.size(screenSize,textError.height);

    }


}

/*##^##
Designer {
    D{i:0;height:800;width:600}D{i:5;anchors_width:268}D{i:9;anchors_height:40}D{i:12;anchors_width:100;anchors_x:109}
D{i:16;anchors_y:14}D{i:15;anchors_height:40;anchors_x:239;anchors_y:105}D{i:19;anchors_height:40;anchors_x:"-2";anchors_y:"-7"}
D{i:25;anchors_height:40;anchors_x:0;anchors_y:29}D{i:31;anchors_height:20;anchors_width:120;anchors_x:215}
D{i:8;anchors_height:130}D{i:3;anchors_x:15}
}
##^##*/

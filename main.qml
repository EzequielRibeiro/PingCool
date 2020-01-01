import QtQuick 2.9
import QtQuick.Window 2.1
import QtQuick.Controls 2.5
import QtQuick.Controls.Material 2.3
//import StartQml 1.0
//import PingModelQml 1.0
import QtQuick.Dialogs.qml 1.0
import QtQuick.Window 2.2
import QmlBanner 1.0




ApplicationWindow {
    id: applicationWindow
    width: Screen.width
    height: Screen.height
    color: "#000000"
    visible: true
    Material.theme: Material.Dark
    Material.accent: Material.Purple


    onClosing: {
        if(Qt.platform.os == "android"){

            if(stackView.depth > 1){
                close.accepted = false
                stackView.pop()
            }

        }

    }

    Component.onCompleted: {
           // Load Banner
           id_banner.loadBanner()

       }

    QmlBanner {
        id: id_banner
        unitId: "ca-app-pub-0822808376839371/8383424039"
        bannerSize: QmlBanner.BANNER


        onBannerLoaded: {


        }

     }


    StackView{
        id: stackView
        anchors.fill: parent
        initialItem: Qt.resolvedUrl("ping.qml")

    }

    Dialog{

        id:aboutDialog
        width: 200
        height: 200
        visible: false
        title: qsTr("About")
        standardButtons: Dialog.Ok
        anchors.centerIn: parent

        Rectangle {
            id: rectangle
            width: 200
            height: 200
            color: "#ffffff"
            radius: 5
            border.color: "#1c62ec"
            border.width: 5
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter

            Text {
                id: element
                text: qsTr("<p>Ping Cool</p><p>v1.0</p><p>developer</p><p>Ezequiel A. Ribeiro</p>")
                lineHeight: 0.4
                textFormat: Text.RichText
                verticalAlignment: Text.AlignVCenter
                anchors.fill: parent
                horizontalAlignment: Text.AlignHCenter
                font.pixelSize: 14
            }
        }
    }

    header: ToolBar{
        id: toolBar
        anchors.left: parent.left
        anchors.right: parent.right


        ToolButton{
            id: menuButton
            anchors.left: parent.left
            anchors.verticalCenter: parent.verticalCenter


            onClicked:{

                if(stackView.depth > 1){
                    stackView.pop()
                }else{
                   drawer.open()
                }
            }


            Image {
                id: image
                x: 0
                width: 35
                height: 35
                anchors.left: parent.left
                anchors.leftMargin: 5
                anchors.top: parent.top
                anchors.topMargin: 0
                source: stackView.depth > 1 ? "img/icon_back.png" : "img/menu_icon.png"
                fillMode: Image.PreserveAspectFit
            }


        }

    }

    Drawer{

        id: drawer
        width: Math.min(applicationWindow.width,applicationWindow.height) / 3 * 2
        height: applicationWindow.height


        Rectangle{

            id:rectLogo
            anchors.top: parent.top
            width: drawer.width
            height: logo.height
            color: "#c6c2c2"
            radius: 0
            border.width: 0
            anchors.topMargin: 0
            anchors.left: parent.left
            anchors.leftMargin: 0

            Image {
                id: logo
                anchors.left: parent.left
                anchors.leftMargin: 0
                anchors.top: parent.top
                anchors.topMargin: 0
                source: "img/icon_world.png"
            }

            Label {
                text: "v1.0"
                anchors.right: parent.right
                anchors.rightMargin: 5
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 0
                font.pixelSize: 14
                font.italic: true
                color: "steelblue"
            }


        }

        Rectangle{

            id:rectColumn
            width: drawer.width
            anchors.top: rectLogo.bottom
            height: applicationWindow.height - logo.height
            color: "#d5cfcf"



        }


        Column{
          anchors.top: rectLogo.bottom
          width: drawer.width
          height: applicationWindow.height - logo.height



          ItemDelegate{
            text: qsTr("")
            width: parent.width

          }

          ItemDelegate{
            text: qsTr("")

          }

          MenuSeparator { }

           ItemDelegate{
             text: qsTr("Check Port")
             width: parent.width
             icon.source: "img/icon_internet.svg"

             onClicked: {

                 stackView.push("check.qml")
                 drawer.close()

             }

           }

           MenuSeparator { }

           ItemDelegate{
             text: qsTr("Privacy Policy")
             width: parent.width
             icon.source: "img/icon_policy.svg"
             onClicked: {

                 stackView.push("privacy.qml")
                 drawer.close()

             }

           }

           MenuSeparator { }

           ItemDelegate{
             text: qsTr("About")
             width: parent.width
             icon.source: "img/icon_info.svg"
             onClicked: {

                 aboutDialog.open()
                 drawer.close()

             }

           }


        }




    }





}































































































































































































/*##^## Designer {
    D{i:0;height:800;width:480}
}
 ##^##*/

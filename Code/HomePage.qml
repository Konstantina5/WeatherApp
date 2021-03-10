import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.Controls 2.3
import QtQuick.Layouts 1.3
import QtQuick.Controls.Material 2.0

Rectangle{
    visible: true
    anchors.fill: parent
    property string language: "en"
    property string unit: "metric"

    //background: Rectangle{
       // color: "#f7e0f0"
   // }
       gradient: clubcolors



        Component
            {
                id:setting
                Settings
                {

                }
            }


        ColumnLayout{
            id:tools
            anchors.left: parent.left
            anchors.right: parent.right

            spacing: 0

            ToolBar{
                id: myToolBar
                anchors.top: parent.top
                anchors.left: parent.left
                anchors.right: parent.right
                //height: parent.height/2
                //anchors.top: parent.top

                background: Rectangle {

                 anchors.fill: parent
                  color: "#5ca6e3"
                }
                    RowLayout{
                        anchors.fill:parent
                        anchors.rightMargin: parent.width/20
                        TextField{
                            Layout.alignment: Qt.AlignHCenter
                            anchors.top: parent.top
                            id: textIn
                            placeholderText: {
                                if(language=="en"){
                                    "Give location"
                                }else{
                                    "Δώσε τοποθεσία"
                                }
                            }

                        }
                        ToolButton{
                            background: Rectangle {
                                implicitWidth: 40
                                implicitHeight:  40
                                color : "#5ca6e3"
                            }
                            anchors.left: textIn.right
                            anchors.top: parent.top
                            font.pointSize: 16
                            text:"\uD83D\uDD0D"
                            onClicked: {
                                page1.api();
                            }
                        }
                        ToolButton{
                            background: Rectangle {
                                implicitWidth: 40
                                implicitHeight:  40
                                color : "#5ca6e3"
                            }
                            anchors.right: parent.right
                            anchors.top: parent.top
                            font.pointSize: 16

                            text: "\u2699"




                            onClicked: {

                                stack.push(setting);
                            }
                        }
                    }
                }
            TabBar {
                     id: tabBar
                     anchors.left: parent.left
                     anchors.right: parent.right
                     currentIndex: swipeView.currentIndex
                     TabButton {
                         text: {
                             if(language=="en"){
                                 qsTr("Current")
                             }else{
                                 qsTr("Τώρα")
                             }

                         }

                     }
                     TabButton {
                         text: {
                             if(language=="en"){
                                 qsTr("7 Days")
                             }else{
                                 qsTr("7 Μέρες")
                             }

                         }
                     }
                     TabButton {
                         text: {
                             if(language=="en"){
                                 qsTr("Favourites")
                             }else{
                                 qsTr("Αγαπημένα")
                             }

                         }
                     }

                    }

        }





    SwipeView {
        id: swipeView
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.top: tools.bottom
        currentIndex: tabBar.currentIndex
        Page1 {

            id: page1
            onSetWeather: {

                //page2.weather(id)
                //console.log(id)
            }
        }
        Page2{
            id: page2
        }
        Page3{
            id: page3
        }

    }

    Gradient {
          id: clubcolors
          GradientStop { position: 0.0; color: "#c71d6f"}
          GradientStop { position: 0.66; color: "#d09693"}
     }
}

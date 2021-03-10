import QtQuick.Controls 2.0
import QtQuick 2.6
import QtQuick.Window 2.2
import QtQuick.Controls 2.1
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import QtQuick.Layouts 1.3
import QtQuick.Dialogs 1.2


Page3Form {

    id:page3

    RowLayout{
        anchors.top:parent.top
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.right: parent.right

        anchors.margins: 10

    Rectangle
    {
        Layout.fillHeight: true
        Layout.fillWidth: true
        color: "transparent"

        ListView{
            id:myview
            anchors.fill:parent
            anchors.margins:5
            anchors.topMargin: parent.height/25
            model:mediator.myModel
            delegate: myDelegate
            spacing:10
            focus:true
            clip:true
        }
    }
    Component{
        id:myDelegate

        Rectangle{
            width:myview.width
            height:myview.height/10
            border.width: 1
            border.color: "gray"
            z: myview.currentIndex === model.index ? 2 : 1
            color:"#5ca6e3"
            RowLayout{
                anchors.fill: parent
                Label{
                    verticalAlignment: "AlignVCenter"
                    id:cityLabel
                    text:city
                    color: "white"
                    leftPadding: myview.width/90
                    font.pointSize: 18
                    font.family: "Book Antiqua"
                }
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        textIn.text=cityLabel.text;
                        page1.api();
                        tabBar.setCurrentIndex(0);

                    }

                }
                Button{
                    iconSource:"close-icon.png"
                  /*  Text{
                      text: 	"\u2715"
                      color: "white"
                      font.pixelSize: 16
                    }*/

                    anchors.right:parent.right
                    //anchors.rightMargin: 8
                    anchors.rightMargin: myview.width/90
                    height:myDelegate.height
                    style: ButtonStyle {
                        background: Rectangle{
                            color:"#5ca6e3"
                        }
                    }
                    onClicked: {
                        mediator.removeCity(index);
                    }
                }
            }
        }
    }
    }
}


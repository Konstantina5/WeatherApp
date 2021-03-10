import QtQuick 2.4
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.0
import  QtQuick.Controls.Material 2.2

Item {
    //width: 400
   // height: 400
    property alias temperature: temp
    property alias wheatherDesc: wheather
    property alias backgroundImage: background
    property alias fav: roundButton
    property alias toast1: toast


    Image {
        id: background
        anchors.fill: parent
       // source: "forecast/clear.jpg"
        fillMode: Image.Stretch
    }

    ColumnLayout{
        anchors.fill: parent
        anchors.margins: 8


        Label {
            id: temp
            // anchors.horizontalCenter: parent.horizontalCenter
            font.pixelSize: 50
            color: "white"
            anchors.top: parent.top
            anchors.margins: 10
                //text: "dgdf"
        }

        Label{
            anchors.top: temp.bottom
            id: wheather
            color: "white"
            font.pixelSize: 24
            anchors.margins: 10

        }
    }

    RoundButton {
        text: "\u2665"
        id: roundButton
        width: 50
        height: 50

        font.pointSize: 18
        anchors.bottom: parent.bottom
        anchors.margins: 24
        anchors.right : parent.right
       // anchors.rightMargin:  8
        background: Rectangle {
           // color: roundMouseArea.pressed ? "red" : (roundMouseArea.containsMouse ? "darkorange" : "transparent")
            //border.color: "darkorange"
            color: "#009999"
            radius: parent.width / 2
            anchors.fill: parent
        }

    }
    ToolTip {
            id: toast
            //delay: 500
            timeout: 3000
            x: (parent.width - width) / 2
            y: (parent.height - 100)

            background: Rectangle {
                color: "grey"
                radius: 15
            }
        }






}








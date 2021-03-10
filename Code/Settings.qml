import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.Controls 2.3
import QtQuick.Layouts 1.3
import QtQuick.Controls.Material 2.0
import QtQuick.Controls.Styles 1.4

Rectangle {
     id: set
    // color: "#f7e0f0"
     gradient: clubcolors


     Keys.onReleased:  {
         console.log("mpike")
     }

     ColumnLayout{
         id: tools
         anchors.top: parent.top
         anchors.left: parent.left
         anchors.right: parent.right
         ToolBar {

             anchors.top: parent.top
             anchors.left: parent.left
             anchors.right: parent.right




            // Material.foreground: "white"
           //  Material.primary: Material.Blue
            // Material.background: "white"
            // Material.accent: "white"
             background: Rectangle {

              anchors.fill: parent
                color: "#5ca6e3"
             }

             RowLayout {
                 anchors.fill: parent
                 ToolButton{
                    Layout.alignment: Qt.AlignRight
                    background: Rectangle {
                        implicitWidth: 40
                        implicitHeight:  40
                        color : "#5ca6e3"
                    }
                    id:back
                    Image{
                        height: parent.height
                        source:"back.png"
                        fillMode: Image.PreserveAspectFit

                    }
                    onClicked: {
                        check();
                        if(page1.flag){
                            page1.api();
                        }
                        stack.pop()
                    }
                 }
                 Label {
                     text: {
                         if(language=="en"){
                            "Settings";
                         }else{
                             "Ρυθμίσεις";
                         }
                     }
                     font.family: "Comic Sans MS"
                     elide: Label.ElideRight
                     horizontalAlignment: Qt.AlignHCenter
                     verticalAlignment: Qt.AlignVCenter
                     Layout.fillWidth: true
                     font.pixelSize: 24
                     color: "#f0f0f0"
                 }
             }
             }
     }




     GroupBox {
         id:metric
         anchors.top: tools.bottom
         anchors.margins: 10
         //title: "Metric System"
         label: Text {
             color: "white"
             text: {
                 if(language=="en"){
                    "Metric System"
                 }else{
                     "Σύστημα Μέτρησης"
                 }
             }

             font.pointSize: 20

         }

         anchors.left: parent.left
         anchors.right: parent.right

         RowLayout {
             anchors.fill: parent
             ExclusiveGroup { id: tabPositionGroup }
             RadioButton {
                 id: f
                 text: "Fahrenheit"

                 font.pointSize: 16
                 checked: {
                     if(unit=="imperial"){
                        true;
                     }else{
                         false;
                     }
                 }

                 //exclusiveGroup: tabPositionGroup
             }
             RadioButton {
                 id: c
                 anchors.right: parent.right
                 checked: {
                     if(unit=="metric"){
                        true;
                     }else{
                         false;
                     }
                 }
                 text: "Celsius"
                 font.pointSize: 16
                // exclusiveGroup: tabPositionGroup
             }
         }
     }

     GroupBox {
         anchors.top: metric.bottom
         anchors.topMargin: 20
         anchors.margins: 10
         label: Text {
             color: "white"
             text: {
                 if(language=="en"){
                    "Language"
                 }else{
                     "Γλώσσα"
                 }
             }

             font.pointSize: 20

         }
         font.pointSize: 16
         anchors.left: parent.left
         anchors.right: parent.right

         RowLayout {
             anchors.fill: parent
            // ExclusiveGroup { id: tabPositionGroup }
             RadioButton {
                 id: en

                 text: {
                     if(language=="en"){
                        "English"
                     }else{
                         "Αγγλικά"
                     }
                 }

                 font.pointSize: 16
                 checked: {
                    if(language=="en"){
                       true;
                    }else{
                        false;
                    }
                 }
                 //exclusiveGroup: tabPositionGroup
             }
             RadioButton {
                 id: el
                 text: {
                     if(language=="en"){
                        "Greek"
                     }else{
                         "Ελληνικά"
                     }
                 }

                 anchors.right: parent.right
                 font.pointSize: 16
                 checked: {
                     if(language=="el"){
                        true;
                     }else{
                         false;
                     }
                 }

                // exclusiveGroup: tabPositionGroup
             }
         }
     }



     function check(){
         if(en.checked){
              en.checked=true;
             language="en"
         }
         if(el.checked){
             el.checked=true;
             language="el"
         }
         if(f.checked){
             unit="imperial"
         }
         if(c.checked){
             unit="metric"
         }
     }

     Gradient {
           id: clubcolors
           GradientStop { position: 0.0; color: "#c71d6f"}
           GradientStop { position: 0.66; color: "#d09693"}
      }
}

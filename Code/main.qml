import QtQuick 2.9
import QtQuick.Controls 1.4
import QtQuick.Controls 2.3
import QtQuick.Layouts 1.3
import QtQuick.Controls.Material 2.0

ApplicationWindow {
    visible: true
    height: 700
    width: 700


    Component
        {
            id:view;
            HomePage {}
        }


        StackView
        {
            anchors.fill: parent
            initialItem: view
            id: stack
        }



}


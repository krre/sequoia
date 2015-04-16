import QtQuick 2.4
import QtQuick.Controls 1.3

Rectangle {
    width: 100
    height: 80
    color: "lightgray"
    border.color: "green"

    MouseArea {
        anchors.fill: parent
    }

    Column {
        anchors.right: parent.right
        anchors.rightMargin: 2
        anchors.top: parent.top
        anchors.topMargin: 2
        spacing: 1

        Button {
            property bool isFixed: true
            width: 17
            height: 17
            text: isFixed ? "G" : "F"
            tooltip: isFixed ? qsTr("Go") : qsTr("Fixation")
        }

        Button {
            width: 17
            height: 17
            text: "C"
            tooltip: qsTr("Comment")
        }

        Button {
            width: 17
            height: 17
            text: "D"
            tooltip: qsTr("Delete")
        }
    }
}


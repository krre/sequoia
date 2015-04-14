import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Window 2.2
import Sequoia.Lib 1.0

ApplicationWindow {
    id: mainRoot
    property string version: "0.1.0"
    title: "Sequoia"
    width: 800
    height: 600
    visible: true
    menuBar: MainMenu {}

    Component.onCompleted: {
        x = (Screen.width - width) / 2
        y = (Screen.height - height) / 2
    }

    Repository {
        id: repository
    }

    TabView {
        id: tabView
        anchors.fill: parent
    }
}

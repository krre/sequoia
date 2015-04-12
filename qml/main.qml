import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Window 2.2
import "utils.js" as Utils

ApplicationWindow {
    id: mainRoot
    property string version: "0.1.0"
    title: "Sequoia"
    width: 800
    height: 600
    visible: true

    menuBar: MenuBar {
        Menu {
            title: qsTr("File")
            MenuItem {
                text: qsTr("New...")
            }

            MenuItem {
                text: qsTr("Open...")
            }

            MenuItem {
                text: qsTr("Recent")
            }

            MenuItem {
                text: qsTr("Exit")
                onTriggered: Qt.quit();
            }
        }

        Menu {
            title: qsTr("Help")

            MenuItem {
                text: qsTr("About Sequoia...")
                onTriggered: Utils.createDynamicObject(mainRoot, "qrc:/qml/About.qml")
            }
        }
    }
}

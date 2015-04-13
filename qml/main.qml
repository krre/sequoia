import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Window 2.2
import Sequoia.Lib 1.0
import "utils.js" as Utils
import "enums.js" as Enums

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
                shortcut: "Ctrl+N"
                onTriggered: Utils.createDynamicObject(mainRoot, "qrc:/qml/RepoDialog.qml", { mode: Enums.RepoNew })
            }

            MenuItem {
                text: qsTr("Open...")
                shortcut: "Ctrl+O"
                onTriggered: Utils.createDynamicObject(mainRoot, "qrc:/qml/RepoDialog.qml", { mode: Enums.RepoOpen })
            }

            MenuItem {
                text: qsTr("Recent")
            }

            MenuSeparator {}

            MenuItem {
                text: qsTr("Exit")
                shortcut: "Ctrl+Q"
                onTriggered: Qt.quit()
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

    Utils {

    }
}

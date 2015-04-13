import QtQuick 2.4
import QtQuick.Controls 1.3
import "utils.js" as Utils
import "enums.js" as Enums

MenuBar {
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

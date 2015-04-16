import QtQuick 2.4
import QtQuick.Controls 1.3
import "utils.js" as Utils

MenuBar {
    property alias recentFilesModel: recentFilesModel
    Menu {
        title: qsTr("File")

        MenuItem {
            text: qsTr("Open...")
            shortcut: "Ctrl+O"
            onTriggered: Utils.createDynamicObject(mainRoot, "qrc:/qml/RepoDialog.qml")
        }

        Menu {
            id: recentFilesMenu
            title: qsTr("Recent Files")
            enabled: recentFilesModel.count > 0

            Instantiator {
                model: recentFilesModel

                MenuItem {
                    text: model.filePath
                    onTriggered: Utils.openFile(text)
                }

                onObjectAdded: recentFilesMenu.insertItem(index, object)
                onObjectRemoved: recentFilesMenu.removeItem(object)
            }

            MenuSeparator {
                visible: recentFilesModel.count > 0
            }

            MenuItem {
                text: qsTr("Clear Menu")
                onTriggered: recentFilesModel.clear()
            }

            ListModel {
                id: recentFilesModel
            }
        }

        MenuSeparator {}

        MenuItem {
            text: qsTr("Close")
            onTriggered: tabView.removeTab(tabView.currentIndex)
            enabled: tabView.count > 0
        }

        MenuItem {
            text: qsTr("Close All")
            onTriggered: {
                while (tabView.count > 0) {
                    tabView.removeTab(0)
                }
            }
            enabled: tabView.count > 0
        }

        MenuItem {
            text: qsTr("Close Other")
            enabled: tabView.count > 1
            onTriggered: {
                var i = 0
                while (tabView.count > 1) {
                    if (i !== tabView.currentIndex) {
                        tabView.removeTab(i)
                    } else {
                        i++
                    }
                }
            }
        }

        MenuSeparator {}

        MenuItem {
            text: qsTr("Exit")
            shortcut: "Ctrl+Q"
            onTriggered: Qt.quit()
        }
    }

    Menu {
        title: qsTr("Repository")
        enabled: tabView.count > 0

        MenuItem {
            text: qsTr("Compress")
        }

        MenuItem {
            text: qsTr("Extract")
        }

        MenuItem {
            text: qsTr("Remove")
            onTriggered: Utils.removeRepo()
        }
    }

    Menu {
        title: qsTr("Tools")

        MenuItem {
            text: qsTr("Options...")
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

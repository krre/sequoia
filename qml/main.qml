import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Window 2.2
import "utils.js" as Utils

ApplicationWindow {
    id: mainRoot
    property string version: "0.1.0"
    property var currentTab: tabView.count > 0 ? tabView.getTab(tabView.currentIndex).item : null
    title: "Sequoia"
    width: 800
    height: 600
    visible: true
    menuBar: MainMenu { id: mainMenu }

    Component.onCompleted: {
        x = (Screen.width - width) / 2
        y = (Screen.height - height) / 2
        Utils.loadRecentFiles()
        Utils.loadSession()
    }

    Component.onDestruction: {
        Utils.saveRecentFiles(mainMenu.recentFilesModel)
        Utils.saveSession()
    }

    TabView {
        id: tabView
        anchors.fill: parent
    }
}

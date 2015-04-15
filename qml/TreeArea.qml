import QtQuick 2.4
import Sequoia.Lib 1.0

Rectangle {
    id: root
    property bool isCurrentTab: mainRoot.currentTab === root
    property url fileUrl

    Timer {
        id: timer
        interval: 2000
        running: isCurrentTab
        repeat: true
//        onTriggered: print("2 sec", root)
    }

    Repository {
        id: repository
    }

    Node {
        x: 10
        y: 10
    }
}


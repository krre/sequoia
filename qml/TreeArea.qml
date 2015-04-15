import QtQuick 2.4
import Sequoia.Lib 1.0

Rectangle {
    property url fileUrl

    Timer {
        id: timer
        interval: 2000
        running: true
        repeat: true
//        onTriggered: print("2 sec")
    }

    Repository {
        id: repository
    }

    Node {
        x: 10
        y: 10
    }
}


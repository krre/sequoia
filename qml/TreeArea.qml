import QtQuick 2.4
import Sequoia.Lib 1.0

Rectangle {
    property url fileUrl

    Repository {
        id: repository
    }

    Node {
        x: 10
        y: 10
    }
}


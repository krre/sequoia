import QtQuick 2.4
import Sequoia.Lib 1.0

Rectangle {
    id: root
    property bool isCurrentTab: mainRoot.currentTab === root
    property alias repository: repository

    Repository {
        id: repository
        onIsModifyChanged: print(isModify)
    }

    Node {
        x: 10
        y: 10
    }
}


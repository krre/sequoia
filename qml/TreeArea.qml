import QtQuick 2.4
import Sequoia.Lib 1.0

Rectangle {
    id: root
    property bool isCurrentTab: mainRoot.currentTab === root
    property alias repository: repository
    property var treeModel: ({})
    property var head
    property int revision: 1

    Component.onCompleted: {
        treeModel.revision = revision
        treeModel.description = ""
        head = treeModel
    }

    function addLeafToHead(headRevision) {
        var node = findNode(treeModel, headRevision)
        var childCounter = 0
        for (var prop in node) {
            if (prop.substring(0, 5) === "child") {
                childCounter++
            }
        }
        // new head
        var childProp = "child" + childCounter
        node[childProp] = {}
        head = node[childProp]
        head.revision = ++revision
        head.description = ""
        head.parentProperty = childProp
        head.parentRevision = headRevision
    }

    function findNode(node, revision) {
        for (var prop in node) {
            if (prop === "revision" && node[prop] === revision) {
                return node
            } else if (prop.substring(0, 5) === "child") {
                return findNode(node[prop], revision)
            }
        }
        return node
    }

    function removeSubTree(revision) {
        var node = findNode(treeModel, revision)
        var parentNode = findNode(treeModel, node.parentRevision)
        delete parentNode[node.parentProperty]
        head = parentNode
    }

    Repository {
        id: repository
        onIsModifyChanged: {
            if (isModify) {
                addLeafToHead(head.revision)
                print(JSON.stringify(treeModel))
            } else {
                removeSubTree(head.revision)
                print(JSON.stringify(treeModel))
            }
        }
    }
}


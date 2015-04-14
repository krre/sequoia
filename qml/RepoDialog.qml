import QtQuick 2.4
import QtQuick.Dialogs 1.1
import "enums.js" as Enums
import "utils.js" as Utils

FileDialog {
    id: root
    property string mode: Enums.RepoNew
    title: mode === Enums.RepoNew ? qsTr("Select file for new repository") :  qsTr("Open repository")
    selectFolder: mode === Enums.RepoOpen
    nameFilters: mode === Enums.RepoNew ? qsTr("All Files (*.*)") : qsTr("Sequoia repository (*.sequoia)")

    Component.onCompleted: open()

    onAccepted: {
        switch (mode) {
            case Enums.RepoNew: Utils.createRepo(fileUrl); break
            case Enums.RepoOpen: Utils.openRepo(fileUrl); break
        }
    }

    onVisibleChanged: if (!visible) root.destroy()
}

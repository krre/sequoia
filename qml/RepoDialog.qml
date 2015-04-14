import QtQuick 2.4
import QtQuick.Dialogs 1.1
import "utils.js" as Utils

FileDialog {
    id: root
    title: qsTr("Open File")
    onAccepted: Utils.openFile(fileUrl)
    onVisibleChanged: if (!visible) root.destroy()
    nameFilters: qsTr("All Files (*.*)")
    Component.onCompleted: open()
}

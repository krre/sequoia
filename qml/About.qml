import QtQuick 2.4
import QtQuick.Dialogs 1.2

MessageDialog {
    id: root
    title: qsTr("About Sequoia")
    standardButtons: StandardButton.Ok
    text: String("<h3>Sequoia %1</h3>
          Build date: %2<br>
          Copyright (c) 2015, Vladimir Zarypov<br>").arg(mainRoot.version).arg(UTILS.buildDate)
    onVisibleChanged: if (!visible) root.destroy()
    Component.onCompleted: open()
}

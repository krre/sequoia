import QtQuick 2.4
import QtQuick.Dialogs 1.2
import "enums.js" as Enums

MessageDialog {
    property string type

    onVisibleChanged: if (!visible) destroy()

    Component.onCompleted: {
        if (type === Enums.MessageInfo) {
            icon = StandardIcon.Information
            standardButtons = StandardButton.Ok
        } else if (type === Enums.MessageQuestion) {
            icon = StandardIcon.Question
            standardButtons = StandardButton.Yes | StandardButton.No
        } else if (type === Enums.MessageWarning) {
            icon = StandardIcon.Question
            standardButtons = StandardButton.Ok
        } else if (type === Enums.MessageError) {
            icon = StandardIcon.Critical
            standardButtons = StandardButton.Ok
        }
        open()
    }
}

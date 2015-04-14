import QtQuick 2.4
import QtQuick.Dialogs 1.2
import "enums.js" as Enums

MessageDialog {
    id: messageDialog
    property string titleType
    title: titleType + " - Sequoia"

    function openForType(type, message) {
        text = message
        if (type === Enums.MessageInfo) {
            titleType = qsTr("Information")
            icon = StandardIcon.Information
            standardButtons = StandardButton.Ok
        } else if (type === Enums.MessageQuestion) {
            titleType = qsTr("Question")
            icon = StandardIcon.Question
            standardButtons = StandardButton.Yes | StandardButton.No
        } else if (type === Enums.MessageWarning) {
            titleType = qsTr("Warning")
            icon = StandardIcon.Question
            standardButtons = StandardButton.Ok
        } else if (type === Enums.MessageError) {
            titleType = qsTr("Question")
            icon = StandardIcon.Critical
            standardButtons = StandardButton.Ok
        }
        open()
    }
}

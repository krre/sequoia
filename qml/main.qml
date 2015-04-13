import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Window 2.2

ApplicationWindow {
    id: mainRoot
    property string version: "0.1.0"
    title: "Sequoia"
    width: 800
    height: 600
    visible: true
    menuBar: MainMenu {}
}

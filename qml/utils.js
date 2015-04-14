.import "enums.js" as Enums

function createDynamicObject(parent, url, properties) {
    var component = Qt.createComponent(url)
    var errorMessage = component.errorString()
    if (errorMessage) {
        print("Error loading component " + url + ":", errorMessage)
    } else {
        return component.createObject(parent, properties ? properties : {})
    }
}

function openFile(fileUrl) {
    var result = repository.open(fileUrl)
    var tab = tabView.addTab("")
    tabView.currentIndex = tabView.count - 1
    var properties = {}
    properties.fileUrl = fileUrl
    tab.setSource("qrc:/qml/TreeArea.qml", properties)
    tab.title = UTILS.urlToFileName(fileUrl)
    if (!result) {
        messageDialog.text = qsTr("Created new repository")
        messageDialog.open()
    }
}

function removeRepo() {
    messageDialog.openForType(Enums.MessageQuestion, qsTr("Repository will be removed. Are you sure?"))
}

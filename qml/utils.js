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
    repository.open(fileUrl)
    var tab = tabView.addTab("")
    tabView.currentIndex = tabView.count - 1
    var properties = {}
    tab.setSource("qrc:/qml/TreeArea.qml", properties)
    tab.title = UTILS.urlToFileName(fileUrl)
}

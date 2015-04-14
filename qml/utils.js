function createDynamicObject(parent, url, properties) {
    var component = Qt.createComponent(url)
    var errorMessage = component.errorString()
    if (errorMessage) {
        print("Error loading component " + url + ":", errorMessage)
    } else {
        return component.createObject(parent, properties ? properties : {})
    }
}

function createRepo(fileUrl) {
    repository.create(fileUrl)
    var tab = tabView.addTab("")
    tabView.currentIndex = tabView.count - 1
    var properties = {}
    tab.setSource("qrc:/qml/TreeArea.qml", properties)
    tab.title = UTILS.urlToFileName(fileUrl)
}

function openRepo(fileUrl) {
    repository.open(fileUrl)
}


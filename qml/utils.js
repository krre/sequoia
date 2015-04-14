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
    tabView.addTab(UTILS.urlToFileName(fileUrl))
}

function openRepo(fileUrl) {
    repository.open(fileUrl)
}


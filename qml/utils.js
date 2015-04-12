function createDynamicObject(parent, url, properties) {
    var component = Qt.createComponent(url);
    var errorMessage = component.errorString()
    if (errorMessage !== "") {
        console.log("Error loading component " + url + ":", errorMessage);
    } else if (properties) {
        return component.createObject(parent, properties)
    } else {
        return component.createObject(parent)
    }
}


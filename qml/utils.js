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
    var result = UTILS.openRepo(fileUrl)
    var tab = tabView.addTab("")
    tabView.currentIndex = tabView.count - 1
    var properties = {}
    properties.fileUrl = fileUrl
    tab.setSource("qrc:/qml/TreeArea.qml", properties)
    tab.title = UTILS.urlToFileName(fileUrl)
    addRecentFile(fileUrl)
    if (!result) {
        openMessageDialog(Enums.MessageInfo, qsTr("Created new repository"))
    }
}

function removeRepo() {
    var messageDialog = openMessageDialog(Enums.MessageQuestion, qsTr("Repository will be removed. Are you sure?"))
    messageDialog.yes.connect(function() {
        var fileUrl = tabView.getTab(tabView.currentIndex).item.fileUrl
        repository.remove(fileUrl)
        tabView.removeTab(tabView.currentIndex)
    })
}

function openMessageDialog(type, message) {
    return createDynamicObject(mainRoot, "qrc:/qml/MessageDialogBase.qml", { type: type, text: message })
}

function addRecentFile(fileUrl) {
    var filePath = UTILS.urlToPath(fileUrl)
    var model = mainMenu.recentFilesModel
    // prevention of duplication of filePath and raising it on top
    for (var i = 0; i < model.count; i++) {
        if (model.get(i).filePath === filePath) {
            model.remove(i)
        }
    }
    model.insert(0, { filePath: filePath })
    // max recent files is 10
    if (model.count == 11) {
        model.remove(10)
    }
}

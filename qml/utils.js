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
    addRecentFile(fileUrl)
    var tab = tabView.addTab(UTILS.urlToFileName(fileUrl))
    tabView.currentIndex = tabView.count - 1
    tab.setSource("qrc:/qml/TreeArea.qml")
    var result = currentTab.repository.initRepo(fileUrl)
    if (!result) {
        openMessageDialog(Enums.MessageInfo, qsTr("Created new repository"))
    }
}

function removeRepo() {
    var messageDialog = openMessageDialog(Enums.MessageQuestion, qsTr("Repository will be removed. Are you sure?"))
    messageDialog.yes.connect(function() {
        currentTab.repository.remove()
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
    var maxRecentFiles = 10
    if (model.count == maxRecentFiles + 1) {
        model.remove(maxRecentFiles)
    }
}

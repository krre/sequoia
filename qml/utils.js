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

function openFile(path) {
    addRecentFile(path)
    var tab = tabView.addTab(UTILS.urlToFileName(path))
    tabView.currentIndex = tabView.count - 1
    tab.setSource("qrc:/qml/TreeArea.qml")
    var result = currentTab.repository.initRepo(path)
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

function addRecentFile(path) {
    var model = mainMenu.recentFilesModel
    // prevention of duplication of filePath and raising it on top
    for (var i = 0; i < model.count; i++) {
        if (model.get(i).filePath === path) {
            model.remove(i)
        }
    }
    model.insert(0, { filePath: path })
    var maxRecentFiles = 10
    if (model.count == maxRecentFiles + 1) {
        model.remove(maxRecentFiles)
    }
}

function saveRecentFiles(model) {
    var list = []
    for (var i = 0; i < model.count; i++) {
        list.push(model.get(i).filePath)
    }
    SETTINGS.setRecentFiles(list)
}

function loadRecentFiles() {
    var list = SETTINGS.getRecentFiles()
    var model = mainMenu.recentFilesModel
    for (var i = 0; i < list.length; i++) {
        model.append({ filePath: list[i] })
    }
}

function saveSession() {
    var list = []
    for (var i = 0; i < tabView.count; i++) {
        list.push(tabView.getTab(i).item.repository.path)
    }
    SETTINGS.setSession(list)
}

function loadSession() {
    var list = SETTINGS.getSession()
    for (var i = 0; i < list.length; i++) {
        openFile(list[i])
    }
}

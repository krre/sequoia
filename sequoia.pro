TEMPLATE = app
QT += qml quick
CONFIG += c++11

SOURCES += main.cpp \
    cpp/utils.cpp \
    cpp/settings.cpp \
    cpp/repository.cpp

RESOURCES += qml.qrc

DISTFILES += \
    qml/main.qml \
    qml/About.qml \
    qml/utils.js \
    qml/enums.js \
    qml/RepoDialog.qml \
    qml/MainMenu.qml \
    qml/Node.qml \
    qml/TreeArea.qml \
    qml/MessageDialogBase.qml

HEADERS += \
    cpp/utils.h \
    cpp/settings.h \
    cpp/repository.h


TEMPLATE = app

QT += qml quick widgets

SOURCES += main.cpp \
    cpp/corelib.cpp

RESOURCES += qml.qrc

DISTFILES += \
    qml/main.qml \
    qml/About.qml \
    qml/utils.js \
    qml/enums.js \
    qml/RepoDialog.qml

HEADERS += \
    cpp/corelib.h


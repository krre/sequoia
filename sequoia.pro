TEMPLATE = app

QT += qml quick widgets

SOURCES += main.cpp \
    cpp/utils.cpp \
    cpp/settings.cpp

RESOURCES += qml.qrc

DISTFILES += \
    qml/main.qml \
    qml/About.qml \
    qml/utils.js \
    qml/enums.js \
    qml/RepoDialog.qml

HEADERS += \
    cpp/utils.h \
    cpp/settings.h


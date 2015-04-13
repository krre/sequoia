#include <QApplication>
#include <QQmlApplicationEngine>
#include <QtQml>
#include "cpp/utils.h"
#include "cpp/settings.h"

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);

    Settings settings;
    Utils utils;

    QQmlApplicationEngine engine;
    engine.rootContext()->setContextProperty("SETTINGS", &settings);
    engine.rootContext()->setContextProperty("UTILS", &utils);
    engine.load(QUrl(QStringLiteral("qrc:/qml/main.qml")));

    return app.exec();
}

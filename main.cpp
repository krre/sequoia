#include <QGuiApplication>
#include <QtQml>
#include "cpp/utils.h"
#include "cpp/settings.h"
#include "cpp/repository.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    qmlRegisterType<Repository>("Sequoia.Lib", 1, 0, "Repository");

    Settings settings;
    Utils utils;

    QQmlApplicationEngine engine;
    engine.rootContext()->setContextProperty("SETTINGS", &settings);
    engine.rootContext()->setContextProperty("UTILS", &utils);
    engine.load(QUrl(QStringLiteral("qrc:/qml/main.qml")));

    return app.exec();
}

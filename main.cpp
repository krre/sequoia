#include <QApplication>
#include <QQmlApplicationEngine>
#include <QtQml>
#include "cpp/utils.h"

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);

    qmlRegisterType<Utils>("Sequoia.Lib", 1, 0, "Utils");

    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/qml/main.qml")));

    return app.exec();
}

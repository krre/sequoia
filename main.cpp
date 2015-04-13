#include <QApplication>
#include <QQmlApplicationEngine>
#include <QtQml>
#include "cpp/corelib.h"

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);

    qmlRegisterType<CoreLib>("Sequoia", 1, 0, "CoreLib");

    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/qml/main.qml")));

    return app.exec();
}

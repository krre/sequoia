#include "settings.h"

Settings::Settings(QObject *parent) :
    QObject(parent)
{
    QString path = qApp->applicationDirPath() + QDir::separator() + "settings.ini";
    settings = new QSettings(path, QSettings::IniFormat, this);
    settings->setIniCodec("UTF-8");
}

void Settings::setLang(QString lang)
{
    settings->beginGroup("i18n");
        settings->setValue("lang", lang);
    settings->endGroup();
}

QString Settings::getLang()
{
    return settings->value("i18n/lang").toString();
}



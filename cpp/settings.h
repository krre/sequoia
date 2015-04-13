#ifndef SETTINGS_H
#define SETTINGS_H

#include <QtCore>

class Settings : public QObject
{
    Q_OBJECT
public:
    explicit Settings(QObject *parent = 0);
    ~Settings() {}
    Q_INVOKABLE void setLang(QString lang);
    Q_INVOKABLE QString getLang();

private:
    QSettings *settings;

};

#endif // SETTINGS_H

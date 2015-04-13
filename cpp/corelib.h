#ifndef CORELIB_H
#define CORELIB_H

#include <QtCore>

class CoreLib : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString buildDate READ getBuildDate CONSTANT)

public:
    explicit CoreLib(QObject *parent = 0) { Q_UNUSED(parent) }
    QString getBuildDate() { return QString(__DATE__); }
};

#endif // CORELIB_H

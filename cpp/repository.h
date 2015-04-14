#ifndef REPOSITORY_H
#define REPOSITORY_H

#include "QtCore"

class Repository : public QObject
{
    Q_OBJECT
public:
    explicit Repository(QObject *parent = 0);
    ~Repository() {}
    Q_INVOKABLE bool open(QUrl filepath);
    Q_INVOKABLE void remove(QUrl filepath);

private:
    long revision = 0;
};

#endif // REPOSITORY_H

#ifndef REPOSITORY_H
#define REPOSITORY_H

#include "QtCore"

class Repository : public QObject
{
    Q_OBJECT
public:
    explicit Repository(QObject *parent = 0);
    ~Repository() {}
    Q_INVOKABLE void remove(QUrl filepath);
    QString readHead();
    void setHead(QString head);

private:
    long revision = 0;
};

#endif // REPOSITORY_H

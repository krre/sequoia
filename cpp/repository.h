#ifndef REPOSITORY_H
#define REPOSITORY_H

#include "QtCore"

class Repository : public QObject
{
    Q_OBJECT
public:
    explicit Repository(QObject *parent = 0);
    ~Repository() {}
    Q_INVOKABLE void open(QUrl filepath);

signals:

public slots:
};

#endif // REPOSITORY_H

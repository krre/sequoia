#ifndef REPOSITORY_H
#define REPOSITORY_H

#include "QtCore"

class Repository : public QObject
{
    Q_OBJECT
public:
    explicit Repository(QObject *parent = 0);
    ~Repository() {}
    Q_INVOKABLE bool initRepo(QUrl fileUrl);
    Q_INVOKABLE void remove();
    QString readHead();
    void setHead(QString head);

private:
    long revision = 0;
    QString repoPath;
    QString filePath;
    QString fileName;
};

#endif // REPOSITORY_H

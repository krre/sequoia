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
    void writeHead(QString head);

private:
    long revision = 0;
    QString repoPath;
    QString filePath;
    QString fileName;
    QString metaPath;
    QString headPath;
    QString HEAD;
};

#endif // REPOSITORY_H

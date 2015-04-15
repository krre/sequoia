#include "repository.h"

Repository::Repository(QObject *parent) : QObject(parent)
{

}

bool Repository::initRepo(QUrl fileUrl)
{
    filePath = fileUrl.toLocalFile();
    fileName = fileUrl.fileName();
    repoPath = filePath + ".sequoia";
    metaPath = repoPath + QDir::separator() + "meta";
    headPath = metaPath + QDir::separator() + "HEAD";
    if (QFile::exists(repoPath)) {
        HEAD = readHead();
        return true;
    } else {
        QDir dir;
        dir.mkpath(repoPath);
        dir.mkpath(metaPath);
        QString headFile = fileName + ".0";
        QString targetPath = repoPath + QDir::separator() + headFile;
        QFile::copy(filePath, targetPath);
        writeHead(headFile);
        return false;
    }
}

void Repository::remove()
{
    QDir dir(repoPath);
    dir.removeRecursively();
}

QString Repository::readHead()
{
    QFile file(headPath);
    file.open(QIODevice::ReadOnly | QIODevice::Text);
    QByteArray byteArray;
    while (!file.atEnd())
        byteArray.append(file.readLine());

    return byteArray;
}

void Repository::writeHead(QString head)
{
    QFile file(headPath);
    file.open(QIODevice::WriteOnly | QIODevice::Text);
    QTextStream out(&file);
    out << head;
    file.close();
    HEAD = head;
}




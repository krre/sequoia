#include "repository.h"

Repository::Repository(QObject *parent) : QObject(parent)
{

}

bool Repository::initRepo(QUrl fileUrl)
{
    filePath = fileUrl.toLocalFile();
    fileName = fileUrl.fileName();
    repoPath = filePath + ".sequoia";
    if (QFile::exists(repoPath)) {
        return true;
    } else {
        QDir dir;
        dir.mkpath(repoPath);
        dir.mkpath(repoPath + QDir::separator() + "meta");
        QString targetPath = repoPath + QDir::separator() + fileName + ".0";
        QFile::copy(filePath, targetPath);
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

}

void Repository::setHead(QString head)
{

}




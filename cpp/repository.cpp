#include "repository.h"

Repository::Repository(QObject *parent) : QObject(parent)
{

}

bool Repository::open(QUrl filepath)
{
    QString sourcePath = filepath.toLocalFile();
    QString repoPath = sourcePath + ".sequoia";
    if (QFile::exists(repoPath)) {
        return true;
    } else {
        QDir().mkpath(repoPath);
        QString targetPath = repoPath + QDir::separator() + filepath.fileName();
        QFile::copy(sourcePath, targetPath);
        return false;
    }
}

void Repository::remove(QUrl filepath)
{
    QDir dir(filepath.toLocalFile() + ".sequoia");
    dir.removeRecursively();
}




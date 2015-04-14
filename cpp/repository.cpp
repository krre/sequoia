#include "repository.h"

Repository::Repository(QObject *parent) : QObject(parent)
{

}

void Repository::create(QUrl filepath)
{
    QString sourcePath = filepath.toLocalFile();
    QString repoPath = sourcePath + ".sequoia";
    bool result = QDir().mkpath(repoPath);
    if (result) {
        QString targetPath = repoPath + QDir::separator() + filepath.fileName();
        QFile::copy(sourcePath, targetPath);
    }
}




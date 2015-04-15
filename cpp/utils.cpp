#include "utils.h"

bool Utils::openRepo(QUrl filepath)
{
    QString sourcePath = filepath.toLocalFile();
    QString repoPath = sourcePath + ".sequoia";
    if (QFile::exists(repoPath)) {
        return true;
    } else {
        QDir dir;
        dir.mkpath(repoPath);
        dir.mkpath(repoPath + QDir::separator() + "meta");

        QString targetPath = repoPath + QDir::separator() + filepath.fileName() + ".0";
        QFile::copy(sourcePath, targetPath);
        return false;
    }
}

QString Utils::urlToPath(QUrl url)
{
    return url.toLocalFile();
}

QString Utils::urlToFileName(QUrl url)
{
    return url.fileName();
}

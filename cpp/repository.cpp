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
    fileSystemWatcher.addPath(filePath);
    connect(&fileSystemWatcher, SIGNAL(fileChanged(const QString&)), this, SLOT(onFileChanged(const QString&)));
    if (QFile::exists(repoPath)) {
        HEAD = readHead();
        setIsModify(!isHashEquals());
        return true;
    } else {
        QDir dir;
        dir.mkpath(repoPath);
        dir.mkpath(metaPath);
        QString headFile = fileName + ".0";
        QString targetPath = repoPath + QDir::separator() + headFile;
        QFile::copy(filePath, targetPath);
        writeHead(headFile);
        setIsModify(!isHashEquals());
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

QByteArray Repository::readBinaryFile(const QString &path)
{
    QFile file(path);
    file.open(QIODevice::ReadOnly);
    return file.readAll();

}

bool Repository::isHashEquals()
{
    QCryptographicHash cryptographicHash(QCryptographicHash::Sha1);
    cryptographicHash.addData(readBinaryFile(filePath));
    QByteArray fileHash = cryptographicHash.result();
    cryptographicHash.reset();
    cryptographicHash.addData(readBinaryFile(repoPath + QDir::separator() + HEAD));
    QByteArray headHash = cryptographicHash.result();
    return fileHash == headHash;
}

void Repository::writeHead(QString head)
{
    QFile file(headPath);
    file.open(QIODevice::WriteOnly);
    QTextStream out(&file);
    out << head;
    file.close();
    HEAD = head;
}

void Repository::setIsModify(bool isModify)
{
    if (m_isModify != isModify) {
        m_isModify = isModify;
        onIsModifyChanged(isModify);
    }
}

void Repository::onFileChanged(const QString &path)
{
    Q_UNUSED(path)
    setIsModify(!isHashEquals());
}




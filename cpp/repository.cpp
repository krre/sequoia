#include "repository.h"

Repository::Repository(QObject *parent) : QObject(parent)
{
}

bool Repository::initRepo(const QString &path)
{
    filePath = path;
    QUrl url(path);
    fileName = url.fileName();
    repoPath = filePath + ".sequoia";

    QString metaPath = repoPath + QDir::separator() + "meta";
    meta = new QSettings(metaPath, QSettings::IniFormat, this);
    meta->setIniCodec("UTF-8");

    fileSystemWatcher.addPath(filePath);
    connect(&fileSystemWatcher, SIGNAL(fileChanged(const QString&)), this, SLOT(onFileChanged(const QString&)));
    if (QFile::exists(repoPath)) {
        revision = meta->value("revision").toLongLong();
        head = meta->value("head").toLongLong();
        setIsModify(!isHashEquals());
        return true;
    } else {
        QDir dir;
        dir.mkpath(repoPath);
        meta->setValue("head", QString::number(head));
        meta->setValue("revision", "1");
        QString targetPath = repoPath + QDir::separator() + fileName + "." + QString::number(head);
        QFile::copy(filePath, targetPath);
        setIsModify(!isHashEquals());
        return false;
    }
}

void Repository::remove()
{
    QDir dir(repoPath);
    dir.removeRecursively();
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
    cryptographicHash.addData(readBinaryFile(repoPath + QDir::separator() + fileName + "." + QString::number(head)));
    QByteArray headHash = cryptographicHash.result();
    return fileHash == headHash;
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




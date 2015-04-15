#include "repository.h"

Repository::Repository(QObject *parent) : QObject(parent)
{

}

void Repository::remove(QUrl filepath)
{
    QDir dir(filepath.toLocalFile() + ".sequoia");
    dir.removeRecursively();
}

QString Repository::readHead()
{

}

void Repository::setHead(QString head)
{

}




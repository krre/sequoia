#include "repository.h"

Repository::Repository(QObject *parent) : QObject(parent)
{

}

void Repository::create(QUrl filepath)
{
    QDir().mkpath(filepath.toLocalFile() + ".sequoia");
}




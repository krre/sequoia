#ifndef REPOSITORY_H
#define REPOSITORY_H

#include "QtCore"

class Repository : public QObject
{
    Q_OBJECT
    Q_PROPERTY(bool isModify READ getIsModify NOTIFY onIsModifyChanged)
    Q_PROPERTY(QString path READ getPath CONSTANT)
public:
    explicit Repository(QObject *parent = 0);
    ~Repository() {}
    Q_INVOKABLE bool initRepo(const QString &path);
    Q_INVOKABLE void remove();
    QByteArray readBinaryFile(const QString &path);
    bool isHashEquals();
    bool getIsModify() { return m_isModify; }
    void setIsModify(bool isModify);
    QString getPath() { return filePath; }

signals:
    void onIsModifyChanged(bool isModify);

private slots:
    void onFileChanged(const QString &path);

private:
    QFileSystemWatcher fileSystemWatcher;
    bool m_isModify = false;
    long revision = 1;
    long head = 1;
    QSettings *meta;
    QString repoPath;
    QString filePath;
    QString fileName;
    QString headPath;
};

#endif // REPOSITORY_H

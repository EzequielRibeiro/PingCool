#ifndef PING_H
#define PING_H


#include <QtDebug>
#include <QProcess>
#include <QByteArray>
#include <QTextCodec>
#include <QObject>
#include <QIODevice>



class Ping: public QObject
{


public:
    Ping();
    virtual ~Ping();
    void KillProcess();
    bool isRunning();
    void run();

private:
    Q_PID pid;
    QProcess *process;
    QString exec;
    QStringList params;


public slots:
    void error(QProcess::ProcessError error);
    void processStatus();
    void readResultError();
    void readResult();
    void finishedPing(int exitCode);



};

#endif // PING_H

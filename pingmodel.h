#ifndef PINGMODEL_H
#define PINGMODEL_H

#include <QObject>
#include <QProcess>
#include <QThread>


class PingModel : public QThread
{
    Q_OBJECT

public:

    explicit PingModel();
    ~PingModel();
    Q_PID pid;
    bool is_running();
    bool finished();
    void terminate();
    void setHost(const QString h);
    void setValue(const QString v);
    void setValuePackage(const QString valuePackage);
    QString getValue();


signals:
    void valueChanged();

public slots:
    void verifyStatus();
    void readResult();
    void start_command();
    void error(QProcess::ProcessError error);
    void subProcessFinished(int,QProcess::ExitStatus);


private:
    QProcess *ping;
    bool running;
    QString host ;
    QString value, valuePackage;


};

#endif // PINGMODEL_H

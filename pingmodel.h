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

    bool is_running();
    bool finished();
    void terminate();
    void setLoop(bool loop);
    void setHost(QString h);
    void setValue(QString v);
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
    QString value;
    bool loop;

};

#endif // PINGMODEL_H

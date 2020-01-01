#ifndef MYTCPSOCKET_H
#define MYTCPSOCKET_H

#include <QObject>
#include <QTcpSocket>
#include <QAbstractSocket>
#include <QDebug>
#include <QThread>

class MyTcpSocket : public QThread
{
    Q_OBJECT
public:

    explicit MyTcpSocket(const QString host,const quint16 port);
    explicit MyTcpSocket(const QString host,const int bottom,const int top);

    QString getValue();
    void setStop(const bool stop);

signals:
    void valueChangedPort();

public slots:
    void connected();
    void disconnected();
    void bytesWritten(const qint64 bytes);
    void readyRead();
    void doConnect();

private:
    QTcpSocket *socket;
    quint16 port;
    QString host;
    QString value;
    int bottom;
    int top;
    bool isRangePort = false;
    bool stop = false;

};

#endif // MYTCPSOCKET_H

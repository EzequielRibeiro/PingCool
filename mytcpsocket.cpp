#include "mytcpsocket.h"
#include "QThread"
#include <QAbstractSocket>

MyTcpSocket::MyTcpSocket(const QString host,const quint16 port){

    this->port = port;
    this->host = host;
    isRangePort = false;

}


MyTcpSocket::MyTcpSocket(const QString host,const int bottom,const int top){

    this->host = host;
    this->bottom = bottom;
    this->top = top;
    isRangePort = true;

}

void MyTcpSocket::setStop(const bool stop){

    this->stop = stop;
}

void MyTcpSocket::doConnect()
{

    if(isRangePort){

        for(;bottom<=top;bottom++){

            if(stop){
                value = "fim";
                emit valueChangedPort();
                break;
            }

            port = (quint16) bottom;
            socket = new QTcpSocket(this);
            connect(socket, SIGNAL(connected()),this, SLOT(connected()));
            connect(socket, SIGNAL(disconnected()),this, SLOT(disconnected()));
            connect(socket, SIGNAL(bytesWritten(qint64)),this, SLOT(bytesWritten(qint64)));
            connect(socket, SIGNAL(readyRead()),this, SLOT(readyRead()));
            socket->connectToHost(host, port);

            if(!socket->waitForConnected(2500))
            {
               value =  QString::number(bottom)+" ---> "+"<font color = \"red\">"+socket->errorString()+"</font>";
               emit valueChangedPort();
            }
               socket->disconnectFromHost();
               QThread::sleep(1);


        }

        value = "fim";
        emit valueChangedPort();

    }else{

    socket = new QTcpSocket(this);
    connect(socket, SIGNAL(connected()),this, SLOT(connected()));
    connect(socket, SIGNAL(disconnected()),this, SLOT(disconnected()));
    connect(socket, SIGNAL(bytesWritten(qint64)),this, SLOT(bytesWritten(qint64)));
    connect(socket, SIGNAL(readyRead()),this, SLOT(readyRead()));
    // this is not blocking call
    socket->connectToHost(host, port);
    // we need to wait...
    if(!socket->waitForConnected(2500))
    {
       value =  QString::number(port)+" ---> "+"<font color = \"red\">"+socket->errorString()+"</font>";
       emit valueChangedPort();
    }

    socket->disconnectFromHost();
    }



}


QString MyTcpSocket::getValue(){

    return value;
}

void MyTcpSocket::connected()
{
    qDebug() << "connected: " <<port;

    value = QString::number(port)+" ---> "+"<font color = \"green\">connected</font>";
    emit valueChangedPort();
}

void MyTcpSocket::disconnected()
{
    qDebug() << "disconnected...";

}

void MyTcpSocket::bytesWritten(const qint64 bytes)
{
    qDebug() << bytes << " bytes written...";
}

void MyTcpSocket::readyRead()
{
    qDebug() << "reading...";

    // read the data from the socket
    qDebug() << socket->readAll();
}

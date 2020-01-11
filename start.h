#ifndef START_H
#define START_H
#include"pingmodel.h"
#include<QObject>
#include"QDebug"
#include"mytcpsocket.h"

class Start:public QObject
{
  Q_OBJECT
public:

    Start(QObject *parent = 0);
    Q_INVOKABLE void startPing(const QString host,const QString valuePackage);
    Q_INVOKABLE void stopPing();
    Q_INVOKABLE QString getValueFromC();
    Q_INVOKABLE QString getValuePortFromC();
    Q_INVOKABLE void checkPort(const QString host,const quint16 port);
    Q_INVOKABLE void checkPortRange(const QString host,const int bottom,const int top);
    Q_INVOKABLE void checkPortStop();


signals:
     void sendValueToQml();
     void sendValuePortToQml();


private:
      PingModel* pingModel;
      MyTcpSocket* myTcpSocket;
      QThread* thread;
      QString value;
      QString portValue, valuePackage;



public slots:
      void getValueStart();
      void getValuePortCheck();

};

#endif // START_H

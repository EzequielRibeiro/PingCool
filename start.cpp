#include "start.h"


Start::Start(QObject* parent) : QObject(parent)
{


}


void Start::startPing(const QString host,const QString valuePackage){

    thread = new QThread;
    pingModel = new PingModel();
    pingModel->setHost(host);
   // pingModel->setLoop(loop);
    pingModel->setValuePackage(valuePackage);
    pingModel->moveToThread(thread);

    connect(pingModel,SIGNAL(valueChanged()),this,SLOT(getValueStart()));
    connect(thread, SIGNAL (started()), pingModel, SLOT (start_command()));

    thread->start();

}


void Start::stopPing(){

   pingModel->terminate();
  // pingModel->exit();

 /*  if(thread)
       if(thread->isRunning())
             thread->exit();
*/



   /*
   MyTcpSocket s;

   quint16 port[5]={80,443,21,8080,25565};

    for(quint16 i = 0; i < 5; i++)
         s.doConnect(port[i]);

    */


}

void Start::checkPortStop(){


        if(myTcpSocket != nullptr)
           myTcpSocket->setStop(true);



}

void Start::checkPortRange(const QString host,const int bottom,const int top){

    QString temp = host;
    thread = new QThread;
    myTcpSocket = new MyTcpSocket(temp.replace(" ",""),bottom,top);
    myTcpSocket->moveToThread(thread);

    connect(myTcpSocket,SIGNAL(valueChangedPort()),this,SLOT(getValuePortCheck()));
    connect(thread,SIGNAL(started()),myTcpSocket, SLOT (doConnect()));

    thread->start();

}


void Start::checkPort(const QString host,const quint16 port){

    thread = new QThread;
    myTcpSocket = new MyTcpSocket(host,port);
    myTcpSocket->moveToThread(thread);

    connect(myTcpSocket,SIGNAL(valueChangedPort()),this,SLOT(getValuePortCheck()));
    connect(thread,SIGNAL(started()),myTcpSocket, SLOT (doConnect()));

    thread->start();

}

QString Start::getValueFromC(){
    return value;
}

QString Start::getValuePortFromC(){
    return portValue;
}
void Start::getValueStart(){

    value = pingModel->getValue();
    emit sendValueToQml();
}
void Start::getValuePortCheck(){

  portValue = myTcpSocket->getValue();
  emit sendValuePortToQml();


}


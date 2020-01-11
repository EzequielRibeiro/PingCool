#include "ping.h"
#include <QCoreApplication>


Ping::Ping(){}

Ping::~Ping(){


}


bool Ping::isRunning(){

      if(process->state() == QProcess::Running){
          return true; }
      else {
          return false;
      }


}

void Ping::run(){

    process = new QProcess();

    QObject::connect(process,&QProcess::started,this,&Ping::processStatus);
    QObject::connect(process,&QProcess::errorOccurred,this,&Ping::error);
    QObject::connect(process,SIGNAL(finished(int)),this,SLOT(readResult()));
    QObject::connect(process,&QProcess::readyReadStandardError,this,&Ping::readResultError);


    exec = "ping";
    params << "-w" <<  "3" <<  "www.google.com";
    process->start(exec,params,QIODevice::ReadOnly);
    process->waitForStarted(3000);
    process->waitForFinished(3000);

    if(process->state() == QProcess::Running){
    qDebug()<< "rodando";
    }
    else {
         qDebug()<< "parada";
    }

    pid = process->pid();
    QCoreApplication::processEvents();

}


void Ping::finishedPing(int exitCode){

    switch (exitCode) {

    case  QProcess::ExitStatus::NormalExit:
        qDebug()<<"NormalExit";
        break;

    case QProcess::ExitStatus::CrashExit:
        qDebug()<<"CrashExit";

        break;



    }


}


void Ping::readResultError(){

    qDebug()<<QString(process->readAllStandardError()).toUtf8().constData();

}

void Ping::readResult(){

    //convert byteArray to string
       QByteArray data = process->readAllStandardOutput();
       QTextCodec *codec;

       codec = QTextCodec::codecForName("UTF-8");

       qDebug()<< codec->toUnicode(data);

       // emit valueChangedTerminal();


}
void Ping::error(QProcess::ProcessError error){

    switch (error) {

       case QProcess::FailedToStart :
           qDebug()<<"The process failed to start";
           break;
       case QProcess::Crashed :
             qDebug()<< "The process crashed some time after starting successfully";
           break;
       case QProcess::Timedout :
             qDebug()<< "timed out";
           break;
       case QProcess::WriteError :
            qDebug()<< "An error occurred when attempting to write";
           break;
       case QProcess::ReadError :
            qDebug()<< "An error occurred when attempting to read";
           break;

       default:
           qDebug()<< "An unknown error occurred";

           break;
       }

      // emit valueChangedTerminal();

}
void Ping::processStatus(){

    switch (process->state()) {
       case QProcess::NotRunning:
           qDebug()<<"The process is not running";
            break;
           case QProcess::Starting:
           qDebug()<<"The process is starting, but the program has not yet been invoked";
            break;
           case QProcess::Running:
           qDebug()<<"The process is running and is ready for reading and writing";
            break;
        }

       //emit valueChangedTerminal();

}


void Ping::KillProcess(){

    if(process->state() == QProcess::Running){
      qDebug()<<"kill";
      process->kill();


    }




}

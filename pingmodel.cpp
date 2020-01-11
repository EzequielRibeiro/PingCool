#include <QString>
#include <QDebug>
#include "pingmodel.h"
#include <QHostInfo>
#include <QHostAddress>

PingModel::PingModel()
{
    ping = new QProcess(this);
    connect(ping, SIGNAL(started()), this, SLOT(verifyStatus()));
    connect(ping, SIGNAL(finished(int)), this, SLOT(readResult()));
    connect(ping,&QProcess::errorOccurred,this,&PingModel::error);
    connect(ping, SIGNAL(finished(int,QProcess::ExitStatus)),
            this, SLOT(subProcessFinished(int,QProcess::ExitStatus)));
}

PingModel::~PingModel(){
}

void PingModel::verifyStatus(){
    if(ping->isReadable()){
        qDebug() << "read on ...";
        connect(ping, SIGNAL(readyRead()), this, SLOT(readResult()));
        if(ping->canReadLine()){
            qDebug() << "LINE read on ...";
        }
    }else{
        qDebug() << "not able to read ...";
    }
}


void PingModel::subProcessFinished(int,QProcess::ExitStatus e){
    qDebug()<<e;

    value = "fim";
    emit valueChanged();

}

void PingModel::readResult(){

 QByteArray byteArray = ping->readAll();
 QString strLines = QString(byteArray);
 strLines = strLines.replace('\n',' ');
 strLines = strLines.replace("icmp_","");
 strLines = strLines.replace("PING","<br><p><font color = \"gold\">PING");
 strLines = strLines.replace("data.","data.</font></p>");

 if(strLines.contains("ping statistics")){
 strLines = strLines.replace("ping statistics","<p><font color = \"white\">ping statistics");
 strLines = strLines + "</font></p>";
 }

// if(strLines.contains("statistics"))
//   strLines = "<font color = \"red\">"+strLines+"</font>" ;

 running = false;
 value = strLines;


 if(!(byteArray.length() > 0))
       value = "fim";

 emit valueChanged();


}


void PingModel::setHost(QString h){

    host = h.replace(" ","");

}

void PingModel::setValuePackage(const QString valuePackage){

    this->valuePackage = valuePackage;

}

void PingModel::start_command(){

     QString command = "ping";
     QStringList args;

    args <<"-s"<<valuePackage<<"-v"<<"-b"<<host;

    if(ping){
        ping->start(command, args);
        pid = ping->pid();
        ping->waitForStarted(5000);
        running = true;
        ping->waitForFinished(5000);
    }
}


void PingModel::error(QProcess::ProcessError error){


    switch (error) {

    case QProcess::FailedToStart:
        value = "FailedToStart";
        break;
    case QProcess::Crashed:
        value = "Crashed";
        break;
    case QProcess::Timedout:
        value = "Timedout";
        break;
    case  QProcess::WriteError:
        value = "WriteError";
        break;
    case QProcess::ReadError:
        value = "ReadError";
        break;
    case QProcess::UnknownError:
        value = "UnknownError";
        break;

    }

    emit valueChanged();

    value = "fim";

    emit valueChanged();


}


bool PingModel::is_running(){
    return running;
}

bool PingModel::finished(){
    return ping->atEnd();
}
void PingModel::terminate(){


    if(ping->Running){
       //ping->start("kill", args);
         ping->terminate();

    }
}

void PingModel::setValue(QString v){
     value = v;
 }

QString PingModel::getValue(){
    return value;
}


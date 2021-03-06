#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <start.h>
#include <pingmodel.h>
#include "admob/QtAdMobBanner.h"
#include "admob/QtAdMobInterstitial.h"


int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);
	
    QmlAdMobBanner::DeclareQML();
    QmlAdMobInterstitial::DeclareQML();
	
    Start start;

   // qmlRegisterType<QmlBanner>("QmlBanner", 1,0, "QmlBanner");


    QQmlApplicationEngine engine;
    engine.rootContext()->setContextProperty("start", &start);
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}

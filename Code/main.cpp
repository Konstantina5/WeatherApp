#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "mediator.h"


int main(int argc, char *argv[])
{

   QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

   // QGuiApplication app(argc, argv);


   // QQmlApplicationEngine engine;

   // engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
   // if (engine.rootObjects().isEmpty())
       // return -1;

    QGuiApplication app(argc, argv);
        QQmlApplicationEngine engine;

        Mediator *m = new Mediator();

        engine.rootContext()->setContextProperty("mediator",m);
        engine.load(QUrl(QStringLiteral("qrc:/main.qml")));


        return app.exec();
}

#include "Database.h"
#include <QtSql>
#include <QtDebug>
#include <chrono>
#include <cityentry.h>

Database::Database()
{
    QString path = QStandardPaths::standardLocations(QStandardPaths::DataLocation).value(0);
    QDir dir(path);
    if (!dir.exists())
        dir.mkpath(path);
    if (!path.isEmpty() && !path.endsWith("/"))
        path += "/";
    path+="database.db";

    db = QSqlDatabase::addDatabase("QSQLITE");
    db.setDatabaseName(path);
    if (db.open()){
        //qDebug() << "Open!";
    }
    else{
        qDebug() << "Error = "<<db.lastError().text();
    }

    QSqlQuery query;
    query.exec("create table if not exists person "
              "(id integer primary key, "
              "city varchar(20), "
              "timestamp DATETIME DEFAULT CURRENT_TIMESTAMP)");

}


QList<cityEntry> Database::getCities(){
    QList<cityEntry> cities;
    QSqlQuery query;
    if (query.exec("SELECT id, city, timestamp FROM person ORDER BY timestamp DESC")){
        //qDebug() << "Success!";
    }
    else{
        qDebug() << "Error = "<<db.lastError().text();
    }

    while (query.next()) {
           int id = query.value(0).toInt();
           QString name = query.value(1).toString();
           QString time = query.value(2).toString();
           //qDebug() << name<<" "<<time<<" "<<id;
           cities<<cityEntry(name,id);
       }

    return cities;
}

bool Database::insertCity(QString city, int id){
    QSqlQuery query;
    QString time=QDateTime::currentDateTime().toString("yyyy-MM-dd hh:mm:ss");
    QString cityId=QString::number(id);

    if (query.exec("INSERT INTO person(id,city,timestamp) VALUES('"+cityId+"','"+city+"','"+time+"')")){
        //qDebug() << "Success!";
        return true;
    }
    else{
        if (query.exec("UPDATE person SET timestamp = '"+time+"', city = '"+city+"' WHERE id = '"+cityId+"'")){
            //qDebug() << "Success Updating!";
            return false;
        }
        else{
            qDebug() << "Error updating = "<<db.lastError().text();
            return false;
        }
    }
}

void Database::removeCity(int id){
    QSqlQuery query;
    QString cityId=QString::number(id);
    query.exec("DELETE FROM person WHERE id = '"+cityId+"'");
}

Database::~Database(){
    db.close();
}


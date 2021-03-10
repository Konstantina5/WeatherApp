#include <QStandardPaths>
#include <QFile>
#include <QDir>
#include <QTextStream>
#include <iostream>
#include "mediator.h"

Mediator::Mediator(QObject *parent) : QObject(parent)
{
    _cityModel = new cityModel();

    db=new Database();
    QList<cityEntry> list=db->getCities();

    //fills the list with the entries that were already saved in the database
    for(int i=0;i<list.length();i++){
        _cityModel->addCityAtEnd(list[i]);
    }
}

void Mediator::insertCity(QString cityName, QString cityID){
    if (cityName==""){
        return;
    }

    int id=cityID.toInt();
    bool isNew=db->insertCity(cityName,id);

    //if isNew is true, then the city is new and gets added in the list
    if (isNew){
        _cityModel->addCity(cityEntry(cityName,id));
    }
    //else, the city already existed and the list gets updated
    else{
        _cityModel->setCity(cityName,id);
    }

    cityModelChanged();
}

void Mediator::removeCity(int index){
    db->removeCity(_cityModel->getId(index));
    _cityModel->removeCity(index);
    cityModelChanged();
}

#include "citymodel.h"
#include <iostream>

cityModel::cityModel(QObject *parent): QAbstractListModel(parent) {
}

void cityModel::addCity(const cityEntry &city){
    beginInsertRows(QModelIndex(), 0, 0);
    m_cities.insert(0,city);
    endInsertRows();
}

void cityModel::addCityAtEnd(const cityEntry &city){
    beginInsertRows(QModelIndex(), rowCount(), rowCount());
    m_cities<<city;
    endInsertRows();
}

int cityModel::rowCount(const QModelIndex & parent) const {
    Q_UNUSED(parent);
    return m_cities.count();
}

QVariant cityModel::data(const QModelIndex & index, int role) const {
    if (index.row() < 0 || index.row() >= m_cities.count())
        return QVariant();
    const cityEntry &city = m_cities[index.row()];
    if (role == NameRole)
        return city.city();
    /*else if (role == NumberRole)
        return city.number();*/
    else if(role == IdRole)
        return city.id();
    return QVariant();
}

QHash<int, QByteArray> cityModel::roleNames() const {
    QHash<int, QByteArray> roles;
    roles[NameRole] = "city";
   // roles[NumberRole] = "number";
    roles[IdRole] = "id";
    return roles;
}

QString cityModel::getCity(int i)
{
    if (i>=0 && i<m_cities.count())
        return m_cities[i].city();
    return NULL;
}

void cityModel::removeCity(int index) {
    beginRemoveRows(QModelIndex(), index, index);
    m_cities.removeAt(index);
    endRemoveRows();
}

int cityModel::getId(int i){
    if (i>=0 && i<m_cities.count())
        return m_cities[i].id();
    return -1;
}

int cityModel::find(int id){
    int length=m_cities.length();
    for(int i=0;i<length;i++){
        if (m_cities[i].id()==id){
            return i;
        }
    }
    return -1;
}

void cityModel::setCity(QString &city,int id){
    int i=find(id);
    if (i!=-1){
        removeCity(i);
        addCity(cityEntry(city,id));
    }
}

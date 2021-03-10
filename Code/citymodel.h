#ifndef CITYMODEL_H
#define CITYMODEL_H
#include <QObject>
#include <QAbstractListModel>
#include "cityentry.h"

/**
 * @brief The cityModel class implements a listmodel for the listview that will contain the cities.
 */
class cityModel : public QAbstractListModel
{
    Q_OBJECT
    public:
        enum CityRoles {
            NameRole = Qt::UserRole + 1,
            IdRole
        };

        cityModel(QObject *parent = 0);

        /**
         * @brief addCity adds a new cityEntry at the beginning of the list
         * @param city the new city to be added
         */
        void addCity(const cityEntry &city);

        int rowCount(const QModelIndex & parent = QModelIndex()) const;
        QVariant data(const QModelIndex &index, int role=Qt::DisplayRole) const;

        /**
         * @brief getCity gets the name of the city that is in the i position of the QList
         * @param i the position of the wanted city
         * @return the name of the wanted city
         */
        QString getCity(int i);

        /**
         * @brief getId gets the city id of the city that is in the i position of the QList
         * @param i the position of the wanted city id
         * @return the wanted city id
         */
        int getId(int i);

        /**
         * @brief removeCity removes a city from the list
         * @param index the index of the city to be removed
         */
        void removeCity(int index);

        /**
         * @brief setCity changes the name of the city with this city id and moves the entry to the top of the listview.
         * @param city the new city name
         * @param id the city id of the city to be modified
         */
        void setCity(QString &city,int id);

        /**
         * @brief find searches the QList for the city with this city id and returns its position at the QList
         * @param id the city id of the city to be searched and -1 if this city id doesn't exist
         * @return the position of the city in the list
         */
        int find(int id);

        /**
         * @brief addCityAtEnd adds a cityEntry at the end of the list
         * @param city the city to be added
         */
        void addCityAtEnd(const cityEntry &city);
    protected:
        QHash<int, QByteArray> roleNames() const;
    private:
        QList<cityEntry> m_cities;
};
#endif // CITYMODEL_H

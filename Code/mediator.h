#ifndef MEDIATOR_H
#define MEDIATOR_H
#include <QObject>
#include "citymodel.h"
#include "database.h"

/**
 * @brief The Mediator class implements the mediator for the saved cities page list
 */
class Mediator : public QObject {

    cityModel *_cityModel;
    Database *db; //the database where the city entries are saved
    Q_OBJECT
    Q_PROPERTY(cityModel* myModel READ myModel WRITE setCityModel NOTIFY cityModelChanged)

    public:
        explicit Mediator(QObject *parent = 0);
        void setCityModel(cityModel* m)    {
            _cityModel = m;
            emit cityModelChanged();
        }
        cityModel* myModel()    {
            return _cityModel;
        }
    signals:
        void cityModelChanged();
    public slots:
        /**
         * @brief insertCity inserts a new city in the list or updates the list if the city exists. Is called when
         * the user presses the "save" button.
         * @param cityName the city name of the city to be added.
         * @param cityID the city id of the city to be added.
         */
        void insertCity(QString cityName, QString cityID);

        /**
         * @brief removeCity removes the city with the current index from the list. Is called when the user presses
         * the "x" button right next to a city.
         * @param index the index of the city to be removed.
         */
        void removeCity(int index);
};
#endif // MEDIATOR_H

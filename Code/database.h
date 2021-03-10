#ifndef DATABASE_H
#define DATABASE_H
#include <QtSql>
#include <cityentry.h>

/**
 * @brief The Database class implements the city database of this app. For each entry, the database stores the city id,
 * the city name and the time and date the city was saved.
 */
class Database
{
public:
    Database();

    /**
     * @brief getCities returns the city entries that are currently stored in the database in chronological order.
     * @return the cities in a QList form
     */
    QList<cityEntry> getCities();

    /**
     * @brief insertCity inserts a city in the database. Along with the city name and the city id, the current date and
     * time also get saved under the timestamp variable. If this city id already exists in the database, then the city
     * name and the timestamp are updated.
     * @param city the name of the city
     * @param id the city id
     * @return true if this is a new entry, false if the entry already exists or if an error occurs.
     */
    bool insertCity(QString city, int id);
    ~Database();
    /**
     * @brief removeCity removes an entry from the database.
     * @param id the city id of the city that will be removed.
     */
    void removeCity(int id);
private:
    QSqlDatabase db;
};

#endif // DATABASE_H

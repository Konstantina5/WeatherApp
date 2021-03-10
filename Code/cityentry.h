#ifndef CITYENTRY_H
#define CITYENTRY_H
#include <QString>

/**
 * @brief The cityEntry class implements a city entry of the listview.
 */
class cityEntry
{
public:
    cityEntry(const QString &city, const int &id);
    /**
     * @brief city returns the city name of this entry
     * @return the m_city variable
     */
    QString city() const;

    /**
     * @brief setCity sets the city name
     * @param city the new city name
     */
    void setCity(const QString &city);

    /**
     * @brief id returns this entry's city id
     * @return the m_id variable
     */
    int id() const;
private:
    QString m_city;
    int m_id;
};
#endif // CITYENTRY_H

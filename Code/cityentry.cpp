#include "cityentry.h"

cityEntry::cityEntry(const QString &city, const int &id)
    : m_city(city), m_id(id)
{
}

QString cityEntry::city() const
{
    return m_city;
}

void cityEntry::setCity(const QString &city)
{
    if (city != m_city) {
        m_city = city;
    }
}

int cityEntry::id() const{
    return m_id;
}



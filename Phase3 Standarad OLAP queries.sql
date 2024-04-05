-- # Rolling up tourism stats month to year
SELECT
    Date.Year,
    SUM(TourismFactTable.Totalnon-residentTourists) AS Totalnon-residentTourists,
    SUM(TourismFactTable.UnitedStatesTourists) AS UnitedStatesTourists,
    SUM(TourismFactTable.Non-USforeigntourists) AS Non-USforeigntourists
FROM
    TourismFactTable
INNER JOIN
    Date ON TourismFactTable.DateKey = Date.DateKey
GROUP BY
    Date.Year;


-- # Rolling up weather stats city to province
SELECT
    Location.location,
    AVG(weather.avg_temperature_v) AS avg_temperature_v,
    SUM(weather.precipitation_v) AS precipitation_v,
    SUM(weather.snow_v) AS snow_v
FROM
    Weather
JOIN
    Locations l ON Weather.location_key = Location.location_Key;
GROUP BY
    Location.location;


-- # Slice by 1 province
SELECT
  *
FROM TourismFactTable
WHERE Location.location_key=TourismFactTable.location_key AND Location.location='Quebec'


-- # Dice 1 province and between a few months
SELECT
  *
FROM TourismFactTable
WHERE Location.id=1 AND 122>Date.id>0


-- # Combined operations
-- #1. Weather: Roll up city to province during a certain period
SELECT
    location.location,
    AVG(Weather.average_temperature) AS avg_temp_province,
    SUM(Weather.rainfall) AS total_rainfall_province,
    SUM(Weather.snowfall) AS total_snowfall_province
FROM
    Weather
JOIN
    Locations ON Weather.location_key = location.location_Key;
GROUP BY
    location.location;
Where 121>date.id>0


-- #2.Tourism: For two provinces, roll up from month to year
SELECT
    Date.Year,
    SUM(TourismFactTable.CanadianTouristsReturningFromAbroad) AS CanadianTouristsReturningFromAbroad,
    SUM(TourismFactTable.Totalnon-residentTourists) AS Totalnon-residentTourists
FROM
    TourismFactTable
INNER JOIN
    Date ON TourismFactTable.Date_Key = Date.Date_Key
GROUP BY
    Date.Year;
WHERE
  (Location.location_key=TourismFactTable.location_key AND Location.location='Quebec' ) OR (Location.location_key=TourismFactTable.location_key AND Location.location='Ontario')


-- #3. Tourism: Dice, 1 province and within a certain date
SELECT
  *
FROM TourismFactTable table
WHERE Location.location_key=TourismFactTable.location_key AND Location.location='Quebec' 
  AND 121>Date.id>0


-- #4.Roll up City to Province on a specific date
SELECT
    location.location,
    AVG(weather.average_temperature) AS avg_temp_province,
    SUM(weather.rainfall) AS total_rainfall_province,
    SUM(weather.snowfall) AS total_snowfall_province
FROM
    Weather w
JOIN
    Locations l ON weather.location_key = location.location_Key;
GROUP BY
    location.location_Key;
Where date.id=1
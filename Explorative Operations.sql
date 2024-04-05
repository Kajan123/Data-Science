-- Iceberg Query
SELECT location, 
       MAX(population) - MIN(population) AS population_growth
FROM Location
GROUP BY location
ORDER BY population_growth DESC
LIMIT 5;

-- Windowing Query
SELECT year, location, AVG(max_temperature_v) AS avg_max_temp,
       AVG(max_temperature_v) - LAG(AVG(max_temperature_v)) OVER (PARTITION BY location ORDER BY year) AS temp_change
FROM WeatherInc
JOIN Date ON WeatherInc.Date_key = Date.Date_key
GROUP BY year, location
ORDER BY location, year;


-- Using the Window Clause
SELECT year, location, AVG(GDP) OVER (PARTITION BY location ORDER BY year ROWS BETWEEN 1 PRECEDING AND CURRENT ROW) as avg_gdp
FROM Economy
JOIN Location ON Economy.Location_key = Location.Location_key
JOIN Date ON Economy.Date_key = Date.Date_key
WHERE location = 'Canada';

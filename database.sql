CREATE TABLE DateDimension (
    Date_key INT PRIMARY KEY,
    date_iso DATE,
    date_yearmonth VARCHAR(7),
    year INT,
    month INT,
    day INT,
    day_of_week VARCHAR(50)
);

CREATE TABLE LocationDimension (
    Location_key INT PRIMARY KEY,
    location VARCHAR(255),
    Date_key INT,
    population INT,
    FOREIGN KEY (Date_key) REFERENCES DateDimension(Date_key)
);

CREATE TABLE EconomyDimension (
    Economy_key INT PRIMARY KEY,
    Location_key INT,
    Date_key INT,
    year INT,
    Sector VARCHAR(255),
    GDP FLOAT,
    GDP_per_capita FLOAT,
    GDP_growth_rate FLOAT,
    FOREIGN KEY (Location_key) REFERENCES LocationDimension(Location_key),
    FOREIGN KEY (Date_key) REFERENCES DateDimension(Date_key)
);

CREATE TABLE WeatherDimension (
    Weather_key INT PRIMARY KEY,
    Location_key INT,
    Date_key INT,
    Avg_temperature FLOAT,
    Min_temperature FLOAT,
    Max_temperature FLOAT,
    Precipitation_mm FLOAT,
    Snowfall_cm FLOAT,
    Snow_on_ground_cm FLOAT,
    Location VARCHAR(255),
    FOREIGN KEY (Location_key) REFERENCES LocationDimension(Location_key),
    FOREIGN KEY (Date_key) REFERENCES DateDimension(Date_key)
);

CREATE TABLE TourismFactTable (
    Date_key INT,
    Weather_key INT,
    Location_key INT,
    Economy_key INT,
    Total_non_resident_tourists INT,
    United_states_tourists INT,
    Non_US_foreign_tourists INT,
    Canadian_tourists_returning_from_US INT,
    Canadian_tourists_returning_from_abroad INT,
    Seasonally_adjusted BOOLEAN,
    FOREIGN KEY (Date_key) REFERENCES DateDimension(Date_key),
    FOREIGN KEY (Weather_key) REFERENCES WeatherDimension(Weather_key),
    FOREIGN KEY (Location_key) REFERENCES LocationDimension(Location_key),
    FOREIGN KEY (Economy_key) REFERENCES EconomyDimension(Economy_key)
);
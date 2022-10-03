CREATE SCHEMA IF NOT EXISTS station;

CREATE TABLE station.City(
    region text,
    name text,
    primary key (region, name)
);

CREATE TABLE station.Station(
    name text primary key,
    tracks int,
    city_region text,
    city_name text,

    FOREIGN KEY (city_region, city_name)
        REFERENCES station.City(region, name)

);

CREATE TABLE station.Train(
    trainNr serial primary key,
    length int,
    start_station text,
    end_station text,

    FOREIGN KEY (start_station)
        REFERENCES station.Station(name),

    FOREIGN KEY (end_station)
        REFERENCES station.Station(name)
);

CREATE TABLE station.Connected(
    departure date,
    arrival date,
    start_station text,
    end_station text,
    trainNr int REFERENCES station.Train(trainNr),

    FOREIGN KEY (start_station)
        REFERENCES station.Station(name),

    FOREIGN KEY (end_station)
        REFERENCES station.Station(name)
);
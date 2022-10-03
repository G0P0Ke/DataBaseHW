CREATE SCHEMA IF NOT EXISTS hospital;

CREATE TABLE hospital.Station(
    statNr serial primary key,
    name text
);

CREATE TABLE hospital.Room(
    roomNr serial primary key,
    beds int,
    station_id int,

    FOREIGN KEY (station_id)
        REFERENCES hospital.Station(statNr)
);

CREATE TABLE hospital.StationPersonell(
    persNr serial primary key,
    name text,
    station_id int,

    FOREIGN KEY (station_id)
        REFERENCES hospital.Station(statNr)
);

CREATE TABLE hospital.Caregiver(
    caregiver_id serial primary key,
    qualification text
);

CREATE TABLE hospital.Doctor(
    doctor_id serial primary key,
    rank text,
    area text
);

CREATE TABLE hospital.Patient(
    patientNr serial primary key,
    name text,
    disease text,
    treats int,

    FOREIGN KEY (treats)
        REFERENCES hospital.Doctor(doctor_id)
);

CREATE TABLE hospital.Admission(
    admission_from date,
    admission_to date,
    roomNr int,
    patientNr int,

    FOREIGN KEY (roomNr)
        REFERENCES hospital.Room(roomNr),

    FOREIGN KEY (patientNr)
        REFERENCES hospital.Patient(patientNr)
);
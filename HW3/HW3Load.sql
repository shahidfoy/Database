/* 
Mohammad Shahid Foy
Homework3
CS 3810
Mrs. Cohen
*/
   
/* T - 100 Segment US Carrier */
/* Destination */
CREATE TEMP TABLE tmp_table 
AS
SELECT * 
FROM Destination;

COPY tmp_table
FROM 'C:\DatabaseHW\Destination.csv' DELIMITER ',' CSV HEADER;

INSERT INTO Destination
SELECT *
FROM tmp_table
ON CONFLICT DO NOTHING;

DROP TABLE tmp_table;

/* Origin */
CREATE TEMP TABLE tmp_table 
AS
SELECT * 
FROM Origin;

COPY tmp_table
FROM 'C:\DatabaseHW\Origin.csv' DELIMITER ',' CSV HEADER;

INSERT INTO Origin
SELECT *
FROM tmp_table
ON CONFLICT DO NOTHING;

DROP TABLE tmp_table;

/* Carrier */
CREATE TEMP TABLE tmp_table 
AS
SELECT * 
FROM Carrier;

COPY tmp_table
FROM 'C:\DatabaseHW\Carrier.csv' DELIMITER ',' CSV HEADER;

INSERT INTO Carrier
SELECT *
FROM tmp_table
ON CONFLICT DO NOTHING;

DROP TABLE tmp_table;

/* CarrierInfo */
CREATE TEMP TABLE tmp_table 
AS
SELECT * 
FROM CarrierInfo;

COPY tmp_table
FROM 'C:\DatabaseHW\Carrier_info.csv' DELIMITER ',' CSV HEADER;

INSERT INTO CarrierInfo
SELECT *
FROM tmp_table
ON CONFLICT DO NOTHING;

DROP TABLE tmp_table;

/* AircraftInfo */
CREATE TEMP TABLE tmp_table 
AS
SELECT * 
FROM AircraftInfo;

COPY tmp_table
FROM 'C:\DatabaseHW\Aircraft_info.csv' DELIMITER ',' CSV HEADER;

INSERT INTO AircraftInfo
SELECT *
FROM tmp_table
ON CONFLICT DO NOTHING;

DROP TABLE tmp_table;

/* Departures */
CREATE TEMP TABLE tmp_table 
AS
SELECT * 
FROM Departures;

COPY tmp_table
FROM 'C:\DatabaseHW\Departures.csv' DELIMITER ',' CSV HEADER;

INSERT INTO Departures
SELECT *
FROM tmp_table
ON CONFLICT DO NOTHING;

DROP TABLE tmp_table;

/* Class */
CREATE TEMP TABLE tmp_table 
AS
SELECT * 
FROM Class;

COPY tmp_table
FROM 'C:\DatabaseHW\Class.csv' DELIMITER ',' CSV HEADER;

INSERT INTO Class
SELECT *
FROM tmp_table
ON CONFLICT DO NOTHING;

DROP TABLE tmp_table;

/* DateInfo */
CREATE TEMP TABLE tmp_table 
AS
SELECT * 
FROM DateInfo;

COPY tmp_table
FROM 'C:\DatabaseHW\Date_info.csv' DELIMITER ',' CSV HEADER;

INSERT INTO DateInfo
SELECT *
FROM tmp_table
ON CONFLICT DO NOTHING;

DROP TABLE tmp_table;

/* Flights */
COPY Flights
FROM 'C:\DatabaseHW\Flights.csv' DELIMITER ',' CSV HEADER;

/* Carrier Decode */
/* AirlineCarrier */
CREATE TEMP TABLE tmp_table 
AS
SELECT * 
FROM AirlineCarrier;

COPY tmp_table
FROM 'C:\DatabaseHW\Airline_carrier.csv' DELIMITER ',' CSV HEADER;

INSERT INTO AirlineCarrier
SELECT *
FROM tmp_table
ON CONFLICT DO NOTHING;

DROP TABLE tmp_table;

/* DecodeInfo */
CREATE TEMP TABLE tmp_table 
AS
SELECT * 
FROM DecodeInfo;

COPY tmp_table
FROM 'C:\DatabaseHW\Decode_info.csv' DELIMITER ',' CSV HEADER;

INSERT INTO DecodeInfo
SELECT *
FROM tmp_table
ON CONFLICT DO NOTHING;

DROP TABLE tmp_table;

/* DateSource */
CREATE TEMP TABLE tmp_table 
AS
SELECT * 
FROM DateSource;

COPY tmp_table
FROM 'C:\DatabaseHW\Date_source.csv' DELIMITER ',' CSV HEADER;

INSERT INTO DateSource
SELECT *
FROM tmp_table
ON CONFLICT DO NOTHING;

DROP TABLE tmp_table;

/* CarrierDecode */
COPY CarrierDecode
FROM 'C:\DatabaseHW\CarrierDecode.csv' DELIMITER ',' CSV HEADER;

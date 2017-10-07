/* T - 100 Segment US Carrier  will need to update this soon */
/* Airport Destination */
CREATE TEMP TABLE tmp_table 
AS
SELECT * 
FROM Airport;

COPY tmp_table
FROM 'C:\DatabaseHW\Destination_Airport.csv' DELIMITER ',' CSV HEADER;

INSERT INTO Airport
SELECT *
FROM tmp_table
ON CONFLICT DO NOTHING;

DROP TABLE tmp_table;

/* Airport Origin */
CREATE TEMP TABLE tmp_table 
AS
SELECT * 
FROM Airport;

COPY tmp_table
FROM 'C:\DatabaseHW\Origin_Airport.csv' DELIMITER ',' CSV HEADER;

INSERT INTO Airport
SELECT *
FROM tmp_table
ON CONFLICT DO NOTHING;

DROP TABLE tmp_table;

/* Destination StateInfo */
CREATE TEMP TABLE tmp_table 
AS
SELECT * 
FROM StateInfo;

COPY tmp_table
FROM 'C:\DatabaseHW\Destination_StateInfo.csv' DELIMITER ',' CSV HEADER;

INSERT INTO StateInfo
SELECT *
FROM tmp_table
ON CONFLICT DO NOTHING;

DROP TABLE tmp_table;

/* Origin StateInfo */
CREATE TEMP TABLE tmp_table 
AS
SELECT * 
FROM StateInfo;

COPY tmp_table
FROM 'C:\DatabaseHW\Origin_StateInfo.csv' DELIMITER ',' CSV HEADER;

INSERT INTO StateInfo
SELECT *
FROM tmp_table
ON CONFLICT DO NOTHING;

DROP TABLE tmp_table;

/* TravelInfo */
CREATE TEMP TABLE tmp_table 
AS
SELECT * 
FROM TravelInfo;

COPY tmp_table
FROM 'C:\DatabaseHW\TravelInfo.csv' DELIMITER ',' CSV HEADER;

INSERT INTO TravelInfo
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

/* CarrierGroup */
CREATE TEMP TABLE tmp_table 
AS
SELECT * 
FROM CarrierGroup;

COPY tmp_table
FROM 'C:\DatabaseHW\CarrierGroup.csv' DELIMITER ',' CSV HEADER;

INSERT INTO CarrierGroup
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
FROM 'C:\DatabaseHW\CarrierInfo.csv' DELIMITER ',' CSV HEADER;

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
FROM 'C:\DatabaseHW\AircraftInfo.csv' DELIMITER ',' CSV HEADER;

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
FROM 'C:\DatabaseHW\DateInfo.csv' DELIMITER ',' CSV HEADER;

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

/* AirlineCarrierGroup */
CREATE TEMP TABLE tmp_table 
AS
SELECT * 
FROM AirlineCarrierGroup ;

COPY tmp_table
FROM 'C:\DatabaseHW\AirlineCarrierGroup.csv' DELIMITER ',' CSV HEADER;

INSERT INTO AirlineCarrierGroup 
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
FROM 'C:\DatabaseHW\DateSource.csv' DELIMITER ',' CSV HEADER;

INSERT INTO DateSource
SELECT *
FROM tmp_table
ON CONFLICT DO NOTHING;

DROP TABLE tmp_table;

/* WAC */
CREATE TEMP TABLE tmp_table 
AS
SELECT * 
FROM WAC;

COPY tmp_table
FROM 'C:\DatabaseHW\WAC.csv' DELIMITER ',' CSV HEADER;

INSERT INTO WAC
SELECT *
FROM tmp_table
ON CONFLICT DO NOTHING;

DROP TABLE tmp_table;

/* CarrierDecode */
COPY CarrierDecode
FROM 'C:\DatabaseHW\CarrierDecode.csv' DELIMITER ',' CSV HEADER;

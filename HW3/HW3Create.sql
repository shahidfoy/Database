/* T - 100 Segment US Carrier */
CREATE TABLE Airport (
	airport_id INT NOT NULL,
	airport_sequence INT NOT NULL,
	market_id INT NOT NULL,
	city VARCHAR(32) NOT NULL,
	state VARCHAR(2) NOT NULL,
	PRIMARY KEY (airport_id)
);

CREATE TABLE TravelInfo (
	destination VARCHAR(3) NOT NULL,
	origin VARCHAR(3) NOT NULL,
	PRIMARY KEY(destination, origin)
);

CREATE TABLE StateInfo (
	state_fips INT NOT NULL,
	state_name VARCHAR(32) NOT NULL,
	wac INT NOT NULL,
	PRIMARY KEY(wac)
);

CREATE TABLE Carrier (
	unique_carrier VARCHAR(10) NOT NULL,
	airline_id INT NOT NULL,
	unique_carrier_name VARCHAR(64) NOT NULL,
	carrier_entity VARCHAR(10),
	region VARCHAR(1),	
	PRIMARY KEY (airline_id)
);

CREATE TABLE CarrierGroup (
	carrier VARCHAR(10),
	carrier_name VARCHAR(64),
	carrier_group INT,
	carrier_group_new INT,
	PRIMARY KEY (carrier_name)
);

CREATE TABLE CarrierInfo (
	carrier_id INT PRIMARY KEY NOT NULL,
	payload INT,
	seats INT,
	passengers INT,
	freight INT,
	mail INT,
	distance INT,
	ramp_to_ramp INT,
	air_time INT
);

CREATE TABLE AircraftInfo (
	aircraft_group INT NOT NULL,
	aircraft_type INT NOT NULL,
	aircraft_config INT NOT NULL,
	PRIMARY KEY (aircraft_type)
);

CREATE TABLE Departures (
	departures_scheduled INT NOT NULL,
	departures_performed INT NOT NULL,
	PRIMARY KEY (departures_scheduled, departures_performed)
);

CREATE TABLE Class (
	distance_group INT NOT NULL,
	class VARCHAR(1) NOT NULL,
	PRIMARY KEY (distance_group, class)
);

CREATE TABLE DateInfo (
	year INT NOT NULL,
	quarter INT NOT NULL,
	month INT NOT NULL,
	PRIMARY KEY (year, quarter, month)
);

CREATE TABLE Flights (
	flight_id INT PRIMARY KEY NOT NULL,
	airport_id INT references Airport(airport_id),
	airline_id INT references Carrier(airline_id),
	carrier_name VARCHAR(64) references CarrierGroup(carrier_name),
	carrier_id INT references CarrierInfo(carrier_id),
	aircraft_type INT references AircraftInfo(aircraft_type),
	departures_scheduled INT NOT NULL,
	departures_performed INT NOT NULL,
	distance_group INT NOT NULL,
	class VARCHAR(1) NOT NULL,
	year INT NOT NULL,
	quarter INT NOT NULL,
	month INT NOT NULL,
	destination VARCHAR(3) NOT NULL,
	origin VARCHAR(3) NOT NULL,
	wac INT references StateInfo(wac),
	FOREIGN KEY (departures_scheduled, departures_performed) REFERENCES Departures(departures_scheduled, departures_performed),
	FOREIGN KEY (distance_group, class) REFERENCES Class(distance_group, class),
	FOREIGN KEY (year, quarter, month) REFERENCES DateInfo(year, quarter, month),
	FOREIGN KEY (destination, origin) REFERENCES TravelInfo(destination, origin)
);

/* Carrier Decode */
CREATE TABLE AirlineCarrier (
	airline_id INT,
	carrier VARCHAR(3),
	carrier_entity VARCHAR(10),
	carrier_name VARCHAR(128),
	unique_carrier VARCHAR(10),
	unique_carrier_entity VARCHAR(10),
	unique_carrier_name VARCHAR(128),
	PRIMARY KEY (airline_id)
);

CREATE TABLE DecodeInfo (
	wac INT,
	carrier_group INT,
	carrier_group_new INT,
	region VARCHAR(32),
	PRIMARY KEY (wac, carrier_group, carrier_group_new, region)
);

CREATE TABLE DateSource (
	date_source_id INT,
	start_date_source DATE,
	thru_date_source DATE,
	PRIMARY KEY (date_source_id)
);

CREATE TABLE CarrierDecode (
	carrier_decode_id INT PRIMARY KEY,
	airline_id INT references AirlineCarrier(airline_id),
	wac INT,
	carrier_group INT,
	carrier_group_new INT,
	region VARCHAR(32),
	date_source_id INT references DateSource(date_source_id),
	FOREIGN KEY (wac, carrier_group, carrier_group_new, region) REFERENCES DecodeInfo (wac, carrier_group, carrier_group_new, region)
);

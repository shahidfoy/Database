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
	destination_airport_id INT NOT NULL references Airport(airport_id),
	destination VARCHAR(3) NOT NULL,
	origin_airport_id INT NOT NULL references Airport(airport_id),
	origin VARCHAR(3) NOT NULL,
	PRIMARY KEY(destination_airport_id, destination, origin_airport_id, origin)
);

CREATE TABLE StateInfo (
	airport_id INT NOT NULL references Airport(airport_id),
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
	airline_id INT NOT NULL references Carrier(airline_id),
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
	destination_airport_id INT NOT NULL,
	destination VARCHAR(3) NOT NULL,
	origin_airport_id INT NOT NULL,
	origin VARCHAR(3) NOT NULL,
	FOREIGN KEY (departures_scheduled, departures_performed) REFERENCES Departures(departures_scheduled, departures_performed),
	FOREIGN KEY (distance_group, class) REFERENCES Class(distance_group, class),
	FOREIGN KEY (year, quarter, month) REFERENCES DateInfo(year, quarter, month),
	FOREIGN KEY (destination_airport_id, destination, origin_airport_id, origin) REFERENCES TravelInfo(destination_airport_id, destination, origin_airport_id, origin)
);

/* Carrier Decode */
CREATE TABLE AirlineCarrier (
	unique_carrier VARCHAR(10),
	airline_id INT,
	unique_carrier_name VARCHAR(128),
	carrier_entity VARCHAR(10),
	region VARCHAR(32),
	PRIMARY KEY (airline_id)
);

CREATE TABLE AirlineCarrierGroup (
	carrier VARCHAR(3),
	carrier_name VARCHAR(128),
	unique_carrier_entity VARCHAR(10),
	carrier_group INT,
	carrier_group_new INT,
	PRIMARY KEY (unique_carrier_entity)
);

CREATE TABLE DateSource (
	date_source_id INT,
	start_date_source DATE,
	thru_date_source DATE,
	PRIMARY KEY (date_source_id)
);

CREATE TABLE WAC (
	wac INT NOT NULL,
	PRIMARY KEY (wac)
);


CREATE TABLE CarrierDecode (
	carrier_decode_id INT PRIMARY KEY,
	airline_id INT references AirlineCarrier(airline_id),	
	unique_carrier_entity VARCHAR(10),
	date_source_id INT references DateSource(date_source_id),
	wac INT references WAC(wac),
	FOREIGN KEY (unique_carrier_entity) REFERENCES AirlineCarrierGroup (unique_carrier_entity)
);

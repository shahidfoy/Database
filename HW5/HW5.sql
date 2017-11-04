CREATE TABLE Customer (
	customer_id SERIAL NOT NULL,
	first_name VARCHAR(32) NOT NULL,
	last_name VARCHAR(32) NOT NULL,
	PRIMARY KEY (customer_id)
);

CREATE TABLE PhoneNumber (
	phone_id SERIAL NOT NULL,
	customer_id INT NOT NULL references Customer(customer_id),
	country_code INT,
	area_code INT,
	local_number INT,
	PRIMARY KEY (phone_id)
);

CREATE TABLE MailingAddress (
	mail_id SERIAL NOT NULL,
	customer_id INT NOT NULL references Customer(customer_id),
	street VARCHAR(126) NOT NULL,
	city VARCHAR(64) NOT NULL,
	state VARCHAR(64) NOT NULL,
	postal_code INT NOT NULL,
	country VARCHAR(64) NOT NULL,
	PRIMARY KEY (mail_id)
);

CREATE TABLE Email (
	email_id SERIAL NOT NULL,
	email VARCHAR(64),
	customer_id INT NOT NULL references Customer(customer_id),
	PRIMARY KEY (email_id)
);

CREATE TABLE Airline (
	Airline_code SERIAL NOT NULL,
	Airline_name VARCHAR(128) NOT NULL,
	Airline_country VARCHAR(64) NOT NULL,
	PRIMARY KEY (Airline_code)
);

CREATE TABLE FlightInfo (
	unique_flight_number SERIAL NOT NULL,
	origin_city VARCHAR(64) NOT NULL,
	destination_city VARCHAR(64) NOT NULL,
	length_of_flight TIME NOT NULL,
	Airline_code INT NOT NULL references Airline(Airline_code),
	PRIMARY KEY (unique_flight_number)
);

CREATE TABLE Booking (
	unique_booking_number SERIAL NOT NULL,
	city_code VARCHAR(64) NOT NULL,
	booking_date DATE NOT NULL,
	flight_number INT NOT NULL references FlightInfo(unique_flight_number),
	departure_time TIME,
	departure_date DATE,
	arrival_time TIME,
	arrival_date DATE,
	customer_id INT NOT NULL references Customer(customer_id),
	paying_customer_fname VARCHAR(32),
	paying_customer_lname VARCHAR(32),
	PRIMARY KEY (unique_booking_number)
);

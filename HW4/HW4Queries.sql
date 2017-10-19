/*
Mohammad Shahid Foy
Homework4
CS 3810
Mrs. Cohen

A) Write 4 SQL queries. The advantage to this assignment is that by sort, slice & dice of the original spreadsheet,
you should be able to get the answers and verify against your queries.

1) How many passengers departed Colorado on all airlines? Display the following information in this format:
Complete city name, complete state name (not the 2 character abbreviation), Airport name, Airport code (the 3
character code), the complete airline name, and the number of passengers.
*/
SELECT DISTINCT Airport.city AS city_name, StateInfo.state_name AS state_name,
Carrier.unique_carrier_name AS airline_name, Flights.passengers AS passengers
FROM Airport
INNER JOIN Flights
ON Airport.airport_id = Flights.origin_airport_id 
INNER JOIN StateInfo 
ON Airport.airport_id = StateInfo.airport_id 
INNER JOIN Carrier
ON Flights.airline_id = Carrier.airline_id
WHERE StateInfo.state_name = 'Colorado'
GROUP BY city_name, state_name, airline_name, passengers;

/*
2) Same information and format but freight, not passengers
*/
SELECT DISTINCT Airport.city AS city_name, StateInfo.state_name AS state_name,
Carrier.unique_carrier_name AS airline_name, Flights.freight AS freight
FROM Airport
INNER JOIN Flights
ON Airport.airport_id = Flights.origin_airport_id 
INNER JOIN StateInfo 
ON Airport.airport_id = StateInfo.airport_id 
INNER JOIN Carrier
ON Flights.airline_id = Carrier.airline_id
WHERE StateInfo.state_name = 'Colorado';

/*
3) How many passengers arrived in Colorado from outside Colorado? Display the following information in
this format:
Origin city name & state, destination city in colorado, airline name
*/
SELECT DISTINCT TravelInfo.origin_city AS origin_city_name, StateInfo.state_name AS origin_state_name, TravelInfo.destination_city AS destination_city, 
Flights.carrier_name AS airline_name
FROM Flights
INNER JOIN TravelInfo 
ON Flights.origin_airport_id = TravelInfo.origin_airport_id 
LEFT OUTER JOIN StateInfo 
ON Flights.origin_airport_id = StateInfo.airport_id 
WHERE 
StateInfo.state_name != 'Colorado';

/*
4) List all the flights into Denver that the distance was between 500 and 1200 miles. Display the following
information:
Origin city and state, airline name
*/
SELECT DISTINCT TravelInfo.origin_city AS origin_city_name, Airport.state AS origin_state_name, Flights.carrier_name AS airline_name
FROM
Flights
INNER JOIN TravelInfo 
ON Flights.origin_airport_id = TravelInfo.origin_airport_id 
LEFT OUTER JOIN Airport
ON Airport.airport_id = Flights.origin_airport_id
WHERE TravelInfo.destination = 'DEN' AND Flights.distance >= 500 AND Flights.distance <= 1200;


/*
B) Write a PL/pgSQL stored procedure that analyzes the various flights of the airlines. The report should display:
Airline name, total number of flights, average distance, ratio of passengers to distance, ratio of freight to
distance, correlation coefficient for passengers to freight, correlation coefficient for passengers to distance.		
*/
CREATE OR REPLACE FUNCTION flight_information(airline_carrier_name varchar(64))
RETURNS TABLE (
	carrier character varying(64),
	departures_performed bigint,
	distance numeric,
	ratio1 numeric,
	ratio2 numeric,
	corr1 double precision,
	corr2 double precision
) AS $$
BEGIN
	RETURN QUERY
	SELECT DISTINCT 
	Carrier.unique_carrier_name,
	sum(Flights.departures_performed), 
	avg(Flights.distance),
	1.0 * sum(Flights.passengers) / sum(Flights.distance),
	1.0 * sum(Flights.freight) / sum(Flights.distance),
	corr(Flights.passengers, Flights.freight),
	corr(Flights.passengers, Flights.distance)
	FROM Flights
	INNER JOIN Carrier
	ON Flights.airline_id = Carrier.airline_id
	WHERE Carrier.unique_carrier_name = airline_carrier_name
	GROUP BY Carrier.unique_carrier_name;
END;
$$ LANGUAGE plpgsql VOLATILE;

SELECT flight_information('JetBlue Airways');
SELECT flight_information('Virgin America');
SELECT flight_information('Tradewind Aviation');
SELECT flight_information('Aerodynamics Inc. d/b/a SkyValue d/b/a SkyValue Airways');
SELECT flight_information('Ameristar Air Cargo');
SELECT flight_information('Allegiant Air');
SELECT flight_information('Avjet Corporation');
SELECT flight_information('American Airlines Inc.');
SELECT flight_information('Delta Air Lines Inc.');
SELECT flight_information('Miami Air International');
SELECT flight_information('United Air Lines Inc.');
SELECT flight_information('Southwest Airlines Co.');
SELECT flight_information('Jet Aviation Flight Services, Inc.');
SELECT flight_information('Omni Air International LLC');
SELECT flight_information('Swift Air, LLC');
SELECT flight_information('Kalitta Charters II');
SELECT flight_information('CFM Inc d/b/a Contour Airlines');
SELECT flight_information('Sun Country Airlines d/b/a MN Airlines');
SELECT flight_information('USA Jet Airlines Inc.');
SELECT flight_information('Southern Air Inc.');
SELECT flight_information('Alaska Airlines Inc.');
SELECT flight_information('Trans States Airlines');
SELECT flight_information('Peninsula Airways Inc.');
SELECT flight_information('Great Lakes Airlines');
SELECT flight_information('Boutique Air');
SELECT flight_information('GoJet Airlines LLC d/b/a United Express');
SELECT flight_information('SkyWest Airlines Inc.');
SELECT flight_information('Republic Airlines');
SELECT flight_information('Frontier Airlines Inc.');
SELECT flight_information('Federal Express Corporation');
SELECT flight_information('Spirit Air Lines');
SELECT flight_information('Mesa Airlines Inc.');
SELECT flight_information('Envoy Air');
SELECT flight_information('ExpressJet Airlines Inc.');
SELECT flight_information('United Parcel Service');
SELECT flight_information('Endeavor Air Inc.');
SELECT flight_information('Compass Airlines');
SELECT flight_information('Via Airlines d/b/a Charter Air Transport');
SELECT flight_information('Horizon Air');
SELECT flight_information('Empire Airlines Inc.');

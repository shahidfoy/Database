/*

Mohammad Shahid Foy
Homework 4
CS 3810
Mrs. Cohen

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

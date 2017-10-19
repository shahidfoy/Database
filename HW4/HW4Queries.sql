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

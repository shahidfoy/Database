<?php

	function insertFlightInfo($origin_city, $destination_city, $length_of_flight, $airline) {
		$dbconn = openConnection();

		$airline_query = pg_query_params($dbconn, 'SELECT airline_code FROM airline WHERE Airline_name=$1 LIMIT 1', array($airline));

		$airline_row = pg_fetch_assoc($airline_query);
		$airline_code = $airline_row['airline_code'];

		$result = pg_query_params($dbconn, 'INSERT INTO flightinfo (origin_city, destination_city, length_of_flight, Airline_code) VALUES ($1, $2, $3, $4) RETURNING unique_flight_number', array($origin_city, $destination_city, $length_of_flight, $airline_code));

		$result_row = pg_fetch_array($result);

		pg_close();

		return $result_row['0'];
	}

	function insertBooking($city, $flight_num, $customer_id) {
		$dbconn = openConnection();

		$timestamp = time();
		$date_of_purchase = date("Y-m-d", $timestamp);

		$departure_date = time() + 604800;
		$departure_date = date("Y-m-d", $departure_date);
		$departure_time = "10:00:00";

		$arrival_date = time() + 804800;
		$arrival_date = date("Y-m-d", $arrival_date);
		$arrival_time = "17:00:00";

		$get_customer_info = pg_query_params($dbconn, 'SELECT first_name, last_name FROM customer WHERE customer_id=$1 LIMIT 1', array($customer_id));

		$customer_info_result = pg_fetch_assoc($get_customer_info);
		$first_name = $customer_info_result['first_name'];
		$last_name = $customer_info_result['last_name'];
		

		$result = pg_query_params($dbconn, 'INSERT INTO booking (city_code, booking_date, flight_number, departure_time, departure_date, arrival_time, arrival_date, customer_id, paying_customer_fname, paying_customer_lname) VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10) RETURNING unique_booking_number', array($city, $date_of_purchase, $flight_num, $departure_time, $departure_date, $arrival_time, $arrival_date, $customer_id, $first_name, $last_name));

		$result_row = pg_fetch_array($result);

		pg_close();

		return $result_row['0'];
	}
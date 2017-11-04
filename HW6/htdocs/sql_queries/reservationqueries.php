<?php

	function displayFlightInfo($flight_num) {
		$dbconn = openConnection();
		$result = pg_query_params($dbconn, 'SELECT * FROM flightinfo WHERE unique_flight_number=$1 LIMIT 1', 
			array($flight_num));

		$result_row = pg_fetch_assoc($result);
		pg_close();

		return $result_row;
	}

	function displayBooking($booking_num) {
		$dbconn = openConnection();
		$result = pg_query_params($dbconn, 'SELECT * FROM booking WHERE unique_booking_number=$1 LIMIT 1', 
			array($booking_num));

		$result_row = pg_fetch_assoc($result);
		pg_close();

		return $result_row;
	}

	function displayCustomer($customer_id) {
		$dbconn = openConnection();
		$result = pg_query_params($dbconn, 'SELECT * FROM customer WHERE customer_id=$1 LIMIT 1', 
			array($customer_id));

		$result_row = pg_fetch_assoc($result);
		pg_close();

		return $result_row;
	}
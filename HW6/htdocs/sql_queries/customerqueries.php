<?php

function insertCustomer($first_name, $last_name) {
	$dbconn = openConnection();

	$query = pg_query_params($dbconn, 'INSERT INTO customer (first_name, last_name) VALUES($1, $2)', array($first_name, $last_name));

	$result = pg_query_params($dbconn, 'SELECT customer_id FROM customer WHERE first_name=$1 AND last_name=$2 ORDER BY customer_id DESC LIMIT 1', array($first_name, $last_name));

	$resultRow = pg_fetch_assoc($result);
	pg_close();

	return $resultRow['customer_id'];
}


function insertAddress($customer_id, $street, $city, $state, $zipcode, $country) {
	$dbconn = openConnection();

	$query = pg_query_params($dbconn, 'INSERT INTO mailingaddress (customer_id, street, city, state, postal_code, country) VALUES($1, $2, $3, $4, $5, $6)', array($customer_id, $street, $city, $state, $zipcode, $country));

	pg_close();
}

function insertPhoneNumber($customer_id, $phone_country_code, $phone_area_code, $phone_local_code) {
	$dbconn = openConnection();
	$query = pg_query_params($dbconn, 'INSERT INTO phonenumber (customer_id, country_code, area_code, local_number) VALUES($1, $2, $3, $4)', array($customer_id, $phone_country_code, $phone_area_code, $phone_local_code));
	pg_close();
}

function insertEmail($email, $customer_id) {
	$dbconn = openConnection();
	$query = pg_query_params($dbconn, 'INSERT INTO email (email, customer_id) VALUES($1, $2)', array($email, $customer_id));
	pg_close();
}


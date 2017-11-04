<?php

include("inc/connection.php");
include("sql_queries/reservationqueries.php");
	

	if(isset($_GET['cust']) && isset($_GET['flightnum']) && isset($_GET['bookingnum']) && isset($_GET['airline'])) {
		$customer_id = $_GET['cust'];
		$flight_num = $_GET['flightnum'];
		$booking_num = $_GET['bookingnum'];
		$airline = $_GET['airline'];
	} else {
		header("Location: index.php");
	}

	$customer = displayCustomer($customer_id);
	$flight_information = displayFlightInfo($flight_num);
	$booking_information = displayBooking($booking_num);

	$confirmation = "Name: ".$customer['first_name']. " " .$customer['last_name'] . "\n";
	$confirmation .= "Flight Number: " .$flight_information['unique_flight_number']. "\n";
	$confirmation .= "Origin City: " .$flight_information['origin_city']. " to ";
	$confirmation .= "Destination City: " .$flight_information['destination_city']. "\n";
	$confirmation .= "Airline: " .$airline. "\n";
	$confirmation .= "Booking number id: " .$booking_num. "\n";
	$confirmation .= "Date booked: " .$booking_information['booking_date']. "\n";
	$confirmation .= "Departure Date: " .$booking_information['departure_date']. " ";
	$confirmation .= "Departure Time: " .$booking_information['departure_time']. "\n";
	$confirmation .= "Arrival Date: " .$booking_information['arrival_date']. " ";
	$confirmation .= "Arrival Time: " .$booking_information['arrival_time']. "\n";

	$file = fopen("HW6.flight", "a");
	fwrite($file, $confirmation ."\n\n");
	fclose($file);
?>

<!DOCTYPE html>
<html>
<head>
	<title>Confirmation</title>

</head>
<body>
	<link rel='stylesheet' href='bootstrap/css/bootstrap.min.css'>
	<link rel='stylesheet' href='css/main.css'>

	<div class="container">
		<br>

		<?php
		 if(isset($errorMsg)) echo '<div class="bg-warning" style="border-radius: 5px; width: 55%;">                   
                            <p class="text-muted" style="padding-left: 15px;"><b> ' . $errorMsg . '</b></p>
                            </div><br>';
		?>

		<div class="card" style="width: 55%">

			<img class="card-img-top" src="img/plain-background.png">
			<div class="card-body">
				<h2 class="card-title">Flight Confirmation</h2>
				<hr>
				<p>
				<?php
					$customer = displayCustomer($customer_id);
					$flight_information = displayFlightInfo($flight_num);
					$booking_information = displayBooking($booking_num);

					$confirmation = "<strong>Name: </strong>".$customer['first_name']. " " 
						.$customer['last_name'] . "<br>";
					$confirmation .= "<strong>Flight Number:</strong> " 
						.$flight_information['unique_flight_number']. "<br>";
					$confirmation .= "<strong>Origin City:</strong> " 
						.$flight_information['origin_city']. " <br> ";
					$confirmation .= "<strong>Destination City:</strong> " 
						.$flight_information['destination_city']. "<br>";
					$confirmation .= "<strong>Airline:</strong> " 
						.$airline. "<br>";
					$confirmation .= "<strong>Booking number id:</strong> " 
						.$booking_num. "<br>";
					$confirmation .= "<strong>Date booked:</strong> " 
						.$booking_information['booking_date']. "<br>";
					$confirmation .= "<strong>Departure Date:</strong> " 
						.$booking_information['departure_date']. " ";
					$confirmation .= "<strong>Departure Time:</strong> " 
						.$booking_information['departure_time']. "<br>";
					$confirmation .= "<strong>Arrival Date:</strong> " 
						.$booking_information['arrival_date']. " ";
					$confirmation .= "<strong>Arrival Time:</strong> " 
						.$booking_information['arrival_time']. "<br>";
					
					echo "".$confirmation."";
				?>
				</p>
			</div>
		</div>
	</div>

	<script src='bootstrap/js/bootstrap.min.js'></script>
</body>
</html>
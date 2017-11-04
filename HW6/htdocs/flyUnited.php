<?php
	
include("inc/connection.php");
include("sql_queries/bookingqueries.php");

	if(isset($_GET['cust']) && isset($_GET['city'])) {
		$customer_id = $_GET['cust'];
		$city = $_GET['city'];
		$url = "flyUnited.php?cust=".$customer_id."&city=".$city."";
	} else {
		header("Location: index.php");
	}

	if(isset($_POST['submit']) && isset($_POST['City'])) {
		$errorMsg .= $_POST['City'];
		$destcity = $_POST['City'];
		$airline = "BRITISH";


		$length_of_flight = "12:00:00";
		$flight_num = insertFlightInfo($city, $destcity, $length_of_flight, $airline);
		$booking_num = insertBooking($city, $flight_num, $customer_id);

		header("Location: confirmation.php?cust=$customer_id&flightnum=$flight_num&bookingnum=$booking_num&airline=$airline");
		
	}
?>

<!DOCTYPE html>
<html>
<head>
	<title>Select Flight</title>

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

			<div class="card-body">
			<img class="card-img-top" src="img/united.png">
			<h2 class="card-title">Select a Flight: Destination City</h2>
				<form action="<?php echo $url; ?>" method="POST">
					<div class="form-group">
						<div class="text-center">
							<label class="mr-sm-2" for="citySelect">Select Destination City</label>
							<select class="custom-select" name="City" id="citySelect">
								<option value="New York" selected>New York</option>
								<option value="Chicago">Chicago</option>
								<option value="London">London</option>
								<option value="Edinburgh">Edinburgh</option>
								<option value="Paris">Paris</option>
								<option value="Nice">Nice</option>
								<option value="Toronto">Toronto</option>
								<option value="Montreal">Montreal</option>
							</select>
							<br><br>
							<button type="submit" name="submit" class="btn btn-primary btn-lg btn-block">Submit</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>

	<script src='bootstrap/js/bootstrap.min.js'></script>
</body>
</html>
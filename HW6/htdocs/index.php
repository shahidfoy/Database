<?php

include("inc/connection.php");
include("sql_queries/customerqueries.php");

$first_name = $_POST["first_name"];
$last_name = $_POST["last_name"];
$street = $_POST["street"];
$city = $_POST["city"];
$state = $_POST["state"];
$postal_code = $_POST["zipcode"];
$country = $_POST["country"];
$phone_country_code = $_POST["phone_country_code"];
$phone_area_code = $_POST["phone_area_code"];
$phone_local_code = $_POST["phone_local_code"];
$email = $_POST["email"];


if(isset($first_name) && isset($last_name) && isset($street) 
	&& isset($city) && isset($state) && isset($postal_code) 
	&& isset($country) && isset($phone_country_code) && 
	isset($phone_area_code) && isset($phone_local_code) 
	&& isset($email))
{

	$first_name = strip_tags($first_name);
	$last_name = strip_tags($last_name);
	$street = strip_tags($street);
	$city = strip_tags($city);
	$state = strip_tags($state);
	$postal_code = strip_tags($postal_code);
	$country = strip_tags($country);
	$phone_country_code = strip_tags($phone_country_code);
	$phone_area_code = strip_tags($phone_area_code);
	$phone_local_code = strip_tags($phone_local_code);
	$email = strip_tags($email);

	$errorMsg = "";

	if(strlen($first_name) <= 32 && strlen($lastname) <= 32) {
		
		if(strlen((string)$postal_code) == 5) {

			if(strlen((string)$phone_country_code) != 1 || strlen((string)$phone_area_code) != 3 || strlen((string)$phone_local_code) != 7) {
				$errorMsg .= " The phone number ".$phone_country_code."-".$phone_area_code."-".$phone_local_code." is incorrect: 
				The country code must be 1 digit long 
				The area code must be 3 digits long 
				The local code must be 7 digits long ";
			} else {
				$customer_id = insertCustomer($first_name, $last_name);
				insertAddress($customer_id, $street, $city, $state, $postal_code, $country);
				insertPhoneNumber($customer_id, $phone_country_code, $phone_area_code, $phone_local_code);
				insertEmail($email, $customer_id);

				$errorMsg .= "Customer Id: " . $customer_id;
				$errorMsg .= $first_name;
				$errorMsg .= $last_name;
				$errorMsg .= $street;
				$errorMsg .= $city;
				$errorMsg .= $state;
				$errorMsg .= $postal_code;
				$errorMsg .= $country;
				$errorMsg .= $phone_country_code;
				$errorMsg .= $phone_area_code;
				$errorMsg .= $phone_local_code;
				$errorMsg .= $email; 
				$errorMsg .= "  SUCCESS";

				header("Location: selectFlight.php?cust=$customer_id");
				exit();
			}
		
		} else {
			$errorMsg .= " Error: The Zipcode ".$postal_code." needs to be 5 digits";
		}

	} else {
		$errorMsg .= " Error: The First Name and Last Name ".$first_name." ".$last_name." must be within 32 characters ";

	}



} 

?>

<!DOCTYPE html>
<html>
<head>
	<title>User Data</title>
	
	<style>
		div.card {
			margin-left: auto;
    		margin-right: auto;
		}

		div.bg-warning {
			margin-left: auto;
    		margin-right: auto;
		}
		
	</style>
</head>
<body>

<link rel='stylesheet' href='bootstrap/css/bootstrap.min.css'>

<div class="container">
	<br>

	<?php
		if(isset($errorMsg)) echo '<div class="bg-warning" style="border-radius: 5px; width: 55%;">                   
                            <p class="text-muted" style="padding-left: 15px;"><b> ' . $errorMsg . '</b></p>
                            </div><br>';

        // writes errors to file
        $file = fopen("HW6.error", "a");
		fwrite($file, $errorMsg ."\n\n");
		fclose($file);
	?>


	<div class="card" style="width: 55%">

	<div class="card-header">
		<center><h2>User Data</h2></center>
	</div>
	<div class="card-body">
	<form action="index.php" method="POST">
		<div class="form-group">
			<label for="customerFName">First Name: </label>
			<input type="text" name="first_name" class="form-control" id="customerFName" placeholder="Enter your first name" value="<?php echo $first_name; ?>" required>
		</div>
		<div class="form-group">
			<label for="customerLName">Last Name: </label>
			<input type="text" name="last_name" class="form-control" id="customerLName" placeholder="Enter your last name" value="<?php echo $last_name; ?>" required>
		</div>
		<div class="form-group">
			<label for="customerAddress">Address: </label>
			<input type="text" name="street" class="form-control" id="customerAddress" placeholder="Enter Street Address" value="<?php echo $street; ?>" required>
		</div>
		<div class="form-group row">
			<div class="col">
				<label for="customerCity">City: </label>
				<input type="text" name="city" class="form-control" id="customerCity" placeholder="City" value="<?php echo $city; ?>" required>
			</div>
			<div class="col">
				<label for="customerState">State: </label>
				<input type="text" name="state" class="form-control" id="customerState" placeholder="State" value="<?php echo $state; ?>" required>
			</div>
			<div class="col">
				<label for="customerZipcode">
				Zip Code: </label>
				<input type="number" name="zipcode" class="form-control" id="customerZipcode" placeholder="Zipcode" value="<?php echo $postal_code; ?>" required>
			</div>
		</div>

		<div class="form-group">
			<label for="customerCountry">Country: </label>
			<input type="text" name="country" class="form-control" id="customerCountry" placeholder="Enter Country" value="<?php echo $country; ?>" required>
		</div>
		
		<div class="form-group row">
			<div class="col-sm">
				<h4>Phone Number </h4>
			</div>
			<div class="col-sm">
				<label for="phoneCountryCode">Country Code: </label>
				<input type="number" name="phone_country_code" class="form-control" id="phoneCountryCode" placeholder="0" value="<?php echo $phone_country_code; ?>" required>
			</div>
			<div class="col-sm">
				<label for="phoneAreaCode">Area Code: </label>
				<input type="number" name="phone_area_code" class="form-control" id="phoneAreaCode" placeholder="000" value="<?php echo $phone_area_code; ?>" required>
			</div>
			<div class="col-sm">
				<label for="phoneLocalCode">Local Code: </label>
				<input type="number" name="phone_local_code"  class="form-control" id="phoneLocalCode" placeholder="0000000" value="<?php echo $phone_local_code; ?>" required>
			</div>
		</div>
		<div class="form-group">
			<label for="customerEmail">Email: </label>
			<input type="email" name="email" class="form-control" id="customerEmail" placeholder="Enter your email" value="<?php echo $email; ?>" required>
		</div>

		<button type="submit" name="submit" class="btn btn-primary btn-lg btn-block">Submit</button>
	</form>
	</div>
	</div>

</div>

	<script src='bootstrap/js/bootstrap.min.js'></script>
</body>
</html>
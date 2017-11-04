<?php
	

	if(isset($_GET['cust'])) {
		$customer_id = $_GET['cust'];
		$url = "selectFlight.php?cust=".$customer_id."";
	} else {
		header("Location: index.php");
	}

	if(isset($_POST['submit']) && isset($_POST['City'])) {
		$errorMsg .= $_POST['City'] . " " . $customer_id;
		$city = $_POST['City'];

		if($city == "New York" || $city == "Chicago") {
			header("Location: flyUnited.php?cust=$customer_id&city=$city");
		} else if($city == "London" || $city == "Edinburgh" || $city == "Paris" || $city == "Nice") {
			header("Location: flyBritish.php?cust=$customer_id&city=$city");
		} else {
			header("Location: flyAirCan.php?cust=$customer_id&city=$city");
		}
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
<!--
			<div class="card-header">
				<center><h2>Select a Flight: Origin City</h2></center>
			</div>
			-->
			<img class="card-img-top" src="img/plain-background.png">
			<div class="card-body">
				<h2 class="card-title">Select a Flight: Origin City</h2>
				<form action="<?php echo $url; ?>" method="POST">
					<div class="form-group">
						<div class="text-center">
							<label class="mr-sm-2" for="citySelect">Select Origin City</label>
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
<html>
<head>
	<title>Bank Name</title>
    <!-- <?php include '/../includes/head.php'; ?> -->
		<?php include("{$_SERVER['DOCUMENT_ROOT']}/app/views/includes/head.php"); ?>

</head>
<body>
<?php
	global $errorMessage;
?>
<div id="main">
	<div class="valign-wrapper row login-box">
		<div class="col card hoverable s10 pull-s1 m6 pull-m3 l4 pull-l4">

		<div class="card-content">
			<div class="row">
			  <?php echo $errorMessage; ?>
				<form class="col s12" method="POST" action="/public/home/validate">
					<div class="row">
						<div class="input-field col s12 center">
							<h4><em>Bank of Canada</em></h4>
							<img src="https://techflourish.com/images/money-cliparts-15.jpg" alt="" height="100" width="120" >
						</div>
					</div>
					<div class="row">
						<div class="input-field col s12">
							<input id="card_number" name="ccn" type="text" class="validate">
							<label for="card_number">Card Number</label>
						</div>
					</div>
					<div class="row">
						<div class="input-field col s12">
							<input id="password" name="password" type="password" class="validate">
							<label for="password">Password</label>
						</div>
					</div>
					<button class="btn waves-effect waves-light" type="submit" name="login">Submit
						<i class="material-icons right"></i>
					</button>
					<div class="float-right mb-1">
							<span>Not a member?</span>
							<button type="submit" name="signUp" class="btn btn-primary" href="/UserRegistration/signUp">Sign Up</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
</div>
</body>
</html>

<html>
<head>
	<title>Bank Name</title>
    <!-- <?php include '/../includes/head.php'; ?> -->
		<?php include("{$_SERVER['DOCUMENT_ROOT']}/comp-353/app/views/includes/head.php"); ?>

</head>
<body>
<?php
	global $errorMessage;
?>
<div id="main">
    <div class="container">
        <div class="w-100 h-100">
            <div class="float-right mb-1">
                <span>Not a member?</span>
                <button type="submit" name="signUp" class="btn btn-primary" href="/UserRegistration/signUp">Sign Up</button>
            </div>
            <div class="card w-100 text-center">
                <div class="card-body">
                    <h5 class="card-title">Bank Name</h5>
                    <h6 class="card-subtitle mb-2 text-muted">Bank Slogan</h6>

                    <?php echo $errorMessage; ?>
                    <form method="post" action="/public/home/validate">
                        <div class="form-group">
                            <label for="ccn">Client Card Number</label>
                            <input type="text" name="ccn" />
                        </div>
                        <div class="form-group">
                            <label for="password">Password</label>
                            <input type="password" name="password" />
                        </div>
                        <button type="submit" name="login" class="btn btn-primary">Log In</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>

<html>
<head>
    <title></title>
    <!-- <?php include '/../includes/head.php'; ?> -->
    <?php include("{$_SERVER['DOCUMENT_ROOT']}/app/views/includes/head.php"); ?>
    <?php include("{$_SERVER['DOCUMENT_ROOT']}/app/views/includes/header.php"); ?>

</head>
<body>
    <div id="main">
        <!-- <?php include '/../includes/header.php'; ?> -->
        <?php include("{$_SERVER['DOCUMENT_ROOT']}/app/views/includes/head.php"); ?>
        <!-- This is the page that will actually be displayed on the webpage -->
        <!-- Insert page contents here -->

        <div class="container">
        <h1>Interac Money</h1>
        <h6>Accounts: 
        <?php
            foreach ($data['accounts'] as $account) {
                if ($account->account_type == 'chequing') {
                    echo '<p>Balance in your checking account is: CAD '.$account->balance.'</p>';
                } else {
                    echo '<p>Balance in your savings account is: CAD '.$account->balance.'</p>';
                }

            }
        ?>
        </h6>
 

        <div>
        <h2>Send money by Email</h2>
        <form class="col s12" method="POST" action="/public/interac/send">

                            <div class="row">
                    <label>Payment Type</label>

					  <div class="input-field col s12">

                        <select name="payment-type" class="browser-default">
                        <option value="" disabled selected>Choose your option</option>
                        <option value="savings">Savings Account</option>
                        <option value="chequing">Chequing Account</option>

                        </select>
                    </div>

                </div>


					<div class="row">
						<div class="input-field col s12">
							<input id="email" name="email" type="email" class="validate">
							<label for="email">Email Adress</label>
						</div>
					</div>
					<div class="row">
						<div class="input-field col s12">
							<input id="phone" name="phone" type="number" class='validate'>
							<label for="phone">Phone Number</label>
						</div>
					</div>
                    <div class="row">
						<div class="input-field col s12">
							<input id="amount" name="amount" type="number" class='validate'>
							<label for="amount">Amount</label>
						</div>
					</div>
					<button class="btn waves-effect waves-light" type="submit" name="send">Send
						<i class="material-icons right"></i>
					</button>
					
				</form>
        </div>
    </div>
    </div>
</body>
</html>

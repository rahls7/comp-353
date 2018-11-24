<html>
<head>
    <title></title>
    <!-- <?php include '/../includes/head.php'; ?> -->
    <?php include("{$_SERVER['DOCUMENT_ROOT']}/app/views/includes/head.php"); ?>
</head>
<body>
    <div id="main">
        <!-- <?php include '/../includes/header.php'; ?> -->
        <?php include("{$_SERVER['DOCUMENT_ROOT']}/app/views/includes/head.php"); ?>
        <!-- This is the page that will actually be displayed on the webpage -->
        <!-- Insert page contents here -->
        <div class="container">
        <h1>Pay your Bills</h1>
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
        <div class="row">
            <div class="col s12">
            <ul class="tabs">
            <li class="tab col s3"><a class="active" href="#test1">Pay Liability</a></li>
            <li class="tab col s3"><a  href="#test2">Add New Bill</a></li>

            </ul>
            </div>
            <div id="test1" class="col s12">
            <form class="col s12" method="POST" action="/public/transfer/send">

            <div class="row">
            <label>From</label>

            <div class="input-field col s12">

            <select name="from" class="browser-default">
            <option value="" disabled selected>Choose your option</option>
            <option value="savings">Savings Account</option>
            <option value="chequing">Chequing Account</option>
            </select>
            </div>

            </div>
            <div class="row">
            <label>To</label>

            <div class="input-field col s12">

            <select name="payment-type" class="browser-default">
            <option value="" disabled selected>Choose your option</option>
            <?php
            foreach ($data['liabilities'] as $liability) {
                echo '<option value="' .$liability->type. '">'.$liability->type.'</option>';

            }
            ?>
            </select>
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
            <div id="test2" class="col s12"></div>

        </div>
        
        </div>
    </div>
    <script>
    var tabs = document.querySelectorAll('.tabs')
for (var i = 0; i < tabs.length; i++){
	M.Tabs.init(tabs[i]);
}

    </script>
</body>
</html>

<html>
<head>
    <title></title>
    <?php include("{$_SERVER['DOCUMENT_ROOT']}/app/views/includes/header.php"); ?>
</head>
<body>
    <div id="main">
      <?php include "{$_SERVER['DOCUMENT_ROOT']}/app/views/includes/head.php"; ?>
        <div class="container">

            <div class="jumbotron bg-primary d-flex">
                <h1 class="p-8">Welcome, <?php echo'name'; ?>!</h1>
                <div class="p-4">
                <a class="btn btn-primary btn-lg  d-block" href="#" role="button">Make a Payment</a>
                <a class="btn btn-primary btn-lg  d-block" href="#" role="button">Transfer Money</a>
                    </div>
            </div>

            <table class="table table-hover">
                <thead>
                    <tr>
                        <th scope="col">Account Number</th>
                        <th scope="col">Type</th>
                        <th scope="col">Balance</th>
                    </tr>
                </thead>
                <tbody>
                    <?php
                        foreach ($data['accounts'] as $account) {
                            echo '<tr>
                                <th scope="row">' . $account->account_number . '</th>
                                <td>' . $account->account_type . '</td>
                                <td>' . $account->balance . '</td>
                            </tr>';
                        }
                    ?>
                </tbody>
            </table>

            <table class="table table-hover">
                <thead>
                    <tr>
                        <th scope="col">Liability Number</th>
                        <th scope="col">Type</th>
                        <th scope="col">Credit Limit</th>
                    </tr>
                </thead>
                <tbody>
                    <?php
                        foreach ($data['liabilities'] as $liability) {
                            echo '<tr>
                                <th scope="row">' . $liability->liability_id . '</th>
                                <td>' . $liability->type . '</td>
                                <td>' . $liability->credit_limit . '</td>
                            </tr>';
                        }
                    ?>
                </tbody>
            </table>
        </div>
    </div>
</body>
</html>

<?php require_once('../../../private/initialize.php'); ?>

<?php $page_title = 'Subjects'; ?>
<?php include(SHARED_PATH . '/staff_header.php'); ?>

<div id="content">
    <table border="2">
        <caption><h3>This is the results of paths</h3></caption>
        <tr>
            <th>PRIVATE_PATH</th>
            <td><?=PRIVATE_PATH?></td>
        </tr>
        <tr>
            <TH>PROJECT_PATH</TH>
            <td><?=PROJECT_PATH?></td>
        </tr>
        <tr>
            <th>PUBLIC_PATH</th>
            <td><?=PUBLIC_PATH?></td>
        </tr>
        <tr>
            <th>SHARED_PATH</th>
            <td><?=SHARED_PATH?></td>
        </tr>
    </table>
</div>

<?php include(SHARED_PATH . '/staff_footer.php'); ?>

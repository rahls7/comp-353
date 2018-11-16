<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Challenge: using loops</title>
    <link href="styles.css" rel="stylesheet" type="text/css">
</head>
<body>
<h1>Multiplication Table</h1>
<table>
    <tr>
        <th>&nbsp;</th>
        <?php
        $rowNum = 13;
        $colNum = 13;
        for ($i =1; $i<$colNum; $i++){
            echo '<th>'.$i.'</th>';
        }
        ?>
    </tr>
    <?php
    $rowNum = 13;
    $colNum = 13;
    for($i=1;$i<$rowNum;$i++){
        echo '<tr>
                <th>'.$i.'</th>';
        for($j=0; $j<$rowNum-1; $j++){
            echo '<td>'.($i+$j).'</td>';
        }
        echo '</tr>';
    }
    ?>
</table>
</body>
</html>
<?php include 'header.php'; require 'db.php'; ?>
<h1>Catégories</h1>
<table border="1">
    <?php
    $res = $pdo->query("SELECT * FROM listedescatégories");
    while($row = $res->fetch()) { echo "<tr><td>{$row['nom']}</td><td>{$row['description']}</td></tr>"; }
    ?>
</table>
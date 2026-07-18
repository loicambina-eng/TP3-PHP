<?php include 'header.php'; require 'db.php'; ?>
<h1>Fournisseurs</h1>
<table border="1">
    <?php
    $res = $pdo->query("SELECT * FROM Fournisseur");
    while($row = $res->fetch()) { echo "<tr><td>{$row['nom']}</td><td>{$row['telephone']}</td></tr>"; }
    ?>
</table>
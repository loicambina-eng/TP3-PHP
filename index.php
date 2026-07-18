<?php include 'header.php'; ?>
<h1>GESTION DES STOCK</h1>
<table border="1">
    <tr><th>Réf</th><th>Libellé</th><th>Stock</th></tr>
    <?php
    require 'db.php';
    $res = $pdo->query("SELECT * FROM produits");
    while($row = $res->fetch()) { echo "<tr><td>{$row['ref']}</td><td>{$row['libelle']}</td><td>{$row['stock']}</td></tr>"; }
    ?>
</table>
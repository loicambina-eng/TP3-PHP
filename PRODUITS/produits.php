
<?php include 'header.php'; require 'db.php'; ?>
<h1>Liste des Produits</h1>
<a href="ajouter_produit.php">Ajouter un produit</a>
<table border="1">
    <tr><th>Réf</th><th>Libellé</th><th>Stock</th></tr>
    <?php
    $res = $pdo->query("SELECT * FROM produits");
    while($row = $res->fetch()) { echo "<tr><td>{$row['ref']}</td><td>{$row['libelle']}</td><td>{$row['stock']}</td></tr>"; }
    ?>
</table>
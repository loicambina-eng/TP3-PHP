<?php include 'header.php'; require 'db.php'; ?>
<h1>Historique des Mouvements</h1>
<table border="1">
    <?php
    $res = $pdo->query("SELECT * FROM listedesmouvementsdestock");
    while($row = $res->fetch()) { echo "<tr><td>{$row['produit_ref']}</td><td>{$row['quantite']}</td></tr>"; }
    ?>
</table>
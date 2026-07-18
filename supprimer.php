<?php
require 'db.php';
if(isset($_GET['ref'])) {
    $stmt = $pdo->prepare("DELETE FROM Produit WHERE ref = ?");
    $stmt->execute([$_GET['ref']]);
}
header('Location: index.php');
?>
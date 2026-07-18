<?php
$conn = mysqli_connect("localhost", "root", "", "gestion_stock");
if (!$conn) {
    die("Erreur de connexion : " . mysqli_connect_error());
}
?>

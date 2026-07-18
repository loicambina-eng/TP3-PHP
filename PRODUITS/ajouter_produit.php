<?php include 'header.php'; require 'db.php'; 
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $stmt = $pdo->prepare("INSERT INTO Produit (ref, libelle, stock) VALUES (?, ?, ?)");
    $stmt->execute([$_POST['ref'], $_POST['libelle'], $_POST['stock']]);
    echo "<p>Produit ajouté !</p>";
}
?>
<form method="POST">
    <input type="text" name="ref" placeholder="Référence" required><br>
    <input type="text" name="libelle" placeholder="Libellé" required><br>
    <input type="number" name="stock" placeholder="Stock" required><br>
    <button type="submit">Enregistrer</button>
</form>
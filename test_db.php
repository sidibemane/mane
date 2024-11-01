<?php
$servername = "127.0.0.1";
$username = "nema";
$password = "awa123";
$dbname = "laravel"; // Assurez-vous que ce nom est correct

// Créez la connexion
$conn = new mysqli($servername, $username, $password, $dbname);

// Vérifiez la connexion
if ($conn->connect_error) {
    die("Erreur de connexion : " . $conn->connect_error);
}
echo "Connexion réussie";
?>


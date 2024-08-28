<?php

header("Access-Control-Allow-Origin: *"); // Allows requests from any origin
header("Access-Control-Allow-Methods: GET, POST, OPTIONS"); // Allows specific HTTP methods
header("Access-Control-Allow-Headers: Content-Type"); // Allows specific headers

// Handle OPTIONS request
if ($_SERVER['REQUEST_METHOD'] === 'OPTIONS') {
    exit;
}

$host = 'localhost';
$port = '1433';
$dbname = 'Enduro';
$user = 'sa';
$password = 'rg';
$options = [
    PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
    PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC
];

try {
    $pdo = new PDO(
        "sqlsrv:Server=$host,$port;Database=$dbname",
        $user,
        $password,
        $options
    );
} catch (PDOException $e) {
    die("Connection failed: " . $e->getMessage());
}

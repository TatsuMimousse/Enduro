<?php

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
    echo "Connected successfully";
} catch (PDOException $e) {
    die("Connection failed: " . $e->getMessage());
}

<?php

$host = '10.0.2.15:1433';
$dbname = 'Enduro';
$user = 'sa';
$password = 'rg';
$options = [
    PDO::ATTR_EMULATE_PREPARES => false,
    PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION
];

try {
    $pdo = new PDO(
        "mysql:host=$host; dbname=$dbname; charset=utf8",
        $user,
        $password,
        $options
    );
} catch (PDOException $e) {
    die("Connection failed: " . $e->getMessage());
}

<?php
include "dbconnection.php";

$statement = $pdo->prepare("SELECT Id, Name, Iso FROM dbo.Countries");
$statement->execute();
echo json_encode($statement->fetchAll());
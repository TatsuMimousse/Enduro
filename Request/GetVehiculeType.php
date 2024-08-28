<?php
include "dbconnection.php";

$statement = $pdo->prepare("SELECT Id, Label, Price FROM dbo.VehiculeTypes");
$statement->execute();
echo json_encode($statement->fetchAll());
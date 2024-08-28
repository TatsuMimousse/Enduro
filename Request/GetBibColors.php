<?php
include "dbconnection.php";

$statement = $pdo->prepare("SELECT Id, Label, BackgroundColor, TextColor FROM dbo.BibColors");
$statement->execute();
echo json_encode($statement->fetchAll());
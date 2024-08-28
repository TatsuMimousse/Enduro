<?php
include "dbconnection.php";

$statement = $pdo->prepare("INSERT INTO dbo.Vehicules(Plate, IdType, TicketNumber, IdDriver) VALUES(:plate, :idType, :ticketNumber, :idDriver)");
$statement->bindParam(':plate', $_POST['plate']);
$statement->bindParam(':idType', $_POST['idType']);
$statement->bindParam(':ticketNumber', $_POST['ticketNumber']);
$statement->bindParam(':idDriver', $_POST['idDriver']);
$statement->execute();
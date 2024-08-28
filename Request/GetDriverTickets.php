<?php
include "dbconnection.php";

$statement = $pdo->prepare("SELECT Plate, VT.Label as TypeLabel, VT.Price as TypePrice, TicketNumber, IdDriver FROM dbo.Vehicules V
                                  INNER JOIN dbo.VehiculeTypes VT on VT.Id = V.IdType
                                  WHERE IdDriver = :idDriver");
$statement->bindParam(':idDriver', $_GET['idDriver']);
$statement->execute();
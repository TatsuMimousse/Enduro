<?php
include "dbconnection.php";

$statement = $pdo->prepare("UPDATE dbo.Drivers 
                                  SET Payed = :paymentStatus
                                  WHERE IdDriver = :idDriver");
$statement->bindParam(':idDriver', $_POST['idDriver']);
$statement->bindParam(':paymentStatus', $_POST['paymentStatus']);
$statement->execute();
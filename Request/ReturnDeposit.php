<?php
include "dbconnection.php";

$statement = $pdo->prepare("UPDATE dbo.Drivers 
                                  SET DepositReturned = :depositReturned
                                  WHERE IdDriver = :idDriver");
$statement->bindParam(':idDriver', $_POST['idDriver']);
$statement->bindParam(':depositReturned', $_POST['depositReturned']);
$statement->execute();
<?php
include "dbconnection.php";

$statement = $pdo->prepare("UPDATE dbo.Bibs 
                                  SET IdDriver = :idDriver
                                  WHERE Number = :bibNumber");
$statement->bindParam(':idDriver', $_POST['idDriver']);
$statement->bindParam(':bibNumber', $_POST['bibNumber']);
$statement->execute();
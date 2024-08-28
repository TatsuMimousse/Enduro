<?php
include "dbconnection.php";

$statement = $pdo->prepare("SELECT Number, IdColor, IdDriver, BackgroundColor, TextColor FROM dbo.Bibs b
                                  INNER JOIN dbo.BibColors bc on bc.Id = b.IdColor
                                  WHERE Number = :bibNumber");
$statement->bindParam(':bibNumber', $_GET['bibNumber']);
$statement->execute();
echo json_encode($statement->fetchAll());
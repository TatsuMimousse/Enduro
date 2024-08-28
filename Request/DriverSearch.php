<?php
include "dbconnection.php";

$request = "SELECT unique D.Id as IdDriver, Name, Surname, Birthdate, IdCountry, C.Name as Country, PostalCode, City, D.Number, Street, Payed, DepositReturned, 
                   B.Number as BibNumber, B.IdColor, BC.Label as BibColorLabel, BC.BackgroundColor, BC.TextColor FROM dbo.Drivers D 
            LEFT JOIN dbo.Bibs B on B.idDriver = D.Id 
            LEFT JOIN dbo.BibColors BC on BC.Id = B.IdColor                                                                                                                                                 
            LEFT JOIN dbo.Vehicules V on V.IdDriver = D.Id
            LEFT JOIN dbo.Countries C on C.Id = D.IdCountry ";

if (isset($_POST['searchString'])) {
    $request .= "WHERE D.Name like '%' + :searchString + '%' 
                    OR B.Surname like '%' + :searchString + '%' 
                    OR V.TicketNumber like '%' + :searchString + '%' 
                    OR V.Plate like '%' + :searchString + '%'";
}
else if (isset($_POST['bibNumber'])) {
    $request .= "WHERE B.Number = :bibNumber";
}

$statement = $pdo->prepare($request);

if (isset($_POST['searchString'])) {
    $statement->bindParam(':searchString', $_POST['searchString']);
}
else if (isset($_POST['bibNumber'])){
    $statement->bindParam(':bibNumber', $_POST['bibNumber']);
}

$statement->execute();
echo json_encode($statement->fetchAll());
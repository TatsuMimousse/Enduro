<?php
include "dbconnection.php";

$request =  "";

if (isset($_POST['idDriver'])) {
    $request .= "UPDATE dbo.Drivers 
                 SET Name = :name,
                     Surname = :surname,
                     Birthdate = :birthdate,
                     IdCountry = :idCountry,
                     PostalCode = :postalCode,
                     City = :city,
                     Number =:number,
                     Street = :street
                 WHERE Id = :idDriver";
}
else{
    $request .= "INSERT INTO dbo.Drivers (Name, Surname, Birthdate, IdCountry, PostalCode, City, Number, Street)
                 VALUES (:name, :surname, :birthdate, :idCountry, :postalCode, :city, :number, :street)";
}

$statement = $pdo->prepare($request);

if (isset($_POST['idDriver'])) {
    $statement->bindParam(':idDriver', $_POST['idDriver']);
}
$statement->bindParam(':name', $_POST['name']);
$statement->bindParam(':surname', $_POST['surname']);
$statement->bindParam(':birthdate', $_POST['birthdate']);
$statement->bindParam(':idCountry', $_POST['idCountry']);
$statement->bindParam(':postalCode', $_POST['postalCode']);
$statement->bindParam(':city', $_POST['city']);
$statement->bindParam(':number', $_POST['number']);
$statement->bindParam(':street', $_POST['street']);

$statement->execute();
echo json_encode($pdo->lastInsertId()); // returns the id of the driver for the create method
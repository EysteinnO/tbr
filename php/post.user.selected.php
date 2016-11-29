<?php 
require 'inite.database.php';

$data = json_decode(file_get_contents('php://input'));

$ID = $data->userid;

$toReturn = [];

$tempuserarray = [];

$keyword = "User";


$sth = $dhb->prepare('SELECT 
	id,
	username,
	name,
	email,
	imgLink FROM 
	user WHERE 
	id = :ID');

$sth->bindParam(':ID', $ID, PDO::PARAM_INT);
$sth->execute();
$sth->setFetchMode(PDO::FETCH_ASSOC);

$tempuserarray = $sth->fetch();

$toReturn[$keyword] = $tempuserarray;

echo (json_encode($toReturn, JSON_UNESCAPED_SLASHES));
?> 
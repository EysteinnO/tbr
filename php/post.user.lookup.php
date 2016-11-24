<?php

require('init.database.php');

//$data = json_decode(file_get_contents('php://input'));

$username = "o";

$toReturn = [];

$sth = $dbh->prepare('SELECT 
		id as ID, 
		username as Name
    from user
    where INSTR(username, :username) > 0
    ');

$sth->bindParam(':username', $username, PDO::PARAM_STR);

$sth->execute();

$sth->setFetchMode(PDO::FETCH_ASSOC);

$toReturn = $sth->fetchAll();

echo(json_encode($toReturn));

?>
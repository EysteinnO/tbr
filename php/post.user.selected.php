<?php 
require 'inite.database.php';

$data = json_decode(file_get_contents('php://input'));

$ID = $data->userid;

$toReturn = [];

$tempuserarray = [];
$tempcomparray = [];

$keyword = "User";
$keyword = "TeamComps"


$sth = $dhb->prepare('SELECT 
	id AS ID,
	username AS Username,
	name AS Name,
	email AS Email,
	imgLink AS imgLink
	FROM 
	user WHERE 
	id = :ID');

$sth->bindParam(':ID', $ID, PDO::PARAM_INT);
$sth->execute();
$sth->setFetchMode(PDO::FETCH_ASSOC);

$tempuserarray = $sth->fetch();

$sth = $dhb->prepare('SELECT	
	t.id AS ID,
	t.teamname AS TeamName,
	ct.comp_id AS compID,
	c.compDate AS compDate,
	g.name AS gameName
	from team t
	inner join team_user tu on t.id = tu.team_id
	inner join comp_team ct on tu.team_id = ct.teams_id
	inner join comp c on ct.comp_id = c.id
	inner join game g on c.games_id = g.id
	WHERE tu.user_id = :ID
	/*AND 
	SELECT 
	ct.comp_id AS compID
	from comp_team ct 
	inner join team t on ct.team_id = t.id
	where ct.team_id = t.id*/');

teams_id
$toReturn[$keyword] = $tempuserarray;

echo (json_encode($toReturn, JSON_UNESCAPED_SLASHES));
?> 
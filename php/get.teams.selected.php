	/*
		Recieves teamid from JS such as 1, performs a query / queries into the database
		to retrieve the team information and the users within it (forgein key connect)
		Returns: A multi-dimensional array 
			[
				'team'=> ['name' => "BobInPajamas",	...],
				'users'=>[1 => ['username'=> 'Bob'], 2=> [ ... ], ...]
			]
		Tips:
			create the array $toReturn; after peforming everything and
			setting the correct info simply do:
				return json_encode($toReturn);
	*/

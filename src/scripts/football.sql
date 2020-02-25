
/* Create Sport */
INSERT INTO `sports` ( `id`, `name`, `icon`, `duration` )         
    VALUES (1, 'American Football','/assets/imgs/sports/football.png',180);


/* Create Leagues */
INSERT INTO `leagues` ( `id`, `name`, `sport`, `icon` )         
    VALUES (1, 'NFL',1,'/assets/imgs/leagues/nfl.png'),
					(2, 'CFL',1,'/assets/imgs/leagues/cfl.png');
                    
/* Create NFL */
INSERT INTO `teams` ( `name`, `icon`, `league` ) 
        VALUES ("Buffalo Bills","bills.png",1),
            ("Miami Dolphins","dolphins.png",1),
            ("New England Patriots","patriots.png",1),
            ("New York Jets","jets.png",1),
            ("Baltimore Ravens","ravens.png",1),
            ("Cincinnati Bengals","bengals.png",1),
            ("Cleveland Browns","browns.png",1),
            ("Pittsburgh Steelers","steelers.png",1),
            ("Houston Texans","texans.png",1),
            ("Indianapolis Colts","colts.png",1),
            ("Jacksonville Jaguars","jaguars.png",1),
            ("Tennessee Titans","titans.png",1),
            ("Denver Broncos","broncos.png",1),
            ("Kansas City Chiefs","chiefs.png",1),
            ("Los Angeles Chargers","chargers.png",1),
            ("Oakland Raiders","raiders.png",1),
            ("Dallas Cowboys","cowboys.png",1),
            ("New York Giants","giants.png",1),
            ("Philadelphia Eagles","eagles.png",1),
            ("Washington Redskins","redskins.png",1),
            ("Chicago Bears","bears.png",1),
            ("Detroit Lions","lions.png",1),
            ("Green Bay Packers","packers.png",1),
            ("Minnesota Vikings","vikings.png",1),
            ("Atlanta Falcons","falcons.png",1),
            ("Carolina Panthers","panthers.png",1),
            ("New Orleans Saints","saints.png",1),
            ("Tampa Bay Buccaneers","buccaneers.png",1),
            ("Arizona Cardinals","cardinals.png",1),
            ("Los Angeles Rams","rams.png",1),
            ("San Francisco 49ers","49ers.png",1),
            ("Seattle Seahawks","seahawks.png",1)
            
	



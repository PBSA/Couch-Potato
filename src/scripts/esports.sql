
/* Create Sport */
INSERT INTO `couch_potato`.`sports` ( `id`, `name`, `icon`, `duration` )         
    VALUES (7, 'Esports','/assets/imgs/sports/esports.png',120);


/* Create Leagues */
INSERT INTO `couch_potato`.`leagues` ( `id`, `name`, `sport`, `icon` )         
    VALUES (17, 'PUBG',7,'/assets/imgs/leagues/pubg.png'),
					(18, 'Fortnite',7,'/assets/imgs/leagues/fortnite.png'),
                    (19, 'League of Legends',7,'/assets/imgs/leagues/lol.png');
                    
/* Create Players */
INSERT INTO `couch_potato`.`teams` ( `name`, `icon`, `league` )         
    VALUES ('Paul Cox','uk.png',17),
        ('Justin Cheung','canada.png',17),
        ('Adrian Metzler','germany.png',17),
        ('Michael Seaward','canada.png',17);
        
/* Create Players */
INSERT INTO `couch_potato`.`teams` ( `name`, `icon`, `league` )         
    VALUES ('Paul Cox','uk.png',18),
        ('Justin Cheung','canada.png',18),
        ('Adrian Metzler','germany.png',18),
        ('Michael Seaward','canada.png',18);
        
/* Create Players */
INSERT INTO `couch_potato`.`teams` ( `name`, `icon`, `league` )         
    VALUES ('Paul Cox','uk.png',19),
        ('Justin Cheung','canada.png',19),
        ('Adrian Metzler','germany.png',19),
        ('Michael Seaward','canada.png',19);
        

    


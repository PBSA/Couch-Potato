
/* Create Golf */
INSERT INTO `sports` ( `id`, `name`, `icon`, `duration` )         
    VALUES (7, 'Golf','/assets/imgs/sports/golf.png',10000);


/* Create Leagues */
INSERT INTO `leagues` ( `id`, `name`, `sport`, `icon` )         
    VALUES (20, 'British Open',7,'/assets/imgs/leagues/open_golf.png');
				
                    
/* Create Players */
INSERT INTO `teams` ( `name`, `icon`, `league` )         
    VALUES ('Brooks Koepka','us.png',20),
					('Rory McIlroy','ni.png',20),
					('Jon Rahm','spain.png',20),
					('Justin Thomas','us.png',20),
					('Dustin Johnson','us.png',20),
                    ('Tiger Woods','us.png',20),
                    ('Patrick Cantley','us.png',20),
                    ('Justin Rose','england.png',20),
                    ('Adam Scott','australia.png',20),
					('Tommy Fleetwood','england.png',20),
					('Webb Simpson','us.png',20),
					('Patrick Reed','us.png',20),
					('Tony Finau','us.png',20),
                    ('Shane Lowry','ireland.png',20),
                    ('Paul Casey','england.png',20),
                    ('Marc Leishman','australia.png',20),
                    ('Francesco Molinari','italy.png',20),
                    ('Hideki Matsuyama','japan.png',20),
                    ('Henrik Stenson','sweden.png',20);
                        
                   
    
    
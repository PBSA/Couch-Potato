
/* Create Sport */
INSERT INTO `sports` ( `id`, `name`, `icon`, `duration` )         
    VALUES (6, 'Tennis','/assets/imgs/sports/tennis.png',180);


/* Create Leagues */
INSERT INTO `leagues` ( `id`, `name`, `sport`, `icon` )         
    VALUES (12, 'Wimbledon',6,'/assets/imgs/leagues/wimbledon.png'),
					(13, 'U.S Open',6,'/assets/imgs/leagues/usopen_tennis.png'),
                    (14, 'Aus. Open',6,'/assets/imgs/leagues/ausopen_tennis.png');
                    
/* Create Players */
INSERT INTO `teams` ( `name`, `icon`, `league` )         
    VALUES ('Roger Federrer','switzerland.png',12),
        ('Rafael Nadal','spain.png',12),
        ('Andrew Murray','uk.png',12),
        ('Milos Raonic','canada.png',12),
        ('Novak Djokavic','serbia.png',12),
        ('Dominic Thiem','austria.png',12),
        ('Daniil Medvedev','russia.png',12),
        ('Stefanos Tsitsipas','greece.png',12),
        ('Alexander Zverev','germany.png',12),
        ('Matteo Berrettini','italy.png',12),
        ('Kei Nishikori','japan.png',12);
        
INSERT INTO `teams` ( `name`, `icon`, `league` )         
    VALUES ('Roger Federrer','switzerland.png',13),
        ('Rafael Nadal','spain.png',13),
        ('Andrew Murray','uk.png',13),
        ('Milos Raonic','canada.png',13),
        ('Novak Djokavic','serbia.png',13),
        ('Dominic Thiem','austria.png',13),
        ('Daniil Medvedev','russia.png',13),
        ('Stefanos Tsitsipas','greece.png',13),
        ('Alexander Zverev','germany.png',13),
        ('Matteo Berrettini','italy.png',13),
        ('Kei Nishikori','japan.png',13);
        
INSERT INTO `teams` ( `name`, `icon`, `league` )         
    VALUES ('Roger Federrer','switzerland.png',14),
        ('Rafael Nadal','spain.png',14),
        ('Andrew Murray','uk.png',14),
        ('Milos Raonic','canada.png',14),
        ('Novak Djokavic','serbia.png',14),
        ('Dominic Thiem','austria.png',14),
        ('Daniil Medvedev','russia.png',14),
        ('Stefanos Tsitsipas','greece.png',14),
        ('Alexander Zverev','germany.png',14),
        ('Matteo Berrettini','italy.png',14),
        ('Kei Nishikori','japan.png',14);
    


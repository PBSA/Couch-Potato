/* Delete all event data and clear logs */


/*Http Log*/
TRUNCATE TABLE  `couch-potato`.`httplog`;

/*Error Log*/
TRUNCATE TABLE  `couch-potato`.`errorlog`;

/*Incdients Log*/
TRUNCATE TABLE  `couch-potato`.`incidents`;

/*Events*/
TRUNCATE TABLE  `couch-potato`.`events`;

/*Games*/
TRUNCATE TABLE  `couch-potato`.`games`;

/*Progress*/
TRUNCATE TABLE  `couch-potato`.`progress`;

/*Replays*/
TRUNCATE TABLE  `couch-potato`.`replays`;
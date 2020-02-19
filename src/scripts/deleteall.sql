/* Delete all event data and clear logs */


/*Http Log*/
TRUNCATE TABLE  `couch_potato`.`httplog`;

/*Error Log*/
TRUNCATE TABLE  `couch_potato`.`errorlog`;

/*Incdients Log*/
TRUNCATE TABLE  `couch_potato`.`incidents`;

/*Games*/
TRUNCATE TABLE  `couch_potato`.`games`;

/*Progress*/
TRUNCATE TABLE  `couch_potato`.`progress`;


/*Events*/
TRUNCATE TABLE  `couch_potato`.`events`;






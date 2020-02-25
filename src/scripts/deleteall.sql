/* Delete all event data and clear logs */


/*Http Log*/
TRUNCATE TABLE  `couch_potato`.`httplog`;

/*Error Log*/
TRUNCATE TABLE  `couch_potato`.`errorlog`;

/* Incident Log */
TRUNCATE TABLE  `couch_potato`.`incidents`;

/* Progress status */
TRUNCATE TABLE  `couch_potato`.`progress`;

/* Games */
DELETE FROM  `couch_potato`.`games`;

/* Events */
DELETE FROM  `couch_potato`.`events`;








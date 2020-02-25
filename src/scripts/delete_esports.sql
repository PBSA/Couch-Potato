/* Delete all  esports */

/* Players */
DELETE FROM `couch_potato`.`teams` WHERE `league` IN (17,18,19);

/* Leagues */
DELETE FROM `couch_potato`.`leagues` WHERE `id` IN (17,18,19);

/* Sports */
DELETE FROM `couch_potato`.`sports` WHERE `id` = 7;



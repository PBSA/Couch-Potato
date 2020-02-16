/* Delete all  esports */

/* Players */
DELETE FROM `couch-potato`.`teams` WHERE `league` IN (17,18,19);

/* Leagues */
DELETE FROM `couch-potato`.`leagues` WHERE `id` IN (17,18,19);

/* Sports */
DELETE FROM `couch-potato`.`sports` WHERE `id` = 7;



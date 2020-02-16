/* Delete all  golf */

/* Players */
DELETE FROM `couch-potato`.`teams` WHERE `league` IN (20);

/* Leagues */
DELETE FROM `couch-potato`.`leagues` WHERE `id` IN (20);

/* Sports */
DELETE FROM `couch-potato`.`sports` WHERE `id` = 6;



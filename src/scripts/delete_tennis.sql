/* Delete all  tennis */

/* Players */
DELETE FROM `couch-potato`.`teams` WHERE `league` IN (12,13,14);

/* Leagues */
DELETE FROM `couch-potato`.`leagues` WHERE `id` IN (12,13,14);

/* Sports */
DELETE FROM `couch-potato`.`sports` WHERE `id` = 6;



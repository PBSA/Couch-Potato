/* Delete all  tennis */

/* Players */
DELETE FROM `couch_potato`.`teams` WHERE `league` IN (1,2);

/* Leagues */
DELETE FROM `couch_potato`.`leagues` WHERE `id` IN (1,2);

/* Sports */
DELETE FROM `couch_potato`.`sports` WHERE `id` = 1;




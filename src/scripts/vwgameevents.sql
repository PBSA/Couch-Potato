CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `vwgameevents` AS
    SELECT 
        `x`.`league` AS `league`,
        `x`.`id` AS `eventid`,
        `x`.`date` AS `date`,
        CONCAT(`x`.`date`, ' ', `y`.`starttime`) AS `datetime`,
        `y`.`hometeam` AS `hometeam`,
        `y`.`awayteam` AS `awayteam`,
        `y`.`starttime` AS `starttime`,
        `y`.`homescore` AS `homescore`,
        `y`.`awayscore` AS `awayscore`,
        `y`.`id` AS `gameid`,
        `z`.`sport` AS `sportid`,
        `z`.`id` AS `leagueid`,
        `a`.`name` AS `sportname`,
        `a`.`icon` AS `icon`,
        `a`.`duration` AS `duration`,
        `p`.`status` AS `status`,
        `s`.`name` AS `name`
    FROM
        (((((`events` `x`
        JOIN `games` `y` ON ((`y`.`event` = `x`.`id`)))
        JOIN `leagues` `z` ON ((`x`.`league` = `z`.`name`)))
        JOIN `sports` `a` ON ((`z`.`sport` = `a`.`id`)))
        JOIN `progress` `p` ON ((`y`.`id` = `p`.`game`)))
        JOIN `status` `s` ON ((`p`.`status` = `s`.`id`)))
    ORDER BY `y`.`starttime`
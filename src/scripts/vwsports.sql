CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `vwsports` AS
    SELECT 
        `x`.`id` AS `id`,
        `x`.`name` AS `sportsname`,
        `x`.`icon` AS `sportsicon`,
        `y`.`name` AS `leaguename`,
        `y`.`icon` AS `leagueicon`
    FROM
        (`sports` `x`
        JOIN `leagues` `y` ON ((`x`.`id` = `y`.`sport`)))
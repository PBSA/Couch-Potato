CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `vwteams` AS
    SELECT 
        `x`.`name` AS `teamname`, `y`.`name` AS `leaguename`
    FROM
        (`teams` `x`
        JOIN `leagues` `y` ON ((`x`.`league` = `y`.`id`)))
CREATE DATABASE IF NOT EXISTS rncp1;
USE rncp1;
SHOW VARIABLES LIKE "secure_file_priv"; #value null
SHOW VARIABLES LIKE 'secure_file_priv';

CREATE TABLE IF NOT EXISTS fiscal_data (
    Neighboorhood INT,
    Taxed_Households_2018 FLOAT,
    Percentage_Taxed_Households_2018 FLOAT,
    Main_Residence_2017 FLOAT,
    PRIMARY KEY (Neighboorhood)
);

ALTER TABLE fiscal_data DROP COLUMN `Unnamed: 0`;

SELECT 
    *
FROM
    fiscal_data;

LOAD DATA INFILE 'Users/davidpitoun/RNCP_project/db csv/fiscaldf.csv' 
INTO TABLE fiscal_data 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;


SELECT 
    *
FROM
    `reports/signalements`;
SELECT 
    COUNT(ID_DMR)
FROM
    `reports/signalements`;


SELECT 
    `reports/signalements`.`TYPE DECLARATION`,
    AVG(`socio-eco stats`.`Mediane du niveau de vie 2018`)
FROM
    `reports/signalements`
        LEFT JOIN
    `socio-eco stats` ON `socio-eco stats`.Arrondissement = `reports/signalements`.ARRONDISSEMENT
GROUP BY `reports/signalements`.`TYPE DECLARATION`
ORDER BY AVG(`socio-eco stats`.`Mediane du niveau de vie 2018`) DESC;


SELECT 
    `reports/signalements`.ARRONDISSEMENT,
    COUNT(ID_DMR) AS Number
FROM
    `reports/signalements`
GROUP BY `reports/signalements`.ARRONDISSEMENT
ORDER BY NUMBER DESC
LIMIT 10;

SELECT DISTINCT
    (`reports/signalements`.`TYPE DECLARATION`),
    COUNT(`reports/signalements`.ARRONDISSEMENT)
FROM
    `reports/signalements`
        JOIN
    `socio-eco stats` ON `socio-eco stats`.Arrondissement = `reports/signalements`.ARRONDISSEMENT
GROUP BY `reports/signalements`.`TYPE DECLARATION`
ORDER BY COUNT(`reports/signalements`.ARRONDISSEMENT) DESC;

SELECT 
    `reports/signalements`.ARRONDISSEMENT,
    COUNT(`reports/signalements`.`TYPE DECLARATION`) AS Number_decl
FROM
    `reports/signalements`
        JOIN
    `socio-eco stats` ON `socio-eco stats`.Arrondissement = `reports/signalements`.ARRONDISSEMENT
GROUP BY `reports/signalements`.ARRONDISSEMENT
ORDER BY Number_decl DESC;

SELECT 
    `reports/signalements`.ARRONDISSEMENT,
    COUNT(`reports/signalements`.`TYPE DECLARATION`)
FROM
    `reports/signalements`
GROUP BY `reports/signalements`.ARRONDISSEMENT;

SELECT 
    `Mediane du niveau de vie 2018`, Arrondissement
FROM
    `socio-eco stats`
ORDER BY `Mediane du niveau de vie 2018` DESC;

SELECT 
    `Mediane du niveau de vie 2018`,
    Arrondissement,
    `Population 2017`
FROM
    `socio-eco stats`
ORDER BY `Mediane du niveau de vie 2018` DESC;

SELECT 
    `Population 2017`, `Taux de pauvrete 2018`, Arrondissement
FROM
    `socio-eco stats`
ORDER BY `Population 2017` DESC;


SELECT 
    `reports/signalements`.ARRONDISSEMENT,
    COUNT(`reports/signalements`.`TYPE DECLARATION`) AS Number_decl,
    AVG(`socio-eco stats`.`Taux de pauvrete 2018`),
    COUNT(`socio-eco stats`.`Population 2017`)
FROM
    `reports/signalements`
        JOIN
    `socio-eco stats` ON `socio-eco stats`.Arrondissement = `reports/signalements`.ARRONDISSEMENT
GROUP BY `reports/signalements`.ARRONDISSEMENT
ORDER BY Number_decl DESC;

SELECT 
    INTERVENANT, COUNT(`TYPE DECLARATION`)
FROM
    `reports/signalements`
GROUP BY INTERVENANT;

SELECT 
    INTERVENANT, `TYPE DECLARATION`, COUNT(`TYPE DECLARATION`)
FROM
    `reports/signalements`
GROUP BY INTERVENANT;

SELECT 
    DAYOFWEEK(`DATE DECLARATION`) AS Weekday,
    COUNT(DAYOFWEEK(`DATE DECLARATION`))
FROM
    `reports/signalements`
GROUP BY Weekday;

SELECT 
    DAYOFWEEK(`DATE DECLARATION`) AS Weekdays,
    COUNT(DAYOFWEEK(`DATE DECLARATION`))
FROM
    `reports/signalements`
GROUP BY Weekdays
ORDER BY COUNT(DAYOFWEEK(`DATE DECLARATION`)) DESC;

SELECT 
    `OUTIL SOURCE`, COUNT(`OUTIL SOURCE`)
FROM
    `reports/signalements`
GROUP BY `OUTIL SOURCE`
ORDER BY COUNT(`OUTIL SOURCE`) DESC;

SELECT 
    ARRONDISSEMENT, `OUTIL SOURCE`, COUNT(`OUTIL SOURCE`)
FROM
    `reports/signalements`
GROUP BY ARRONDISSEMENT , `OUTIL SOURCE`
ORDER BY COUNT(`OUTIL SOURCE`) DESC;

SELECT `socio-eco stats`.`Population 2017`, `socio-eco stats`.Arrondissement 
FROM `socio-eco stats`
ORDER BY `socio-eco stats`.`Population 2017`
DESC;

SELECT `SOUS TYPE DECLARATION`,COUNT(`SOUS TYPE DECLARATION`)
FROM `reports/signalements`
GROUP BY `SOUS TYPE DECLARATION`
ORDER BY COUNT(`SOUS TYPE DECLARATION`)
DESC;

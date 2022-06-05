CREATE DATABASE IF NOT EXISTS rncp1;
USE rncp1;
SHOW VARIABLES LIKE "secure_file_priv"; #value null
SHOW VARIABLES LIKE 'secure_file_priv';

CREATE TABLE IF NOT EXISTS fiscal_data(
Neighboorhood INT,
Taxed_Households_2018 FLOAT,
Percentage_Taxed_Households_2018 FLOAT,
Main_Residence_2017 FLOAT,
PRIMARY KEY (Neighboorhood)
);

ALTER TABLE fiscal_data DROP COLUMN `Unnamed: 0`;

SELECT * from fiscal_data;

LOAD DATA INFILE 'Users/davidpitoun/RNCP_project/db csv/fiscaldf.csv' 
INTO TABLE fiscal_data 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

'''
LOAD DATA INFILE 'Users/davidpitoun/RNCP_project/db csv/fiscaldf.csv'  INTO TABLE fiscal_data  FIELDS TERMINATED BY ','  ENCLOSED BY '"' LINES TERMINATED BY '\n' IGNORE 1 ROWS
'''
#the load infile results in the following file configuration error:
'''
Error Code: 1290. The MySQL server is running with the --secure-file-priv option so it cannot execute this statement
'''
# I therefor opted to reimport the csv files into python before exporting it to mysql with the mysql and sqlalchemy module. (see sqltableimport.ipynb)

SELECT * from `reports/signalements`;

select count(ID_DMR) from `reports/signalements`;






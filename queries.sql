Use rncp1;

SELECT ARRONDISSEMENT,AVG(`Logements 2017`),AVG(`Population 2017`) from neighborhoods
GROUP BY ARRONDISSEMENT
ORDER BY AVG(`Logements 2017`);

SELECT neighborhoods.ARRONDISSEMENT, AVG(neighborhoods.`Logements 2017`), AVG(`socio-eco stats`.`Taux de pauvrete 2018`)
FROM neighborhoods
LEFT JOIN 
`socio-eco stats`
ON neighborhoods.ARRONDISSEMENT=`socio-eco stats`.Arrondissement
GROUP BY neighborhoods.ARRONDISSEMENT
ORDER BY AVG(`socio-eco stats`.`Taux de pauvrete 2018`) DESC
LIMIT 5;



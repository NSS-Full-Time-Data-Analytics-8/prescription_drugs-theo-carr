SELECT cbsaname, SUM(population) AS total_population
FROM cbsa 
	INNER JOIN population USING(fipscounty)
GROUP BY cbsaname
ORDER BY total_population DESC;
	
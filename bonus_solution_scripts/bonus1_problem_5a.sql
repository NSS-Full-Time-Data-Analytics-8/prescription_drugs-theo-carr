SELECT state, SUM(population)
FROM fips_county INNER JOIN population USING(fipscounty)
WHERE state = 'TN'
GROUP BY state;

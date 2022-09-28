WITH tenn_pop AS 
		(SELECT state, SUM(population) as tennpop
		FROM fips_county INNER JOIN population USING(fipscounty)
		WHERE state = 'TN'
		GROUP BY state)
SELECT county, population, CONCAT(ROUND(population/tennpop * 100,2)::TEXT,'%') as percent_of_pop
FROM fips_county INNER JOIN population USING(fipscounty), tenn_pop
WHERE fips_county.state = 'TN';
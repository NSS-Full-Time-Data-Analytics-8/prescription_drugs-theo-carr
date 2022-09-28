
SELECT county, deaths
FROM overdoses INNER JOIN fips_county USING(fipscounty)
WHERE deaths > (SELECT AVG(deaths) FROM overdoses)
ORDER BY deaths DESC;
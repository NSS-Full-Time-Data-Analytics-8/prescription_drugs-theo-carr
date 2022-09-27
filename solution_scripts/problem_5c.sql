SELECT fipscounty,
		fips_county.county, 
		population,
		cbsa,
		cbsaname
	
FROM population
	FULL JOIN cbsa USING(fipscounty)
	INNER JOIN fips_county USING(fipscounty)
WHERE cbsaname IS NULL
ORDER BY population DESC;
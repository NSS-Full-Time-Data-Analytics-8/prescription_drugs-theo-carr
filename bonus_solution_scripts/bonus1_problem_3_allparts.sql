WITH nashville_top_5 AS 
		(SELECT npi, SUM(total_claim_count) as total_claims, nppes_provider_city
		FROM prescriber INNER JOIN prescription USING(npi)
		WHERE  nppes_provider_city ILIKE 'NASHVILLE'
		GROUP BY npi, nppes_provider_city
		ORDER BY total_claims DESC
		LIMIT 5),
		
	memphis_top_5 AS 
		(SELECT npi, SUM(total_claim_count) as total_claims, nppes_provider_city
		FROM prescriber INNER JOIN prescription USING(npi)
		WHERE  nppes_provider_city ILIKE 'MEMPHIS'
		GROUP BY npi, nppes_provider_city
		ORDER BY total_claims DESC
		LIMIT 5),
	knoxville_top_5 AS 
		(SELECT npi, SUM(total_claim_count) as total_claims, nppes_provider_city
		FROM prescriber INNER JOIN prescription USING(npi)
		WHERE  nppes_provider_city ILIKE 'KNOXVILLE'
		GROUP BY npi, nppes_provider_city
		ORDER BY total_claims DESC
		LIMIT 5),
	chat_top_5 AS 
		(SELECT npi, SUM(total_claim_count) as total_claims, nppes_provider_city
		FROM prescriber INNER JOIN prescription USING(npi)
		WHERE  nppes_provider_city ILIKE 'CHATTANOOGA'
		GROUP BY npi, nppes_provider_city
		ORDER BY total_claims DESC
		LIMIT 5)
		
SELECT * FROM nashville_top_5
UNION
SELECT * FROM memphis_top_5
UNION
SELECT * FROM knoxville_top_5
UNION
SELECT * FROM chat_top_5

ORDER BY nppes_provider_city DESC;
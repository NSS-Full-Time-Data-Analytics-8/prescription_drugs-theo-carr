SELECT state,COUNT(*)
FROM cbsa INNER JOIN fips_county ON cbsa.fipscounty = fips_county.fipscounty
WHERE state IN('TN')
GROUP BY state
ORDER BY state;
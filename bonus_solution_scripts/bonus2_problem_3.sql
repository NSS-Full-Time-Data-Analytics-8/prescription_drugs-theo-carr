SELECT specialty_description, SUM(total_claim_count) AS total_claims
FROM prescriber INNER JOIN prescription USING(npi)
WHERE specialty_description ILIKE '%pain management%'
GROUP BY GROUPING SETS (specialty_description,())
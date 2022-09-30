SELECT ndc.npi, ndc.drug_name, 
	CASE WHEN total_claim_count IS NULL THEN 0
		ELSE total_claim_count END AS total_claims
FROM (SELECT npi, drug_name FROM prescriber, drug --MERGE TWO UNRELATED TABLES
	  WHERE specialty_description = 'Pain Management'
	  	AND nppes_provider_city ILIKE 'nashville' 
	  	AND opioid_drug_flag LIKE 'Y') AS ndc
	FULL JOIN (SELECT  npi, drug_name, total_claim_count --FULL JOIN CONNECTING TABLE WITH CLAIM INFO
			FROM prescription INNER JOIN prescriber USING(npi) INNER JOIN drug USING(drug_name)
			WHERE specialty_description = 'Pain Management'
	  		AND nppes_provider_city ILIKE 'nashville'
			AND opioid_drug_flag = 'Y') AS claims ON ndc.npi = claims.npi AND ndc.drug_name = claims.drug_name
ORDER BY npi
	

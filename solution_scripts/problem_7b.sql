SELECT ndc.npi, ndc.drug_name,claims.total_claim_count
FROM (SELECT npi, drug_name FROM prescriber, drug 
	  WHERE specialty_description = 'Pain Management'
	  	AND nppes_provider_city ILIKE 'nashville' 
	  	AND opioid_drug_flag LIKE 'Y') AS ndc
	FULL JOIN (SELECT  npi, drug_name, total_claim_count
			FROM prescription INNER JOIN prescriber USING(npi) INNER JOIN drug USING(drug_name)
			WHERE specialty_description = 'Pain Management'
	  		AND nppes_provider_city ILIKE 'nashville'
			AND opioid_drug_flag = 'Y') AS claims ON ndc.npi = claims.npi AND ndc.drug_name = claims.drug_name
ORDER BY npi
	

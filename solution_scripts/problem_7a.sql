SELECT npi, drug_name, specialty_description, nppes_provider_city
FROM prescriber, drug
WHERE specialty_description = 'Pain Management'
	AND nppes_provider_city ILIKE 'nashville'
	AND opioid_drug_flag LIKE 'Y'
ORDER BY npi;
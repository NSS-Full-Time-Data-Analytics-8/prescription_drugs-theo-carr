SELECT prescriber.npi, 
nppes_provider_first_name,
	nppes_provider_last_org_name, 
	specialty_description, 
	SUM(total_claim_count) AS grand_total
FROM prescription
INNER JOIN prescriber ON prescription.npi = prescriber.npi
GROUP BY prescriber.npi,nppes_provider_first_name,nppes_provider_last_org_name,specialty_description
ORDER BY grand_total DESC
LIMIT 1;
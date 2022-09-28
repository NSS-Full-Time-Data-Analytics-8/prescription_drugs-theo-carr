SELECT nppes_provider_first_name,
	nppes_provider_last_org_name, 
	specialty_description, 
	total_claim_count
FROM prescription
INNER JOIN prescriber ON prescription.npi = prescriber.npi
ORDER BY total_claim_count DESC
LIMIT 1;
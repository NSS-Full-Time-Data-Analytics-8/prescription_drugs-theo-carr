SELECT drug_name, 
		total_claim_count, 
		opioid_drug_flag AS opioid,
		CONCAT(nppes_provider_first_name,' ', nppes_provider_last_org_name) AS prescribed_by
FROM prescription
	INNER JOIN drug USING(drug_name)
	INNER JOIN prescriber ON prescription.npi = prescriber.npi
WHERE total_claim_count > 3000
ORDER BY total_claim_count DESC;


SELECT drug_name, total_claim_count, opioid_drug_flag AS opioid
FROM prescription
	INNER JOIN drug USING(drug_name)
WHERE total_claim_count > 3000
ORDER BY total_claim_count DESC;


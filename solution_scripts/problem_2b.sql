SELECT specialty_description, SUM(total_claim_count) AS total_claims
FROM prescription 
	INNER JOIN prescriber USING(npi) 
	INNER JOIN drug ON prescription.drug_name = drug.drug_name
WHERE drug.opioid_drug_flag = 'Y'
GROUP BY specialty_description
ORDER BY total_claims DESC;
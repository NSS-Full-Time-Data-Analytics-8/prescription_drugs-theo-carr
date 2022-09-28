SELECT specialty_description, total_opioid_claims, total_claims,
		CONCAT(ROUND(total_opioid_claims/total_claims * 100,2)::TEXT,'%') AS percent_opioid
FROM
	(SELECT 
			DISTINCT specialty_description,
			SUM(CASE WHEN opioid_drug_flag = 'Y' THEN total_claim_count
				ELSE 0 END) AS total_opioid_claims ,
			SUM(total_claim_count) AS total_claims
		FROM prescription
			INNER JOIN drug USING(drug_name)
			INNER JOIN prescriber ON prescription.npi = prescriber.npi
		WHERE total_claim_count IS NOT NULL
		GROUP BY specialty_description) AS ft -- full table
ORDER BY total_opioid_claims/total_claims DESC;
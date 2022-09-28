SELECT 
	DISTINCT specialty_description,
	COUNT(total_claim_count) AS total_claims
FROM prescription
FULL JOIN prescriber ON prescription.npi = prescriber.npi
GROUP BY specialty_description
HAVING COUNT(total_claim_count) = 0 
;
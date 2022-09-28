SELECT fp.generic_name, fp.total_claims AS fp_total, c.total_claims AS c_total,
		fp.total_claims + c.total_claims AS total_claim
FROM (SELECT specialty_description,drug_name,generic_name, SUM(total_claim_count) AS total_claims
		FROM prescription INNER JOIN prescriber USING(npi) INNER JOIN drug USING(drug_name)
		WHERE specialty_description LIKE 'Family Practice'
		GROUP BY drug_name,specialty_description,generic_name) AS fp -- family_practice
	INNER JOIN (SELECT specialty_description,drug_name,generic_name, SUM(total_claim_count) AS total_claims
					FROM prescription INNER JOIN prescriber USING(npi) INNER JOIN drug USING(drug_name)
					WHERE specialty_description LIKE 'Cardiology'
					GROUP BY drug_name,specialty_description,generic_name) AS c --cardiology
		USING(drug_name)
ORDER BY total_claim DESC;

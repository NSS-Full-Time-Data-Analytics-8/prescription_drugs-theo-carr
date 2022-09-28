SELECT specialty_description,drug_name,generic_name, SUM(total_claim_count) AS total_claims
FROM prescription INNER JOIN prescriber USING(npi) INNER JOIN drug USING(drug_name)
WHERE specialty_description LIKE 'Family Practice'
GROUP BY drug_name,specialty_description,generic_name
ORDER BY total_claims DESC

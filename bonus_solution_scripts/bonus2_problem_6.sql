SELECT specialty_description, opioid_drug_flag, SUM(total_claim_count) AS total_claims
FROM prescriber INNER JOIN prescription USING(npi) INNER JOIN drug USING(drug_name)
WHERE specialty_description ILIKE '%pain management%'
GROUP BY  ROLLUP(specialty_description, opioid_drug_flag)
SELECT npi, drug.drug_name, SUM(total_claim_count) AS total_sold
FROM prescription
	INNER JOIN prescriber USING(npi)
	full JOIN drug USING(drug_name)
WHERE specialty_description = 'Pain Management'
	AND nppes_provider_city ILIKE 'nashville'
	AND drug.opioid_drug_flag = 'Y'
--where npi = '1003000282'
GROUP BY npi,drug.drug_name
--ORDER BY total_sold DESC;;
	
SELECT  
		CASE 
			WHEN opioid_drug_flag = 'Y' THEN 'opioid'
			WHEN antibiotic_drug_flag = 'Y' THEN 'antibiotic'
			ELSE 'neither' END AS drug_type,
		CAST(SUM(total_drug_cost) AS MONEY) AS total_cost
FROM drug INNER JOIN prescription USING(drug_name)
GROUP BY drug_type
ORDER BY total_cost DESC;
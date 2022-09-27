SELECT generic_name, SUM(total_drug_cost) AS total_cost
FROM prescription 
	INNER JOIN drug USING(drug_name)
GROUP BY generic_name
ORDER BY total_cost  DESC;
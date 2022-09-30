SELECT generic_name, 
		COUNT(drug_name) AS entries,
		SUM(total_drug_cost) AS total_cost,
		SUM(total_day_supply) AS total_days,
		ROUND(SUM(total_drug_cost)/SUM(total_day_supply),2)::MONEY AS cost_per_day

FROM prescription 
	INNER JOIN drug USING(drug_name)
GROUP BY generic_name
ORDER BY cost_per_day DESC;

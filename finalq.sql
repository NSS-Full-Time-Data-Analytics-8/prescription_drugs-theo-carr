WITH drug_category AS
		(SELECT drug_name, 
			generic_name,
			CASE WHEN generic_name ILIKE '%hydrocodone%' THEN 'hydrocodone'
				WHEN generic_name ILIKE '%oxycodone%' THEN 'oxycodone'
				WHEN generic_name ILIKE '%oxymorphone%' THEN 'oxymorphone'
				WHEN generic_name ILIKE '%morphine%' THEN 'morphine'
				WHEN generic_name ILIKE '%codeine%' THEN 'codeine'
				WHEN generic_name ILIKE '%fentanyl%' THEN 'fentanyl'
				ELSE 'error' END AS opioid_category

			FROM drug
			WHERE opioid_drug_flag = 'Y'
			ORDER BY opioid_category),
	city_column AS 
		(SELECT DISTINCT nppes_provider_city AS city
		FROM prescriber
		WHERE nppes_provider_city IN('NASHVILLE','KNOXVILLE','MEMPHIS','CHATTANOOGA'))
		
SELECT city_column.city AS row_name,  opioid_category  AS category_column
FROM drug INNER JOIN drug_category USING(drug_name), city_column
WHERE opioid_category NOT ILIKE 'error'
ORDER BY opioid_category;
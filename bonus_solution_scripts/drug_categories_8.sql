SELECT 
	drug_name,
	generic_name,
	CASE 
		WHEN generic_name ILIKE '%codeine%' THEN 'codeine' 
		WHEN generic_name ILIKE '%fentanyl%' THEN 'fentanyl' 
		WHEN generic_name ILIKE '%hydrocodone%' THEN 'hydrocodone' 
		WHEN generic_name ILIKE '%morphine%' THEN 'morphine' 
		WHEN generic_name ILIKE '%oxycodone%' THEN 'oxycodone' 
		WHEN generic_name ILIKE '%oxymorph%' THEN 'oxymorphine' 
		END AS category
		
FROM DRUG
WHERE opioid_drug_flag = 'Y'
ORDER BY category DESC NULLS LAST
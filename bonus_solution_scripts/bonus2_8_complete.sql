
SELECT *
FROM CROSSTAB('WITH drug_category AS 
		(SELECT 
			drug_name,
			generic_name,
			CASE 
				WHEN generic_name ILIKE ''%codeine%'' THEN ''codeine'' 
				WHEN generic_name ILIKE ''%fentanyl%'' THEN ''fentanyl'' 
				WHEN generic_name ILIKE ''%hydrocodone%'' THEN ''hydrocodone'' 
				WHEN generic_name ILIKE ''%morphine%'' THEN ''morphine'' 
				WHEN generic_name ILIKE ''%oxycodone%'' THEN ''oxycodone''
				WHEN generic_name ILIKE ''%oxymorph%'' THEN ''oxymorphine''
		 		ELSE ''no category''
				END AS category 
			FROM DRUG
			WHERE opioid_drug_flag = ''Y''
			ORDER BY category DESC NULLS LAST) 
		SELECT  nppes_provider_city,  category, SUM(total_claim_count) AS total_claims
		FROM prescriber CROSS JOIN drug_category
		LEFT JOIN prescription USING(npi,drug_name)
	    WHERE nppes_provider_city IN (''CHATTANOOGA'',''NASHVILLE'',''MEMPHIS'',''KNOXVILLE'') AND category <> ''no category''
		GROUP BY nppes_provider_city, category
		ORDER BY 1,2') 
		AS please_work(nppes_provider_city text, 
					   "codeine" numeric,"fentanyl" numeric,
					   "hydrocodone" numeric,"morphine" numeric,
					   "oxycodone" numeric, 
					   "oxymorphone" numeric);
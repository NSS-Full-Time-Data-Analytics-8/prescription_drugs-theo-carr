SELECT COUNT(CASE WHEN prescription_npi IS NULL THEN 'no_match' END) AS no_match_count
FROM	
	(SELECT DISTINCT prescriber.npi as prescriber_npi, prescription.npi as prescription_npi
		FROM prescriber LEFT JOIN prescription USING(npi)) AS npicomp
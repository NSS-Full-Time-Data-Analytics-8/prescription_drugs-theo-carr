

SELECT specialty_description, SUM(total_claim_count) AS total_claims
FROM prescriber INNER JOIN prescription USING(npi)
WHERE specialty_description ILIKE '%pain management%'
GROUP BY specialty_description

UNION

SELECT null as specialty_description, sum(total_claim_count)
FROM prescription INNER JOIN prescriber USING(npi)
WHERE specialty_description ILIKE '%pain management%'
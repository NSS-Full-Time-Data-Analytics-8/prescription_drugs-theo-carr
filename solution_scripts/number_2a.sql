SELECT specialty_description, SUM(total_claim_count) AS total_claims
FROM prescription INNER JOIN prescriber USING(npi)
GROUP BY specialty_description
ORDER BY total_claims DESC;
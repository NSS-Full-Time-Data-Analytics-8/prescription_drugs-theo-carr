SELECT drug_name, total_claim_count
FROM prescription
WHERE total_claim_count > 3000
ORDER BY total_claim_count DESC;


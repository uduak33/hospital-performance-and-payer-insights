--UNCOMPENSATED CARE
WITH hospital_cost AS (
SELECT
        e.encounter_class,
        e.payer_id,
        p."name" AS insurance_name,
        SUM(e.total_claim_cost)  AS total_cost_of_service,
        SUM(e.payer_coverage )  AS total_cost_paid_by_insurance,
        SUM(e.total_claim_cost) - SUM(e.payer_coverage ) AS hospital_loss
FROM 
        encounters e
JOIN payers p 
        ON e.payer_id = p.id
GROUP BY 
        e.encounter_class,
        e.payer_id, 
        p."name"
ORDER BY 
        hospital_loss DESC 
)
SELECT *,
      ROUND((hc.hospital_loss/hc.total_cost_of_service * 100),2) AS percentage_loss
FROM hospital_cost hc
-- INSURANCE DISTRIBUTION ACROSS PATIENTS
SELECT DISTINCT 
        e.encounter_class, 
        e.payer_id,
        p."name" AS insurance_name,    
        count(DISTINCT e.patient_id) AS patient_number 
FROM 
        encounters e 
INNER JOIN payers p 
        ON e.payer_id = p.id 
GROUP BY 
        e.encounter_class,
        e.payer_id,
        p."name"
ORDER BY 
        patient_number DESC 


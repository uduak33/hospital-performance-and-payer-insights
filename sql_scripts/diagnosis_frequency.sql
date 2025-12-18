--  DIAGNOSIS FREQUENCY
SELECT 
        e.encounter_class, 
        e.reason_description,
        COUNT (*) AS diagnosis_frequency      
FROM 
        encounters e
WHERE 
        e.reason_description IS NOT NULL
GROUP BY 
        e.encounter_class,
        e.reason_description 
ORDER BY 
        diagnosis_frequency DESC
        

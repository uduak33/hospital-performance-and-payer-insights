-- ENCOUNTER VOLUME OVER TIME
SELECT 
        e.id,
        e.encounter_class,
        e.start_date  ,
        e.stop_date 
FROM encounters e
WHERE 
        e.start_date >= '2000-01-01 00:00:00'
ORDER BY 
        e.start_date 

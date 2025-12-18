--  MORTALITY COUNT
SELECT 
        p.id,
        p.birth_date,
        p.death_date 
FROM
        patients p 
WHERE 
        p.death_date IS NOT NULL AND 
        p.death_date >= '2000-01-01'
ORDER BY 
        p.death_date 
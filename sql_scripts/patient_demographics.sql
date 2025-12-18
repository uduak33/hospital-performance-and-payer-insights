--  PATIENT DEMOGRAPHICS AGE/GENDER
SELECT  
        p.id,
        p.birth_date,
        p.gender,
        EXTRACT (YEAR FROM (AGE ('2025-11-22',p.birth_date)))  AS age_in_years         
FROM
        patients p
WHERE
        p.death_date IS NULL 
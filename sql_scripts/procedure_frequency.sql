--Q4.  PROCEDURE FREQUENCY 
SELECT DISTINCT  
        e.encounter_class, 
        p.description,
        count(p.description)  AS procedure_frequency
FROM
        "procedures" p 
INNER JOIN encounters e 
        ON p.encounter_id = e.id
GROUP BY
        e.encounter_class,
        p.description
ORDER BY 
        procedure_frequency DESC
       

--CALCULATE THE AVERAGE LENGTH OF STAY OF PATIENTS BY DIAGNOSIS AND DEPARTMENTS
SELECT  
          iddm.department,
          iddm.reason_description AS diagnosis, 
          ROUND(
            AVG(EXTRACT(EPOCH FROM (e.stop_date - e.start_date)) / 86400),
            1
      ) AS avg_length_of_stay_in_days
FROM 
        encounters e 
LEFT JOIN 
        inpatient_diagnosis_department_mapping  iddm USING (reason_code) 
WHERE 
        encounter_class = 'inpatient'
GROUP BY 
        iddm.department,
        iddm.reason_description
ORDER BY 
        avg_length_of_stay_in_days DESC 

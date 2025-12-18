--CALCULATE THE RELATIONSHIP BETWEEN DIAGNOSIS TYPE AND READMISSION RATE(GROUPED BY DEPARTMENT AND DIAGNOSIS)
WITH readmission_duration  AS 
(
SELECT 
        e.patient_id ,
        e.id AS encounter_id,
        e.reason_code ,
        e.reason_description ,
        iddm.department ,
        e.start_date :: date  AS admission_date,
        e.stop_date  :: date AS discharge_date,
        LEAD( e.start_date) OVER (PARTITION BY e.patient_id ORDER BY e.start_date )  :: date  AS next_admission_date,
        (LEAD( e.start_date) OVER (PARTITION BY e.patient_id ORDER BY e.start_date )) - ( e.stop_date ) AS readmission_duration
FROM 
         encounters e  
LEFT JOIN inpatient_diagnosis_department_mapping iddm 
        ON e.reason_code = iddm.reason_code 
WHERE 
        e.encounter_class = 'inpatient'
)
, flagged AS (
    SELECT
        department,
        reason_description AS diagnosis,
        readmission_duration,
        CASE 
            WHEN next_admission_date IS NOT NULL 
                 AND readmission_duration <= INTERVAL '30 days'
                 AND readmission_duration > INTERVAL '0 days'
            THEN 1 
            ELSE 0 
        END AS readmission_flag
    FROM readmission_duration
)
SELECT
        department,
        diagnosis, 
        COUNT(*) AS total_admissions,
        SUM(readmission_flag) AS readmissions_within_30_days,
        ROUND( SUM(readmission_flag)::numeric / COUNT(*) * 100, 2 ) AS readmission_rate_percent
FROM flagged
GROUP BY
        department,
        diagnosis 
ORDER BY readmission_rate_percent DESC;

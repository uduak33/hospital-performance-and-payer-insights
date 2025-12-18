CREATE TABLE diagnosis_department_mapping AS 
(
WITH unique_diagnosis AS (
SELECT DISTINCT
        e.reason_code ,
        e.reason_description
FROM 
        encounters e 
WHERE 
        e.encounter_class = 'inpatient'
ORDER BY 
        e.reason_description 
)
SELECT 
        *,
CASE
        WHEN reason_description = 'Abnormal findings diagnostic imaging heart+coronary circulat (finding)' THEN 'cardiology'
        WHEN reason_description = 'Acute myeloid leukemia (disorder)' THEN 'hematology'
        WHEN reason_description = 'Acute non-ST segment elevation myocardial infarction (disorder)' THEN 'cardiology'
        WHEN reason_description = 'Acute ST segment elevation myocardial infarction (disorder)' THEN 'cardiology'
        WHEN reason_description = 'Aortic valve regurgitation (disorder)' THEN 'cardiology'
        WHEN reason_description = 'Aortic valve stenosis (disorder)' THEN 'cardiology'
        WHEN reason_description = 'Appendicitis (disorder)' THEN 'general_surgery'
        WHEN reason_description = 'At increased risk for suicide (finding)' THEN 'psychiatry'
        WHEN reason_description = 'Awaiting transplantation of bone marrow (situation)' THEN 'hematology'
        WHEN reason_description = 'Awaiting transplantation of kidney (situation)' THEN 'nephrology'
        WHEN reason_description = 'Chronic congestive heart failure (disorder)' THEN 'cardiology'
        WHEN reason_description = 'Chronic obstructive bronchitis (disorder)' THEN 'respiratory'
        WHEN reason_description = 'Cystic fibrosis (disorder)' THEN 'respiratory'
        WHEN reason_description = 'Dependent drug abuse (disorder)' THEN 'psychiatry'
        WHEN reason_description = 'Disease caused by severe acute respiratory syndrome coronavirus 2 (disorder)' THEN 'respiratory'
        WHEN reason_description = 'History of aortic valve repair (situation)' THEN 'cardiology'
        WHEN reason_description = 'History of aortic valve replacement (situation)' THEN 'cardiology'
        WHEN reason_description = 'History of artificial joint (situation)' THEN 'orthopedic'
        WHEN reason_description = 'History of coronary artery bypass grafting (situation)' THEN 'cardiology'
        WHEN reason_description = 'Injury of anterior cruciate ligament (disorder)' THEN 'orthopedic'
        WHEN reason_description = 'Injury of medial collateral ligament of knee (disorder)' THEN 'orthopedic'
        WHEN reason_description = 'Injury of tendon of the rotator cuff of shoulder (disorder)' THEN 'orthopedic'
        WHEN reason_description = 'Leukemia  disease (disorder)' THEN 'hematology'
        WHEN reason_description = 'Malignant neoplasm of breast (disorder)' THEN 'general_surgery'
        WHEN reason_description = 'Malignant neoplasm of colon (disorder)' THEN 'general_surgery'
        WHEN reason_description = 'Meningomyelocele (disorder)' THEN 'neurosurgery'
        WHEN reason_description = 'Metastatic malignant neoplasm to colon (disorder)' THEN 'general_surgery'
        WHEN reason_description = 'Multiple myeloma (disorder)' THEN 'hematology'
        WHEN reason_description = 'Neuropathy due to type 2 diabetes mellitus (disorder)' THEN 'endocrinology'
        WHEN reason_description = 'Non-small cell carcinoma of lung  TNM stage 1 (disorder)' THEN 'respiratory'
        WHEN reason_description = 'Overlapping malignant neoplasm of colon (disorder)' THEN 'general_surgery'
        WHEN reason_description = 'Preinfarction syndrome (disorder)' THEN 'cardiology'
        WHEN reason_description = 'Primary malignant neoplasm of colon (disorder)' THEN 'general_surgery'
        WHEN reason_description = 'Primary small cell malignant neoplasm of lung  TNM stage 1 (disorder)' THEN 'respiratory'
        WHEN reason_description = 'Pulmonary emphysema (disorder)' THEN 'respiratory'
        WHEN reason_description = 'Rupture of patellar tendon (disorder)' THEN 'orthopedic'
        WHEN reason_description = 'Sleep disorder (disorder)' THEN 'psychiatry'
        WHEN reason_description = 'Sterilization requested (situation)' THEN 'general_surgery'
        WHEN reason_description = 'Tubal pregnancy (disorder)' THEN 'obgyn'
END AS department 

FROM unique_diagnosis 
)
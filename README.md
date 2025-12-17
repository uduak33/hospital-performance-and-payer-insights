# Hospital Performance and Payer Insights
## Operational, Clinical, and Financial Insights from Synthetic EHR Data

## Executive Overview

Hospitals operate in an environment of increasing clinical complexity, financial pressure, and rising demand for timely, high-quality care. Leadership teams require clear, data-driven insights to understand where operational bottlenecks exist, which clinical areas drive risk and cost, and how patient utilization patterns are evolving over time.

This analysis was conducted to support hospital performance monitoring and payer exposure assessment, with insights and recommendations focusing on three core domains:
- Clinical performance (length of stay and readmissions)
- Financial exposure (uncompensated care and payer distribution)
- Service utilization and demand trends (diagnoses, procedures, and encounter volumes)

Using encounter-level electronic health record (EHR) data, the project evaluates how patient flow, clinical outcomes, and financial risk vary across encounter classes, diagnoses, and payer types. The goal is not retrospective reporting alone, but to provide leadership with actionable insight to inform resource allocation, quality improvement initiatives, and payer strategy.

The analysis is presented through an interactive Tableau Story, supported by structured SQL queries and a clearly defined data model. While the dataset used is synthetically generated, it is treated throughout this work as a proxy for real hospital data, with clinical assumptions applied consistently to reflect real-world hospital operations.

- Tableau Story (Interactive Dashboards): [link to be added]
- SQL Queries Used for Analysis: [link to repository folder]
- Synthetic EHR Dataset (Synthea): [link to dataset folder]
- Entity Relationship Diagram (ERD): [link to ERD diagram]

## Data Structure & Initial Checks

The analysis is based on encounter-level electronic health record (EHR) data generated using Synthea, an open-source synthetic patient generator. While the data is synthetically generated, it is treated throughout this analysis as a proxy for real hospital data, with clinical and operational assumptions applied consistently to reflect real-world hospital operations.

### Data Generation Context

Data generation date: 25/10/2025
Project analysis period: 01/11/2025 – 17/12/2025
Encounter history covered: 2000–2025 (with certain financial fields extending the entire dataset)

The Synthea generator produced a relational dataset comprising 18 core tables. For the purposes of this analysis, only tables directly relevant to hospital operations, clinical performance, and payer exposure were retained.

### Tables Used in Analysis

Out of the full Synthea schema, five tables were used:
- patients – patient demographics and identifiers
- encounters – encounter-level activity, dates, encounter class, outcomes, and utilization
- procedures – performed clinical services linked to encounters
- payers – insurance coverage and payer attributes
- inpatient_department_mapping – custom table created to support inpatient clinical analysis

A full Entity Relationship Diagram (ERD) is provided here:
ERD: [link to ERD diagram]

### Custom Clinical Modeling Decisions

To support clinically valid analysis of length of stay (LOS) and readmissions, a custom inpatient_department_mapping table was created.
- Departments were clinically inferred from diagnosis descriptions rather than relying solely on raw encounter class labels.
- This mapping was performed manually using clinical expertise to align diagnoses with realistic inpatient service lines (e.g., respiratory, cardiology, general surgery).
- The approach reflects how inpatient analytics are typically structured in real hospital environments, where diagnosis context—not encounter labels alone—drives departmental attribution.

### Initial Data Validation & Quality Checks

Before analysis, the following checks were performed:
- Verified unique patient and encounter identifiers
- Confirmed date continuity and encounter sequencing
- Validated LOS calculations using encounter start and stop timestamps
- Ensured readmission logic aligned with 30-day inpatient readmission definitions

Reviewed payer assignments to confirm that multiple insurance records per patient were expected and appropriate

No material data integrity issues were identified that would invalidate descriptive or directional analysis.

## Executive Summary

Hospital encounter volumes have increased substantially over time, driven primarily by ambulatory care growth, while clinical efficiency and readmission risk remain concentrated within a limited subset of diagnoses. Financial exposure is driven less by overall volume and more by payer mix, with uninsured encounters accounting for the highest proportion of uncompensated care. Together, these patterns highlight clear opportunities for diagnosis-level operational improvement, targeted financial interventions, and forward-looking capacity planning.

![encounter_volume_over_time](https://github.com/user-attachments/assets/4a2081f7-3ee5-4d09-9107-856a40a7cd09)


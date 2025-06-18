-- Query Roll Up
SELECT 
    LEFT(d.admission_date, 4) AS year,
    SUM(TRY_CAST(TRY_CAST(f.billing_amount AS FLOAT) AS BIGINT)) AS total_billing
FROM [dbo].[OLE DB Fact] f
JOIN [dbo].[OLE DB Date] d ON f.date_id = d.date_id
GROUP BY LEFT(d.admission_date, 4);


SELECT 
    LEFT(d.admission_date, 4) AS year,
    COUNT(DISTINCT f.patient_id) AS total_patients
FROM [dbo].[OLE DB Fact] f
JOIN [dbo].[OLE DB Date] d ON f.date_id = d.date_id
GROUP BY LEFT(d.admission_date, 4);


--Query Drill Down
SELECT 
    LEFT(d.admission_date, 4) AS year,
    SUBSTRING(d.admission_date, 6, 2) AS month,
    SUM(TRY_CAST(TRY_CAST(f.billing_amount AS FLOAT) AS BIGINT)) AS total_billing
FROM [dbo].[OLE DB Fact] f
JOIN [dbo].[OLE DB Date] d ON f.date_id = d.date_id
GROUP BY LEFT(d.admission_date, 4), SUBSTRING(d.admission_date, 6, 2)
ORDER BY year, month;




SELECT 
    d.admission_date,
    COUNT(DISTINCT f.patient_id) AS total_patients
FROM [dbo].[OLE DB Fact] f
JOIN [dbo].[OLE DB Date] d ON f.date_id = d.date_id
GROUP BY d.admission_date
ORDER BY d.admission_date;

--Query Slice
SELECT 
    d.gender,
    COUNT(DISTINCT f.patient_id) AS total_patients,
    SUM(TRY_CAST(f.billing_amount AS FLOAT)) AS total_billing
FROM [dbo].[OLE DB Fact] f
JOIN [dbo].[OLE DB Patient] d ON f.patient_id = d.patient_id
WHERE d.gender = 'Female'
GROUP BY d.gender;

SELECT 
    p.medical_condition,
    COUNT(DISTINCT f.patient_id) AS total_patients,
    SUM(TRY_CAST(f.billing_amount AS FLOAT)) AS total_billing
FROM [dbo].[OLE DB Fact] f
JOIN [dbo].[OLE DB Patient] p ON f.patient_id = p.patient_id
WHERE p.medical_condition = 'Diabetes'
GROUP BY p.medical_condition;


--Query Dice
SELECT 
    p.gender,
    p.medical_condition,
    COUNT(DISTINCT f.patient_id) AS total_patients,
    SUM(TRY_CAST(f.billing_amount AS FLOAT)) AS total_billing
FROM [dbo].[OLE DB Fact] f
JOIN [dbo].[OLE DB Patient] p ON f.patient_id = p.patient_id
WHERE p.gender IN ('Female', 'Male')
  AND p.medical_condition IN ('Diabetes', 'Hypertension')
GROUP BY p.gender, p.medical_condition;

SELECT 
    p.age,
    p.blood_type,
    COUNT(DISTINCT f.patient_id) AS total_patients,
    SUM(TRY_CAST(f.billing_amount AS FLOAT)) AS total_billing
FROM [dbo].[OLE DB Fact] f
JOIN [dbo].[OLE DB Patient] p ON f.patient_id = p.patient_id
WHERE TRY_CAST(p.age AS INT) > 50
  AND p.blood_type IN ('O-', 'O+')
GROUP BY p.age, p.blood_type;

--Query Pivot
SELECT *
FROM (
    SELECT 
        LEFT(d.admission_date, 4) AS year,
        TRY_CAST(f.billing_amount AS FLOAT) AS billing
    FROM [dbo].[OLE DB Fact] f
    JOIN [dbo].[OLE DB Date] d ON f.date_id = d.date_id
) AS source_table
PIVOT (
    SUM(billing)
    FOR year IN ([2019], [2020], [2021], [2022], [2023], [2024])
) AS pivot_table;



SELECT *
FROM (
    SELECT 
        p.medical_condition,
        p.gender,
        f.patient_id
    FROM [dbo].[OLE DB Fact] f
    JOIN [dbo].[OLE DB Patient] p ON f.patient_id = p.patient_id
) AS source_table
PIVOT (
    COUNT(patient_id)
    FOR gender IN ([Male], [Female])
) AS pivot_table;


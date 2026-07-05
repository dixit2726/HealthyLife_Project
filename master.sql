-- =========================
-- Day 1:
-- =========================


use Fact_Patient_LTV;
SELECT COUNT(*) FROM Fact_Patient_LTV;
SELECT COUNT(*) FROM Dim_Patient;
SELECT COUNT(*) FROM Dim_Department;
SELECT COUNT(*) FROM Dim_Location;
SELECT COUNT(*) FROM Dim_Date;
SELECT COUNT(*) FROM Dim_Patient_Status;
SELECT
    Patient_ID,
    Last_Visit_Date,
    DATEDIFF(CURDATE(), Last_Visit_Date) AS Days_Since_Last_Visit
FROM Fact_Patient_LTV;
DESCRIBE Fact_Patient_LTV;
SELECT
    Patient_ID,
    Last_Visit_Date,
    DATEDIFF(
        CURDATE(),
        STR_TO_DATE(Last_Visit_Date,'%m/%d/%y')
    ) AS Days_Since_Last_Visit
FROM Fact_Patient_LTV;
SELECT *
FROM Fact_Patient_LTV
WHERE STR_TO_DATE(Last_Visit_Date,'%m/%d/%y')
      < STR_TO_DATE(First_Visit_Date,'%m/%d/%y');
      SELECT
    MIN(STR_TO_DATE(First_Visit_Date,'%m/%d/%y')) AS Min_First_Visit,
    MAX(STR_TO_DATE(Last_Visit_Date,'%m/%d/%y')) AS Max_Last_Visit
FROM Fact_Patient_LTV;
SELECT *
FROM Fact_Patient_LTV
WHERE Last_Visit_Date < First_Visit_Date;
SELECT *
FROM Fact_Patient_LTV
WHERE First_Visit_Date IS NULL
   OR Last_Visit_Date IS NULL;
   SELECT *
FROM Fact_Patient_LTV
WHERE STR_TO_DATE(Last_Visit_Date,'%m/%d/%y')
      < STR_TO_DATE(First_Visit_Date,'%m/%d/%y');
-- Churn Logic:
-- Patient is considered churned if last visit was more than 180 days ago

SELECT * 
FROM vw_Churned_Patients;
DROP VIEW IF EXISTS vw_Churned_Patients;

CREATE VIEW vw_Churned_Patients AS
SELECT
    Patient_ID,
    Patient_Name,
    Last_Visit_Date,
    DATEDIFF(
        CURDATE(),
        STR_TO_DATE(Last_Visit_Date,'%m/%d/%y')
    ) AS Days_Since_Last_Visit,
    CASE
        WHEN DATEDIFF(
            CURDATE(),
            STR_TO_DATE(Last_Visit_Date,'%m/%d/%y')
        ) > 180
        THEN 'Churned'
        ELSE 'Active'
    END AS Churn_Status
FROM Fact_Patient_LTV;
SELECT
    Churn_Status,
    COUNT(*) AS Total_Patients
FROM vw_Churned_Patients
GROUP BY Churn_Status;
/*
Business Rule:
A patient is considered churned if he/she
has not visited the hospital for more than
180 days (6 months).

Threshold = 180 Days

If Days_Since_Last_Visit > 180 → Churned
Else → Active
*/
SELECT Churn_Status, COUNT(*)
FROM vw_Churned_Patients
GROUP BY Churn_Status;


CREATE VIEW vw_Total_Spend_Per_Patient AS
SELECT
    Patient_ID,
    Patient_Name,
    SUM(Total_Billing) AS Total_Spend
FROM Fact_Patient_LTV
GROUP BY Patient_ID, Patient_Name;
SELECT *
FROM vw_Total_Spend_Per_Patient
ORDER BY Total_Spend DESC;
SELECT *
FROM vw_Total_Spend_Per_Patient
ORDER BY Total_Spend DESC;

SELECT
    p.Patient_ID,
    p.Gender,
    p.Age_Group,
    p.Blood_Group,
    p.Insurance_Type,
    SUM(f.Total_Billing) AS Total_Revenue
FROM Fact_Patient_LTV f
JOIN Dim_Patient p
ON f.Patient_Key = p.Patient_Key
GROUP BY
    p.Patient_ID,
    p.Gender,
    p.Age_Group,
    p.Blood_Group,
    p.Insurance_Type;
SELECT
    p.Patient_ID,
    p.Gender,
    p.Age_Group,
    p.Blood_Group,
    p.Insurance_Type,
    SUM(f.Total_Billing) AS Total_Revenue
FROM Fact_Patient_LTV f
JOIN Dim_Patient p
ON f.Patient_Key = p.Patient_Key
GROUP BY
    p.Patient_ID,
    p.Gender,
    p.Age_Group,
    p.Blood_Group,
    p.Insurance_Type;
    
    
-- =========================
-- Day 2:
-- =========================

SELECT
    p.Patient_ID,
    p.Gender,
    p.Age_Group,
    p.Blood_Group,
    p.Insurance_Type,
    SUM(f.Total_Billing) AS Total_Revenue
FROM Fact_Patient_LTV f
JOIN Dim_Patient p
ON f.Patient_Key = p.Patient_Key
GROUP BY
    p.Patient_ID,
    p.Gender,
    p.Age_Group,
    p.Blood_Group,
    p.Insurance_Type;
DROP TABLE IF EXISTS total_spend;

CREATE TABLE total_spend AS
SELECT *
FROM vw_Total_Spend_Per_Patient;
SELECT COUNT(*) AS Total_Rows
FROM total_spend;

SELECT
    Patient_ID,
    Patient_Name,
    Visit_Frequency,
    RANK() OVER (
        ORDER BY Visit_Frequency DESC
    ) AS Visit_Rank
FROM Fact_Patient_LTV;

-- =========================
-- Day 3and 4:
-- =========================

USE fact_patient_ltv;
SELECT
    Patient_ID,
    Patient_Name,
    Visit_Frequency,
    RANK() OVER (
        ORDER BY Visit_Frequency DESC
    ) AS Visit_Rank
FROM Fact_Patient_LTV;
SELECT
    Patient_ID,
    Patient_Name,
    Visit_Frequency
FROM Fact_Patient_LTV
ORDER BY Visit_Frequency ASC
LIMIT 10;
CREATE INDEX idx_visit_frequency
ON Fact_Patient_LTV(Visit_Frequency);
SHOW INDEX
FROM Fact_Patient_LTV;
SHOW INDEX
FROM Fact_Patient_LTV;
SHOW INDEX
FROM Fact_Patient_LTV;
#####################Day4
SELECT
    ROUND(
        SUM(CASE WHEN Churn_Status = 'Churned' THEN 1 ELSE 0 END)
        * 100.0 / COUNT(*),
        2
    ) AS Churn_Rate_Percentage
FROM vw_Churned_Patients;

SELECT
    Department,
    ROUND(AVG(Visit_Frequency),2) AS Avg_Visit_Frequency
FROM Fact_Patient_LTV
GROUP BY Department
ORDER BY Avg_Visit_Frequency DESC;
SELECT
    Department,
    COUNT(*) AS Total_Patients,
    SUM(Returning_Patient) AS Returning_Patients,
    ROUND(
        SUM(Returning_Patient) * 100.0 / COUNT(*),
        2
    ) AS Return_Rate_Percentage
FROM Fact_Patient_LTV
GROUP BY Department
ORDER BY Return_Rate_Percentage DESC;

SELECT
    CASE
        WHEN DATEDIFF(
            CURDATE(),
            STR_TO_DATE(Last_Visit_Date,'%m/%d/%y')
        ) > 180
        THEN 'Churned'
        ELSE 'Active'
    END AS Churn_Status
FROM Fact_Patient_LTV;

SELECT
    SUM(Total_Billing) AS Total_Revenue
FROM Fact_Patient_LTV;

SELECT
    p.Patient_ID,
    p.Gender,
    p.Age_Group,
    SUM(f.Total_Billing) AS Total_Revenue
FROM Fact_Patient_LTV f
JOIN Dim_Patient p
    ON f.Patient_Key = p.Patient_Key
GROUP BY
    p.Patient_ID,
    p.Gender,
    p.Age_Group;

SELECT SUM(Total_Billing) AS Total_Revenue
FROM Fact_Patient_LTV;
SELECT SUM(Total_Billing) AS Total_Revenue
FROM Fact_Patient_LTV;
    
    
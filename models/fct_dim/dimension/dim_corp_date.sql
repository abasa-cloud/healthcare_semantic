--CREATE OR REPLACE TABLE time_table AS 
WITH RECURSIVE daterange AS (
    SELECT 
        TO_DATE('2020-01-01') AS full_date
    UNION ALL
    SELECT 
        DATEADD(day, 1, full_date)
    FROM {{ source('semantics', 'corp_time_table') }}
    WHERE full_date < '2025-12-31'
)
SELECT 
    TO_NUMBER(TO_CHAR(full_date, 'YYYYMMDD')) AS dim_date_key,
    full_date,
    YEAR(full_date) AS year, 
    MONTH(full_date) AS month, 
    DAY(full_date) AS day, 
    DAYOFWEEK(full_date) AS day_of_week,
    DAYNAME(full_date) AS day_name, 
    MONTHNAME(full_date) AS month_name
FROM 
    daterange
    

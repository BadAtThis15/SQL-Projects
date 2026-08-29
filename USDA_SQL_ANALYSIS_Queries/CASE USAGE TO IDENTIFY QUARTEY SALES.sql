WITH CategorizedMilk AS (
    SELECT 
        CAST(REPLACE(Value, ',', '') AS BIGINT) AS Cleaned_Value,
        CASE 
            WHEN Period IN ('JAN', 'FEB', 'MAR') THEN 'QTR 1'
            WHEN Period IN ('APR', 'MAY', 'JUN') THEN 'QTR 2'
            WHEN Period IN ('JUL', 'AUG', 'SEP') THEN 'QTR 3'
            WHEN Period IN ('OCT', 'NOV', 'DEC') THEN 'QTR 4'
        END AS Quarter_number
    FROM milk_production
    WHERE Year = 2022
)
SELECT 
    Quarter_number,
    SUM(Cleaned_Value) AS TOTAL_AMOUNT
FROM CategorizedMilk
WHERE Quarter_number IS NOT NULL
GROUP BY Quarter_number
ORDER BY Quarter_number;
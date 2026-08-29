SELECT 
    COALESCE (CASE 
        WHEN milk_production.Period IN ('JAN', 'FEB', 'MAR') THEN 'QTR 1'
        WHEN milk_production.Period IN ('APR', 'MAY', 'JUN') THEN 'QTR 2'
        WHEN milk_production.Period IN ('JUL', 'AUG', 'SEP') THEN 'QTR 3'
        WHEN milk_production.Period IN ('OCT', 'NOV', 'DEC') THEN 'QTR 4'
    END,'No_Quarter' )AS Quarter_number,
    SUM(CAST(REPLACE(milk_production.Value, ',', '') AS BIGINT)) AS TOTAL_AMOUNT
FROM milk_production 
LEFT JOIN state_lookup
    ON milk_production.State_ANSI = state_lookup.State_ANSI
WHERE Year = 2022
GROUP BY 
    CASE 
        WHEN milk_production.Period IN ('JAN', 'FEB', 'MAR') THEN 'QTR 1'
        WHEN milk_production.Period IN ('APR', 'MAY', 'JUN') THEN 'QTR 2'
        WHEN milk_production.Period IN ('JUL', 'AUG', 'SEP') THEN 'QTR 3'
        WHEN milk_production.Period IN ('OCT', 'NOV', 'DEC') THEN 'QTR 4'
    END;

with new_table as(SELECT 
    *
FROM
    Customers
WHERE
    ï»¿Customer_ID IN (SELECT 
            Customer_ID
        FROM
            sales
        WHERE
            Product_ID IN (SELECT 
                    ï»¿Product_ID
                FROM
                    products)))
                    
SELECT 
    new_table.Customer_Name,
    sales.Product_ID,
    products.Product_Name
FROM
    new_table
        LEFT JOIN
    sales ON new_table.ï»¿Customer_ID = sales.Customer_ID
        LEFT JOIN
    products ON products.ï»¿Product_ID = sales.Product_ID



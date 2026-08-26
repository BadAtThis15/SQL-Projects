with Discounted_table as(select Customer_ID, Product_ID,Coupon_Code,Coupon_Discount,Rating,(Total_Amount) FROM sales
where Coupon_Code !="" 
order by Coupon_Code desc)

SELECT avg(Rating) as Rating ,avg(Total_Amount) as AVG_Amount FROM Discounted_table;

with Non_Discounted_table as(select Customer_ID, Product_ID,Coupon_Code,Coupon_Discount,Rating,Total_Amount FROM sales
where Coupon_Code = ""
order by Coupon_Code desc)

SELECT avg(Rating) as Rating, avg(Total_Amount) as AVG_Amount FROM Non_Discounted_table;

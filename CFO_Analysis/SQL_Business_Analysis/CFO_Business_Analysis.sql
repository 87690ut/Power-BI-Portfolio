create database Finance;
use Finance;
SELECT 
    *
FROM
    ms_financial_d;

-- 1. Total Profit by each country.
SELECT 
    Country, ROUND(SUM(profit), 2) AS Total_Profit
FROM
    ms_financial_d
GROUP BY Country
ORDER BY Total_Profit DESC;

-- 2. Top 3 selling product.
SELECT 
    Product, ROUND(SUM(Sales), 2) AS Total_Sales
FROM
    ms_financial_d
GROUP BY Product
ORDER BY Total_Sales DESC
LIMIT 3;

-- 3. 
SELECT 
    COUNT(*) AS Orders
FROM
    ms_financial_d
WHERE
    Discount_Band = 'No Discount'
        AND Profit > 20000;
 
 -- 4
SELECT 
    Product,
    ROUND((SUM(Profit) / SUM(Sales)) * 100, 2) AS Profit_Margin
FROM
    ms_financial_d
GROUP BY Product;
 
 -- 5.
SELECT 
    Year AS Yr,
    Month_Name AS Month_Name,
    SUM(Units_Sold) AS Total_Unit_Sold
FROM
    ms_financial_d
GROUP BY Yr , Month_Name
ORDER BY Total_Unit_Sold DESC;
 
 -- 6.
SELECT 
    Product, ROUND(SUM(Profit), 2) AS Total_Profit
FROM
    ms_financial_data
WHERE
    Segment = 'Government'
GROUP BY Product
ORDER BY Total_Profit DESC;
 
 -- 7.
SELECT 
    Discount_Band,
    ROUND(AVG(Units_Sold), 2) AS Units_Sold,
    ROUND(SUM(Sales), 2) AS Total_Sales
FROM
    ms_financial_d
GROUP BY Discount_Band
ORDER BY Units_Sold DESC;
 
-- 8.
 select count(*) 
 from ms_financial_d
 where Sale_Price > (select avg(Sale_Price) Avg_SALES_PRICE
 from ms_financial_d);

 
 -- 9.
 select Country, Product, sum(Profit) as Profit
 from ms_financial_d
 group by Country, Product
 order by Profit
 limit 3;
 
 -- 10.
select Product, round((sum(Gross_Sales) - sum(Sales)),2) as Total_Discount
from ms_financial_d
group by Product
order by Total_Discount desc; 
 
 -- 11.

 
 
 
 
SELECT 
    *
FROM
    ms_financial_d;
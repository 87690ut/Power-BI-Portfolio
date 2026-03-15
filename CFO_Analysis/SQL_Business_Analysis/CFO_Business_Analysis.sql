create database Finance;
use Finance;
SELECT 
    *
FROM
    ms_financial_data;

-- 1. Total Profit by each country.
SELECT 
    Country, ROUND(SUM(profit), 2) AS Total_Profit
FROM
    ms_financial_data
GROUP BY Country
ORDER BY Total_Profit DESC;

-- 2. Top 3 selling product.
SELECT 
    Product, ROUND(SUM(Sales), 2) AS Total_Sales
FROM
    ms_financial_data
GROUP BY Product
ORDER BY Total_Sales DESC
LIMIT 3;

-- 3. 
SELECT 
    COUNT(*) AS Orders
FROM
    ms_financial_data
WHERE
    `Discount Band` = 'No Discount'
        AND Profit > 20000;
 
 -- 4
SELECT 
    Product,
    ROUND((SUM(Profit) / SUM(Sales)) * 100, 2) AS Profit_Margin
FROM
    ms_financial_data
GROUP BY Product;
 
 -- 5.
SELECT 
    Year AS Yr,
    `Month Name` AS Month_Name,
    SUM(`Units Sold`) AS Total_Unit_Sold
FROM
    ms_financial_data
GROUP BY Yr , `Month Name`
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
    `Discount Band`,
    ROUND(AVG(`Units Sold`), 2) AS Units_Sold,
    ROUND(SUM(Sales), 2) AS Total_Sales
FROM
    ms_financial_data
GROUP BY `Discount Band`
ORDER BY Units_Sold DESC;
 
-- 8.
 

 
 
SELECT 
    *
FROM
    ms_financial_data;

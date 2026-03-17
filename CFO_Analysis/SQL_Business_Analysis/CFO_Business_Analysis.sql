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
SELECT 
    COUNT(*)
FROM
    ms_financial_d
WHERE
    Sale_Price > (SELECT 
            AVG(Sale_Price) Avg_SALES_PRICE
        FROM
            ms_financial_d);

 
 -- 9.
SELECT 
    Country, Product, SUM(Profit) AS Profit
FROM
    ms_financial_d
GROUP BY Country , Product
ORDER BY Profit
LIMIT 3;
 
 -- 10.
SELECT 
    Product,
    ROUND((SUM(Gross_Sales) - SUM(Sales)), 2) AS Total_Discount
FROM
    ms_financial_d
GROUP BY Product
ORDER BY Total_Discount DESC;
 
 -- 11.
SELECT 
    ROUND((SELECT 
                    SUM(Sales)
                FROM
                    ms_financial_d
                WHERE
                    Country = 'United States Of America') / (SELECT 
                    SUM(Sales)
                FROM
                    ms_financial_d) * 100,
            2) AS USA_Contribution_per;


-- 12.
SELECT 
    Country,
    ROUND(SUM(CASE
                WHEN YEAR(Date) = 2013 THEN Profit
                ELSE 0
            END),
            2) AS Profit_2013,
    ROUND(SUM(CASE
                WHEN YEAR(Date) = 2014 THEN Profit
                ELSE 0
            END),
            2) AS Profit_2014
FROM
    ms_financial_d
GROUP BY Country;

-- 13.
SELECT 
    Product,
    ROUND(SUM(Manufacturing_Price), 2) AS Manufacturing_Price,
    ROUND(SUM(COGS), 2) AS COGS,
    ROUND(SUM(Profit), 2) AS Total_Profit
FROM
    ms_financial_d
GROUP BY Product;
 
 -- 14
SELECT 
    Product,
    ROUND(SUM(Sales), 2) AS Total_sales,
    ROUND(SUM(Profit), 2) AS Total_profit
FROM
    ms_financial_d
WHERE
    Product LIKE 'V%'
GROUP BY Product;
 
 
 
SELECT 
    *
FROM
    ms_financial_d;
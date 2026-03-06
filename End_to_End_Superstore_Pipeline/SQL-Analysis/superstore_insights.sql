create database superstore;
use superstore;
select * from superstore_cleaned;
-- 1.
select category, sub_category,
round(sum(sales),2) as Total_Sales, round(sum(profit),2) as Total_Profit, round((sum(profit)/sum(sales)*100),2) as Profit_Margin,
round((sum(case when Profit < 0 then 1 else 0 end) / count(*))*100,2) as Loss_Percentage
from superstore_cleaned
group by category, sub_category
order by Loss_Percentage desc;

-- 2.
select year(order_date), month(order_date),round(sum(sales),2) as Total_Sales, round(sum(profit),2) as Total_Profit
from superstore_cleaned
group by year(order_date) ,month(order_date)
order by year(order_date);




select year(order_date), month(order_date),round(sum(sales),2) as Total_Sales, round(sum(profit),2) as Total_Profit
from superstore_cleaned
where year(order_date) = 2018
group by year(order_date) ,month(order_date)
order by Total_Profit desc;
-- 3
select product_name,
round(sum(profit)) as Total_Profit
from superstore_cleaned
group by product_name
order by Total_Profit desc
limit 1;


select product_name,
round(sum(profit)) as Total_Profit
from superstore_cleaned
group by product_name
order by Total_Profit
limit 1;


-- 4.
select customer_name, count(customer_name) as Total_Visit
from superstore_cleaned
group by customer_name
order by Total_Visit desc   
limit 1;

-- 5. 
select customer_name, round(sum(sales)) as Total_Sales
from superstore_cleaned
group by customer_name
order by Total_Sales desc
limit 1; 

-- 6.
with Sal as (select region, customer_name, round(sum(sales),2) as Total_Sales,
dense_rank() over (partition by region order by sum(sales) desc) as Rnk from superstore_cleaned
group by region,customer_name)
select * from Sal where Rnk = 1;

-- 7. YOY growth rate.
with yrsale as (select year(order_date) as order_year, round(sum(sales),2) as current_sale
from superstore_cleaned
group by year(order_date))
select  order_year, current_sale,
 lag(current_sale) over(order by order_year) as previous_sale,
round(((current_sale - lag(current_sale) over(order by order_year)) / lag(current_sale) over(order by order_year)) * 100,2) as YOY_Growth
from yrsale;

-- 8. avg delivery days according to ship mode.
select ship_mode, 
round(avg(datediff(ship_date ,order_date)),2) as avg_delivery_days
from superstore_cleaned
group by ship_mode;
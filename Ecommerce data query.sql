create database Ecommerce;
use Ecommerce ;

-- Kpi
-- Total sales
select round(sum(total_amount)) as Total_sales from ecommerce_sales_34500;

-- Total orders 
 select count(order_id) as Total_orders from ecommerce_sales_34500;
 
 -- Avg_order_value 
 select round(avg(total_amount))as Average_orders_value from ecommerce_sales_34500;
 
 -- Avg profit margin
 select round(avg(profit_margin)) as Avg_profit_margin from ecommerce_sales_34500 ;
 
 -- visulization
 
-- CATEGORY WISE SALES 
	select category , sum(total_amount) AS Category_sales  from ecommerce_sales_34500
	group by category order by Category_sales desc;
    
-- Payment method WISE SALES 
	select payment_method , sum(total_amount) AS Payment_method_sales  from ecommerce_sales_34500
	group by payment_method order by  Payment_method_sales desc;

--  Return SALES SHARE
	select returned ,round(100.0 * sum(total_amount)/sum(sum(total_amount))OVER(),2) AS sales_percent  from ecommerce_sales_34500
	group by returned ;
    
-- return sales
select returned ,sum(total_amount) AS sales_Amount from ecommerce_sales_34500
group by returned ;
 
-- Top 3 CATEGORY SALES 
	select category , sum(total_amount) AS sales  from ecommerce_sales_34500
	group by category order by sales desc limit 3;

-- age wise sales 
select
    case
    when customer_age < 18 then "Teenager" 
    when customer_age between 18 and 30 then "Young"
    when customer_age between 30 and 50 then "Middle Age "
    else "senior citizen " end as Age_category,
    sum(total_amount) as Total_sales
    from ecommerce_sales_34500 
    group by Age_category
    order by Total_sales desc;
    
    
 -- Date wise Sales    
SELECT 
    date_format(order_date, '%y-%m') AS month,
    SUM(total_amount) AS monthly_sales
FROM ecommerce_sales_34500
GROUP BY date_format(order_date, '%y-%m')
ORDER BY month;
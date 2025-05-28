create database COMPANY;
use COMPANY;
select * from sales;
-- Q1: find all orders shipped via "economy' mode with a total amount>25000
select * from sales where ship_mode="economy" and total_amount>25000;

-- q2:retrieve all sales sales data for 'technology' category in 'ireland' made after 2020-01-01.
select * from sales where category="technology" and country="ireland" 
and order_date>"01-01-2020";

-- Q3:list top 10 most profitable sales transaction in descending order.
select * from sales order by unit_profit desc limit 10;
select * from sales order by unit_profit desc limit 10,20; -- skips 10 records,showing next 20 records

-- q4: find all customers whose name starts with 'j' and ends with 'n'
select order_id,customer_name from sales where customer_name like "j%n" ;
-- q5:retrieve all product names that contain "acco" anywhere in the name
select order_id,product_name from sales where product_name like "%acco%";

-- q6:get top 5 cities the highest total sales amount
select city,sum(total_amount) as total_sales from sales group by city order by total_sales desc limit 5; 
-- q7: display the second set of 10 records for customer_name and total_amount in decreasing order

select customer_name,total_amount from sales order by total_amount  desc limit 10,10; -- skips first 10 and shows next 10.

--  q8:find the total revenue,average unit cost and total no of numbers 
select sum(total_amount) as `total revenue`,avg(unit_cost) as `unitcost`,count(order_id) as `total no of sales` from sales;

-- q9: count unique no of regions:

select region,count(region) as `no of unique regions` from sales group by region;
select count(distinct(region)) as `unique region` from sales; 

-- q10: find the number of oreders placed by each customer

select customer_name,count(order_id) as order_count from sales group by customer_name order by order_count desc;

--  q12: rank 5 products based on total sales using rank()

select product_name, sum(total_amount) as total_sales, 
rank() over (order by sum(total_amount) desc) as sales_rank
from sales
group by product_name 
limit 5;

 


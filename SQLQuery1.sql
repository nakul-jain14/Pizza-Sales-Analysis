select * from pizza_sales

select sum(total_price) as Total_Revenue from pizza_sales

select sum(total_price) / count(Distinct order_id) as Average_Order_Value from pizza_sales

select sum(quantity) as Total_Pizza_Sold from pizza_sales

select count(Distinct order_id) as Total_Order from pizza_sales

select cast(cast(sum(quantity) as decimal(10,2)) / cast(count(Distinct order_id) as decimal(10,2)) as decimal(10,2)) as Average_Pizza_Per_Order from pizza_sales

select datename(DW, order_date) as Order_Day, count(Distinct order_id) as Total_Orders 
from pizza_sales
group by datename(DW, order_date)

select datename(month, order_date) as Month_Name, count(Distinct order_id) as Total_Orders
from pizza_sales
group by datename(month, order_date)
order by Total_Orders DESC

select pizza_category, cast(sum(total_price) as decimal(10,2)) as Total_Revenue,
cast(sum(total_price) * 100 / (select sum(total_price) from pizza_sales) as decimal(10,2)) as PCT
from pizza_sales
group by pizza_category

select pizza_size, CAST(SUM(total_price) as decimal(10,2)) as Total_Revenue,
cast(sum(total_price) * 100 / (select sum(total_price) from pizza_sales) as decimal(10,2)) as PCT
from pizza_sales
group by pizza_size
order by pizza_size

select pizza_category, sum(quantity) as Total_Quantity_Sold
from pizza_sales
where month(order_date) = 2
group by pizza_category
order by Total_Quantity_Sold DESC

select Top 5 pizza_name, sum(total_price) as Total_Revenue
from pizza_sales
group by pizza_name
order by Total_Revenue DESC

select Top 5 pizza_name, sum(total_price) as Total_Revenue
from pizza_sales
group by pizza_name
order by Total_Revenue ASC

select Top 5 pizza_name, sum(quantity) as Total_Pizza_Sold
from pizza_sales
group by pizza_name
order by Total_Pizza_Sold DESC

select Top 5 pizza_name, sum(quantity) as Total_Pizza_Sold
from pizza_sales
group by pizza_name
order by Total_Pizza_Sold ASC

select Top 5 pizza_name, count(Distinct order_id) as Total_Orders
from pizza_sales
group by pizza_name
order by Total_Orders DESC

select Top 5 pizza_name, count(Distinct order_id) as Total_Orders
from pizza_sales
group by pizza_name
order by Total_Orders ASC
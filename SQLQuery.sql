select * from pizza_sales

--Total Revenue
select sum(total_price) as Total_Revenue from pizza_sales

--Average Order Value
select sum(total_price) / count(Distinct order_id) as Average_Order_Value from pizza_sales

--Total Pizzas Sold
select sum(quantity) as Total_Pizza_Sold from pizza_sales

--Total Orders
select count(Distinct order_id) as Total_Order from pizza_sales

--Average Pizzas Per Order
select cast(cast(sum(quantity) as decimal(10,2)) / 
cast(count(Distinct order_id) as decimal(10,2)) as decimal(10,2)) 
as Average_Pizza_Per_Order 
from pizza_sales

--Daily Trend for Total Orders
select datename(DW, order_date) as Order_Day, count(Distinct order_id) as Total_Orders 
from pizza_sales
group by datename(DW, order_date)

--Monthly Trend for Orders
select datename(month, order_date) as Month_Name, count(Distinct order_id) as Total_Orders
from pizza_sales
group by datename(month, order_date)
order by Total_Orders DESC

--% of Sales by Pizza Category
select pizza_category, cast(sum(total_price) as decimal(10,2)) as Total_Revenue,
cast(sum(total_price) * 100 / (select sum(total_price) from pizza_sales) as decimal(10,2)) as PCT
from pizza_sales
group by pizza_category

--% of Sales by Pizza Size
select pizza_size, CAST(SUM(total_price) as decimal(10,2)) as Total_Revenue,
cast(sum(total_price) * 100 / (select sum(total_price) from pizza_sales) as decimal(10,2)) as PCT
from pizza_sales
group by pizza_size
order by pizza_size

--Total Pizzas Sold by Pizza Category
select pizza_category, sum(quantity) as Total_Quantity_Sold
from pizza_sales
where month(order_date) = 2
group by pizza_category
order by Total_Quantity_Sold DESC

--Top 5 Pizzas by Revenue
select Top 5 pizza_name, sum(total_price) as Total_Revenue
from pizza_sales
group by pizza_name
order by Total_Revenue DESC

--Bottom 5 Pizzas by Revenue
select Top 5 pizza_name, sum(total_price) as Total_Revenue
from pizza_sales
group by pizza_name
order by Total_Revenue ASC

--Top 5 Pizzas by Quantity
select Top 5 pizza_name, sum(quantity) as Total_Pizza_Sold
from pizza_sales
group by pizza_name
order by Total_Pizza_Sold DESC

--Bottom 5 Pizzas by Quantity
select Top 5 pizza_name, sum(quantity) as Total_Pizza_Sold
from pizza_sales
group by pizza_name
order by Total_Pizza_Sold ASC

--Top 5 Pizzas by Total Orders
select Top 5 pizza_name, count(Distinct order_id) as Total_Orders
from pizza_sales
group by pizza_name
order by Total_Orders DESC

--Borrom 5 Pizzas by Total Orders
select Top 5 pizza_name, count(Distinct order_id) as Total_Orders
from pizza_sales
group by pizza_name
order by Total_Orders ASC
--1.How many orders were placed each month in 2015? Return the results as a list that includes the month number,
--the month name, and the total number of orders. Sort the results by month number.--
SELECT MONTH([date]) AS month_number, DATENAME(MONTH,[date]) AS month_name,
COUNT (*) AS total_orders
FROM orders
WHERE YEAR([date]) = 2015
GROUP BY MONTH([date]), DATENAME(MONTH,[date]) 
ORDER BY month_number

---2. Concatenate the name and category from the pizza_types table into a single column in the format "Name (Category)".---
SELECT CONCAT ([name], ' ','(',category, ')') AS [Name (category)]
FROM pizza_types


---3. List all orders placed between 11:00 AM and 3:00 PM in February, including the pizza name, quantity ordered, date, and time of the order.---
SELECT pt.[name],o.[date],o.[time],od.quantity,
CONVERT(varchar(5), o.[time], 108) AS order_time
FROM orders o
JOIN order_details od ON o.order_id = od.order_id
JOIN pizzas p ON od.pizza_id = p.pizza_id
JOIN pizza_types pt ON p.pizza_type_id = pt.pizza_type_id
WHERE MONTH(o.[date]) = 2 AND o.[time] BETWEEN '11:00' AND '15:00'
ORDER BY o.[date], o.[time]


--4. List all pizzas with their type, size, name, category, and price where the price is higher than the average price of all pizzas in the dataset.--
SELECT p.size,p.price,pt.category,pt.[name],pt.pizza_type_id AS pizza_type
FROM pizzas p
JOIN pizza_types pt ON p.pizza_type_id = pt.pizza_type_id
WHERE p.price > (SELECT AVG(price) FROM pizzas)


--5. List the top 5 orders where the total quantity ordered is greater than the average quantity per order. Rank in descending order.--
SELECT TOP 5 order_id, SUM(quantity) AS total_quantity
FROM order_details
GROUP BY order_id
HAVING SUM(quantity) > (SELECT AVG(quantity) FROM order_details)
ORDER BY total_quantity DESC;


--6. List the pizza_type_id, name (from pizzas table), and a human-readable size_category (e.g., 'Small', 'Medium') for all pizzas in the pizzas table.--
SELECT pt.pizza_type_id,pt.[name],
CASE WHEN size = 'S' THEN 'Small' 
WHEN size = 'M' THEN 'Medium' 
WHEN size = 'L' THEN 'Large' 
WHEN size = 'XL' THEN 'Extra Large'
WHEN size = 'XXL' THEN 'Double Extra Large'
ELSE 'Unknown'
END AS size_category
FROM pizza_types pt
JOIN pizzas p ON p.pizza_type_id = pt.pizza_type_id


--7. List the order_id, pizza_type_id, size, total revenue, and a value_label ('High Value' or 'Standard') for all orders. 
--Calculate revenue using quantity and price. → revenue above $50 is High value.--
SELECT od.order_id, pt.pizza_type_id,p.size, SUM(od.quantity * p.price) AS total_revenue,
CASE WHEN SUM(od.quantity * p.price) > 50 THEN 'High Value' ELSE 'Standard' END AS value_label
FROM order_details od
JOIN pizzas p ON p.pizza_id =od.pizza_id
JOIN pizza_types pt ON pt.pizza_type_id = p.pizza_type_id
GROUP BY od.order_id,pt.pizza_type_id,p.size

--8.Use a CTE to calculate the total revenue per pizza type and sort by the total revenue.--
;WITH RevenuePerPizzaType AS (SELECT pt.pizza_type_id,pt.name AS pizza_name,SUM(od.quantity * p.price) AS total_revenue
FROM order_details od
JOIN pizzas p ON od.pizza_id = p.pizza_id
JOIN pizza_types pt ON p.pizza_type_id = pt.pizza_type_id
GROUP BY pt.pizza_type_id, pt.name)
SELECT *
FROM RevenuePerPizzaType
ORDER BY total_revenue DESC;


--11.Explain how DATEPART and CAST are used to analyze peak order hours using the time field in the orders table.
SELECT DATEPART(HOUR, CAST([time] AS datetime)) AS order_hour, COUNT(*) AS total_orders
FROM orders
GROUP BY DATEPART(HOUR, CAST([time] AS datetime))
ORDER BY total_orders DESC;


--12. In the pizza_types.ingredients field, there are values that are separated by a comma. Write down the full query to return only pizzas that contain Mushrooms?
SELECT *
FROM pizza_types
WHERE ingredients LIKE '%Mushrooms%'




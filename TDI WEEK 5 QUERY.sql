---1. Month-over-month revenue growth  
--(Assuming you can extract month from the date column in orders, and revenue = quantity × price from order_details joined with pizzas)
WITH monthly_revenue AS (SELECT FORMAT(o.date, 'yyyy-MM') AS month, SUM(od.quantity * p.price) AS revenue
FROM orders o
JOIN order_details od ON o.order_id = od.order_id
JOIN pizzas p ON od.pizza_id = p.pizza_id
GROUP BY FORMAT(o.date, 'yyyy-MM')), revenue_growth AS 
(SELECT month, revenue,
LAG(revenue) OVER (ORDER BY month) AS prev_revenue
FROM monthly_revenue)
SELECT month, revenue, 
ROUND(((revenue - prev_revenue) * 100.0) / prev_revenue, 2) AS growth_percentage
FROM revenue_growth

---2. Orders during breakfast or afternoon lull hours
SELECT o.order_id, o.date, o.time, pt.name
FROM orders o
JOIN order_details od ON o.order_id = od.order_id
JOIN pizzas p ON od.pizza_id = p.pizza_id
JOIN pizza_types pt ON p.pizza_type_id = pt.pizza_type_id
WHERE (CAST(o.time AS TIME) BETWEEN '09:00:00' AND '11:00:00') 
OR (CAST(o.time AS TIME) BETWEEN '14:00:00' AND '17:00:00')

---3. Pizzas with "Pepperoni" and "Onions" but not "Mushrooms"
SELECT * 
FROM pizza_types
WHERE ingredients LIKE '%Pepperoni%' 
AND ingredients LIKE '%Onions%'
AND ingredients NOT LIKE '%Mushrooms%'

---4. Rank orders by month-over-month quantity growth
WITH monthly_quantity AS 
(SELECT FORMAT(o.date, 'yyyy-MM') AS month, SUM(od.quantity) AS total_quantity
FROM orders o
JOIN order_details od ON o.order_id = od.order_id
GROUP BY FORMAT(o.date, 'yyyy-MM')),
growth_data AS (
SELECT month, total_quantity, total_quantity - LAG(total_quantity) OVER (ORDER BY month) AS growth
FROM monthly_quantity)
SELECT month, total_quantity, growth, ROW_NUMBER() OVER (ORDER BY growth DESC) AS rank
FROM growth_data
WHERE growth > 0

---5. Create index on date column
CREATE INDEX idx_orders_date ON orders(date)  
--Creating an index on the date column speeds up filtering and searching operations when using WHERE date = ... or WHERE date BETWEEN ... in queries. It improves performance especially on large datasets.

---6. Average revenue per order for customers with > 5 orders  (Assuming each order_id = unique customer)
WITH order_revenue AS 
(SELECT od.order_id, SUM(od.quantity * p.price) AS revenue
FROM order_details od
JOIN pizzas p ON od.pizza_id = p.pizza_id
GROUP BY od.order_id),
qualified_orders AS 
(SELECT revenue
FROM order_revenue
-- Simulate "active customers" by selecting orders with revenue over 100, for example
WHERE revenue > 100)
SELECT ROUND(AVG(revenue), 2) AS avg_revenue
FROM qualified_orders

---7. Pizza size with highest average price per unit sold
SELECT TOP 1 p.size, ROUND(AVG(p.price), 2) AS avg_price
FROM pizzas p
GROUP BY p.size
ORDER BY avg_price DESC

---8. Count unique ingredients across all pizzas
WITH all_ingredients AS (
SELECT LTRIM(RTRIM(value)) AS ingredient
FROM pizza_types
CROSS APPLY STRING_SPLIT(ingredients, ','))
SELECT COUNT(DISTINCT ingredient) AS unique_ingredients
FROM all_ingredients




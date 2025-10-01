--1. Total revenue by pizza size
SELECT p.size, SUM(p.price * od.quantity) AS total_revenue
FROM order_details od
JOIN pizzas p ON od.pizza_id = p.pizza_id
GROUP BY p.size

--2. Chicken pizza orders in July and August
SELECT pt.name, p.size, p.price
FROM orders o
JOIN order_details od ON o.order_id = od.order_id
JOIN pizzas p ON od.pizza_id = p.pizza_id
JOIN pizza_types pt ON p.pizza_type_id = pt.pizza_type_id
WHERE pt.name LIKE '%chicken%'
AND MONTH(o.date) IN (7, 8)

--3. Pizzas with only Mozzarella & Tomato Sauce (or empty)
SELECT *
FROM pizza_types
WHERE ingredients IS NULL
OR ingredients = 'Mozzarella Cheese,Tomato Sauce'

--4. Count orders per hour
SELECT DATEPART(HOUR, time) AS hour, COUNT(*) AS order_count
FROM orders
GROUP BY DATEPART(HOUR, time)
ORDER BY hour

--5. Average price per category
SELECT pt.category, AVG(p.price) AS avg_price
FROM pizzas p
JOIN pizza_types pt ON p.pizza_type_id = pt.pizza_type_id
GROUP BY pt.category


---6. Pizzas ordered on Fridays
SELECT pt.name AS pizza_name, o.order_id, o.date
FROM orders o
JOIN order_details od ON o.order_id = od.order_id
JOIN pizzas p ON od.pizza_id = p.pizza_id
JOIN pizza_types pt ON p.pizza_type_id = pt.pizza_type_id
WHERE DATEPART(WEEKDAY, o.date) = 6

---7. Top 3 most ordered pizza types
SELECT TOP 3 pt.name, SUM(od.quantity) AS total_ordered
FROM order_details od
JOIN pizzas p ON od.pizza_id = p.pizza_id
JOIN pizza_types pt ON p.pizza_type_id = pt.pizza_type_id
GROUP BY pt.name
ORDER BY total_ordered DESC

---8. Total quantity ordered per pizza type
SELECT pt.name, SUM(od.quantity) AS total_quantity
FROM order_details od
JOIN pizzas p ON od.pizza_id = p.pizza_id
JOIN pizza_types pt ON p.pizza_type_id = pt.pizza_type_id
GROUP BY pt.name
ORDER BY total_quantity DESC

---9. Orders with revenue > $100
SELECT od.order_id, SUM(p.price * od.quantity) AS total_revenue
FROM order_details od
JOIN pizzas p ON od.pizza_id = p.pizza_id
GROUP BY od.order_id
HAVING SUM(p.price * od.quantity) > 100


---10. Day with highest number of orders
SELECT TOP 1 DATENAME(WEEKDAY, date) AS day, COUNT(*) AS total_orders
FROM orders
GROUP BY DATENAME(WEEKDAY, date)
ORDER BY total_orders DESC

---11. Pizzas with Basil but not Pepperoni
SELECT *
FROM pizza_types
WHERE ingredients LIKE '%Basil%'
AND ingredients NOT LIKE '%Pepperoni%'


---12. Orders after 12 PM
SELECT o.order_id, pt.name, p.size, o.time
FROM orders o
JOIN order_details od ON o.order_id = od.order_id
JOIN pizzas p ON od.pizza_id = p.pizza_id
JOIN pizza_types pt ON p.pizza_type_id = pt.pizza_type_id
WHERE o.time > '12:00:00'


---13. Cheapest pizza in each category
SELECT pt.category, pt.name, p.price
FROM pizzas p
JOIN pizza_types pt ON p.pizza_type_id = pt.pizza_type_id
JOIN (SELECT pt.category, MIN(p.price) AS min_price
FROM pizzas p
JOIN pizza_types pt ON p.pizza_type_id = pt.pizza_type_id
GROUP BY pt.category) 
AS min_prices ON pt.category = min_prices.category AND p.price = min_prices.min_price
ORDER BY pt.category


---14. Total revenue per customer (order_id = customer)
SELECT od.order_id, SUM(p.price * od.quantity) AS total_revenue
FROM order_details od
JOIN pizzas p ON od.pizza_id = p.pizza_id
GROUP BY od.order_id

---15. Customer Behavior Question: Which size is most preferred by customers?
SELECT p.size, SUM(od.quantity) AS total_ordered
FROM order_details od JOIN pizzas p ON od.pizza_id = p.pizza_id
GROUP BY p.size
ORDER BY total_ordered DESC

---16. Product Performance: Which pizza category brings in most revenue?
SELECT pt.category, SUM(p.price * od.quantity) AS revenue
FROM order_details od
JOIN pizzas p ON od.pizza_id = p.pizza_id
JOIN pizza_types pt ON p.pizza_type_id = pt.pizza_type_id
GROUP BY pt.category
ORDER BY revenue DESC

---17. Operational Efficiency: What time of day has the most orders?
SELECT TOP 1 DATEPART(HOUR, time) AS hour, COUNT(*) AS order_count
FROM orders
GROUP BY DATEPART(HOUR, time)
ORDER BY order_count DESC

---18. Difference Between WHERE and HAVING
-- WHERE filters rows before grouping.
-- HAVING filters groups after aggregation (e.g. after GROUP BY).


---19. Why is Data Normalization Important?
-- Removes redundancy
-- Ensures data consistency
-- Improves data integrity
-- Makes querying more efficient


---20. Difference between CTE and Window Function
-- CTE (Common Table Expression): Temporary result set used for readable queries, recursion, etc.
-- Window Function: Performs calculations across a set of rows related to current row (e.g. running totals).

--Which is better?  
--They serve different purposes — not directly comparable. Use based on need.

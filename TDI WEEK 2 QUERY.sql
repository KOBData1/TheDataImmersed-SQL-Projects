---Retrieve all columns from the orders table and sort the results by date in ascending order.---
SELECT * FROM orders
ORDER BY [date] ASC


---Find all orders placed on or before June 30.---
SELECT * FROM orders
WHERE [date] <= '2015-06-30'


---Identify all orders where the time is between 3PM and 7PM.---
SELECT * FROM orders
WHERE [time] BETWEEN '13:00' AND '17:00' 


---Find all rows in the order_details table where the quantity is greater than 2.---
SELECT * FROM order_details
WHERE [quantity] > '2'


---Sort the order_details table by quantity in descending order and return the top 10 rows.---
SELECT TOP 10 *
FROM order_details
ORDER BY quantity DESC


---Calculate the total quantity ordered for each order_id and return the results sorted by total quantity in descending order.---
SELECT [order_id], SUM(quantity) AS[total quantity]
FROM order_details
GROUP BY [order_id]
ORDER BY [total quantity] DESC 


---Find pizzas that have been ordered more than 10 times in total by grouping the orders by pizza_id.---
SELECT 
  pizzas.pizza_id,
  SUM(order_details.quantity) AS total_quantity
FROM pizzas
JOIN order_details
  ON pizzas.pizza_id = order_details.pizza_id
GROUP BY pizzas.pizza_id
HAVING SUM(order_details.quantity) > 10;


---Compute the average price for each pizza size (size) and return the results.---
SELECT size, AVG(price) AS[average price]
FROM pizzas
GROUP BY size


---Join the orders and order_details tables to retrieve the order_id, date,time, pizza_id, and quantity for all orders.---
SELECT orders.order_id, orders.[date], orders.[time], order_details.pizza_id, order_details.quantity 
FROM orders
JOIN order_details
ON orders.order_id = order_details.order_id


SELECT * FROM pizzas 
SELECT * FROM pizza_types 

---Join the pizzas and pizza_types tables to list the name and category of each pizza.---
SELECT pizzas.pizza_type_id, pizza_types.[name], pizza_types.category
FROM pizzas
JOIN pizza_types
ON pizzas.pizza_type_id = pizza_types.pizza_type_id


---Identify all orders placed during lunch hours on any date.---
SELECT * 
FROM orders
WHERE [time] BETWEEN '12:00' AND '14:00'


---Group the pizzas by size and calculate the total revenue (quantity × price) generated for each size.---
SELECT pizzas.size,
SUM(order_details.quantity*pizzas.price) AS revenue
FROM pizzas
JOIN order_details
ON pizzas.pizza_id = order_details.pizza_id
GROUP BY pizzas.size


---Determine the minimum and maximum price for each pizza size (size)in a single query.---
SELECT size,  
MIN(price) AS min_price,
MAX(price) AS max_price
FROM pizzas
GROUP BY size


---Sort the order_details table by order_id and then by quantity in descending order, and return the first 10 rows.---
SELECT TOP 10 *
FROM order_details
ORDER BY order_id , quantity DESC


---Retrieve pizza_id, count the number of sales, and calculate the total revenue for each pizza. 
---Include only pizzas with more than 20 sales,and sort the results by total revenue in descending order.---
SELECT pizzas.pizza_id, COUNT(order_details.order_id) AS [sales] , SUM(order_details.quantity*pizzas.price) AS [total revenue]
FROM pizzas
JOIN order_details
ON pizzas.pizza_id = order_details.pizza_id
GROUP BY pizzas.pizza_id
Having COUNT(order_details.order_id) >20
ORDER BY [total revenue] DESC

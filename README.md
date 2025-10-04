# TheDataImmersed-SQL-Projects
A collection of weekly SQL practice projects from TheDataImmersed community. Each folder covers different SQL concepts with datasets queries, and documentation.


---


## TDI Week 1 Project
### 📚 SQL Books Database Project 

This project demonstrates the creation and management of a Books database using SQL. The main objective is to practice fundamental SQL operations, including table creation, data insertion, data retrieval, updating records, and ordering results.

### 🔑 Key Features:
- Database Creation: A Books table was created with attributes such as Book_id, Title, Author, Genre, Year_published, and Price
- Data Insertion: Inserted 10 initial book records covering multiple genres (Fiction, Science, History, Self-Help, Memoir). Additional books were added later to expand the dataset.
- Data Retrieval:
Retrieved all books priced above $10.
Fetched books published after 2000, sorted by price in descending order.
Displayed only the Title and Genre columns for a simplified view.
- Data Update: Corrected an author name (Atomic Habits author updated from Adam Sandler to James Clear).
- Data Expansion: Added two more influential books (Thinking, Fast and Slow and The Power of Habit).

### 🛠️ SQL Concepts Covered:
- DDL (Data Definition Language): Creating tables with appropriate data types and constraints.
- DML (Data Manipulation Language): Inserting, updating, and deleting records.
- DQL (Data Query Language): Writing queries with conditions, filtering, and sorting.
- Data Integrity: Ensuring unique primary keys and correcting inaccurate data.

### 📈 Learning Outcomes:
This project showcases how to:
- Structure a relational database table.
- Insert and manipulate real-world datasets.
- Write queries to retrieve targeted information.
- Apply updates and maintain data consistency.

#### 👉 This project can serve as a foundation for larger database systems such as a library management system, online bookstore database, or reading tracker.

<img width="700" height="400" alt="image" src="https://github.com/user-attachments/assets/00819c25-d707-49d8-99ab-2fd40cad12a8" />

---


## TDI Week 2 Project

### 🍕 Pizza Sales SQL Analysis Project
This project explores pizza sales data using SQL queries to uncover insights about customer orders, product performance, and revenue generation. The dataset consists of multiple tables including orders, order_details, pizzas, and pizza_types.

### 🔑 Key Features:
Order Analysis
- Retrieved all orders, sorted by date and time.
- Filtered orders based on specific conditions (e.g., placed before June 30, during lunch hours, or between certain times of the day).
  
Order Details Analysis
- Identified orders where quantities exceeded thresholds.
- Ranked orders by quantity to find the top 10 largest.
- Aggregated total quantities per order_id.
  
Pizza Popularity & Performance
- Found pizzas ordered more than 10 times.
- Calculated pizza sales frequency and revenue contribution.
- Filtered pizzas with more than 20 sales, ranking them by total revenue.
  
Revenue Insights
- Computed total revenue by pizza size (quantity × price).
- Calculated the average price, minimum price, and maximum price for each pizza size.
  
Table Joins & Relationships
- Joined orders with order_details to display order breakdowns.
- Combined pizzas with pizza_types to list each pizza’s name and category.

### 🛠️ SQL Concepts Covered:
- Filtering & Sorting: Using WHERE, BETWEEN, ORDER BY.
- Aggregations: SUM(), AVG(), MIN(), MAX(), COUNT().
- Grouping & Conditions: GROUP BY with HAVING to filter aggregate results.
- Joins: Combining multiple tables with JOIN to get richer insights.
- Revenue Calculation: Derived metrics by multiplying price and quantity.

### 📈 Learning Outcomes:
Through this project, I learned how to:
- Query relational databases to analyze real-world sales data.
- Apply SQL joins to link related tables and extract meaningful business insights.
- Perform revenue analysis to identify top-selling products and their contribution.
- Use aggregate queries to summarize data and support decision-making.

#### 👉 This project simulates a real-world pizza sales analysis. The skills gained here can be applied to retail, e-commerce, restaurant management, and financial reporting databases.

<img width="800" height="500" alt="image" src="https://github.com/user-attachments/assets/f0b91e4c-9c9b-416c-800f-bb9038d70000" />

--- 


## TDI Week 3 Project

### 🍕 Pizza Sales SQL Analysis Project
This project explores pizza sales data using SQL queries to uncover insights about customer orders, product performance, and revenue generation. The dataset consists of multiple tables including orders, order_details, pizzas, and pizza_types.

### 🔑 Key Features:
Order Analysis
- Retrieved all orders, sorted by date and time.
- Filtered orders based on specific conditions (e.g., placed before June 30, during lunch hours, or between certain times of the day).
  
Order Details Analysis
- Identified orders where quantities exceeded thresholds.
- Ranked orders by quantity to find the top 10 largest.
- Aggregated total quantities per order_id.
  
Pizza Popularity & Performance
- Found pizzas ordered more than 10 times.
- Calculated pizza sales frequency and revenue contribution.
- Filtered pizzas with more than 20 sales, ranking them by total revenue.
  
Revenue Insights
- Computed total revenue by pizza size (quantity × price).
- Calculated the average price, minimum price, and maximum price for each pizza size.
  
Table Joins & Relationships
- Joined orders with order_details to display order breakdowns.
- Combined pizzas with pizza_types to list each pizza’s name and category.

### 🛠️ SQL Concepts Covered:
- Filtering & Sorting: Using WHERE, BETWEEN, ORDER BY.
- Aggregations: SUM(), AVG(), MIN(), MAX(), COUNT().
- Grouping & Conditions: GROUP BY with HAVING to filter aggregate results.
- Joins: Combining multiple tables with JOIN to get richer insights.
- Revenue Calculation: Derived metrics by multiplying price and quantity.

### 📈 Learning Outcomes:
Through this project, I learned how to:
- Query relational databases to analyze real-world sales data.
- Apply SQL joins to link related tables and extract meaningful business insights.
- Perform revenue analysis to identify top-selling products and their contribution.
- Use aggregate queries to summarize data and support decision-making.

#### 👉 This project simulates a real-world pizza sales analysis. The skills gained here can be applied to retail, e-commerce, restaurant management, and financial reporting databases.

<img width="900" height="400" alt="image" src="https://github.com/user-attachments/assets/85987762-52f6-4a47-a5e8-a541b77a6251" />

---


## TDI Week 4 Project

### 🍕 SQL Pizza Sales Business Analysis
This project applies SQL queries to a pizza sales database to answer 20 real-world business and technical questions. The focus is on exploring customer behavior, product performance, revenue trends, and operational efficiency while also demonstrating theoretical SQL knowledge.

### 🔑 Key Features & Queries:
Revenue Analysis:
- Total revenue by pizza size and category.
- Orders generating revenue above $100.
- Total revenue per customer (based on order_id).
  
Customer Behavior:
- Most preferred pizza size.
- Chicken pizza orders placed in July and August.
- Orders placed after 12 PM and specifically on Fridays.
- Day of the week with the highest number of orders.

Product Performance:
- Top 3 most-ordered pizza types.
- Total quantity ordered per pizza type.
- Cheapest pizza in each category.
- Ingredient-based filtering (pizzas with Basil but not Pepperoni, pizzas with only Mozzarella & Tomato Sauce).

Operational Efficiency:
- Count of orders per hour.
- Peak time of day with the most orders.
- Average pizza price per category.

SQL Knowledge & Concepts:
- Difference between WHERE and HAVING in filtering data.
- Importance of Data Normalization for efficiency and consistency.
- Difference between CTEs and Window Functions with use cases.

### 🛠️ SQL Concepts Applied:
- Joins: Combined data from multiple tables (orders, order_details, pizzas, pizza_types).
- Aggregate Functions: SUM, AVG, COUNT, MIN, MAX for calculations.
- GROUP BY & HAVING: Used for grouping and filtering aggregated results.
- Date & Time Functions: MONTH, DATEPART, DATENAME to analyze time-based trends.
- Subqueries: Used to identify the cheapest pizza in each category.
- Data Filtering: Applied conditions with WHERE, LIKE, and logical operators.

### 📈 Learning Outcomes:
Through this project, I learned how to:
- Translate raw order data into actionable insights.
- Identify customer preferences and peak demand periods.
- Evaluate product performance by sales volume and revenue contribution.
- Apply both practical SQL queries and theoretical database concepts to solve business problems.

#### 👉 This project can serve as a foundation for restaurant analytics dashboards, POS (Point-of-Sale) reporting systems, or BI solutions for food chains.

<img width="400" height="400" alt="image" src="https://github.com/user-attachments/assets/9ebbe648-b9f6-41b5-a3f8-f143a48829f2" />


<img width="400" height="400" alt="image" src="https://github.com/user-attachments/assets/83858cce-b5e3-41e0-9ec2-b940a82b6fdf" />

---


## TDI Week 5 Project

### 🍕 Advanced SQL Pizza Sales Analytics
This project extends the analysis of a pizza sales database by applying advanced SQL queries to explore revenue growth, customer activity, product performance, and database optimization techniques. The focus is on identifying business trends, improving query performance, and extracting deeper insights from raw transactional data.

### 🔑 Key Features & Queries
Revenue & Growth Analysis
- Month-over-Month Revenue Growth: Measured growth trends by comparing revenue across months using window functions.
- Rank Orders by Quantity Growth: Tracked changes in total pizzas sold month-over-month and ranked periods with the highest growth.

Customer Behavior
- Orders During Specific Time Windows: Isolated orders placed during breakfast (9–11 AM) and afternoon lull (2–5 PM) hours.
- High-Value Customers: Calculated average revenue per order for customers with more than 5 active/high-value transactions.

Product Performance
- Ingredient-Based Filtering: Retrieved pizzas containing Pepperoni & Onions but excluding Mushrooms.
- Pizza Size with Highest Average Price: Identified which size consistently commanded the highest average unit price.
- Unique Ingredients Count: Extracted and counted distinct ingredients across all pizzas using string-splitting techniques.

Operational Efficiency & Optimization
- Indexing for Query Speed: Created an index on the date column in the orders table to improve query performance on time-based searches and aggregations.

### 🛠️ SQL Concepts Applied
- Window Functions → LAG(), ROW_NUMBER() for growth tracking and ranking.
- CTEs (Common Table Expressions) → Structured queries for month-over-month comparisons and modular analysis.
- String Functions & CROSS APPLY → Used STRING_SPLIT() to normalize comma-separated ingredient lists.
- Indexes → Created on frequently queried columns to improve performance in large datasets.
- Aggregations → SUM, AVG, COUNT(DISTINCT) for revenue and ingredient-level insights.
- Conditional Filtering → Applied WHERE with LIKE, logical operators, and time-based constraints.

### 📈 Learning Outcomes
Through this project, I learned how to:
- Analyze revenue trends and growth rates using advanced SQL analytics.
- Leverage window functions for temporal comparisons and rankings.
- Apply database optimization techniques like indexing to speed up queries.
- Work with string-based data (ingredients) to uncover unique product features.
- Segment customer behavior based on time-of-day patterns and order value thresholds.

### 🚀 Future Applications
This advanced SQL project can be applied to:
- Sales growth dashboards with month-over-month performance tracking.
- Customer segmentation for marketing (e.g., breakfast buyers vs. afternoon buyers).
- Product R&D by analyzing unique ingredient popularity.
- Database optimization in transaction-heavy systems such as POS or e-commerce platforms.


  <img width="900" height="400" alt="image" src="https://github.com/user-attachments/assets/d321b81d-feb3-4c17-9bc5-8b853fb1230f" />


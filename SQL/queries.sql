1.1: Create Database
CREATE DATABASE superstore_db;

1.2: Create Table
CREATE TABLE sales (
    Row_ID INT,
    Order_ID VARCHAR,
    Order_Date DATE,
    Ship_Date DATE,
    Ship_Mode VARCHAR,
    Customer_ID VARCHAR,
    Customer_Name VARCHAR,
    Segment VARCHAR,
    Country VARCHAR,
    City VARCHAR,
    State VARCHAR,
    Postal_Code INT,
    Region VARCHAR,
    Product_ID VARCHAR,
    Category VARCHAR,
    Sub_Category VARCHAR,
    Product_Name TEXT,
    Sales FLOAT,
    Quantity INT,
    Discount FLOAT,
    Profit FLOAT
);

1.3Using SQL Command
COPY sales
FROM 'S:/project/Sample - Superstore.csv'
DELIMITER ','
CSV HEADER;

1.4: Verify Data
SELECT * FROM sales LIMIT 10;
SELECT COUNT(*) FROM sales;

1. Top 10 Customers by Profit
SELECT Customer_ID, ROUND(SUM(Profit), 2) AS total_profit
FROM sales
GROUP BY Customer_ID
ORDER BY total_profit DESC
LIMIT 10;

2. Profit by Category
SELECT Category, SUM(Profit) AS total_profit
FROM sales
GROUP BY Category
ORDER BY total_profit DESC;

3. Region-wise Performance
SELECT Region, SUM(Sales) AS total_sales, SUM(Profit) AS total_profit
FROM sales
GROUP BY Region;

4. Loss-Making Products
SELECT Product_Name, SUM(Profit) AS total_profit
FROM sales
GROUP BY Product_Name
HAVING total_profit < 0
ORDER BY total_profit ASC;

5. Discount Impact on Profit
SELECT Discount, AVG(Profit) AS avg_profit
FROM sales
GROUP BY Discount
ORDER BY Discount;

6. Monthly Sales Trend
SELECT Order_Year, Order_Month, SUM(Sales) AS monthly_sales
FROM sales
GROUP BY Order_Year, Order_Month
ORDER BY Order_Year, Order_Month;

7. Customer Segmentation
SELECT Customer_ID,
       COUNT(Order_ID) AS total_orders,
       SUM(Sales) AS total_spent
FROM sales
GROUP BY Customer_ID
ORDER BY total_spent DESC;

8.Top 5 Loss-Making Sub-Categories
SELECT Sub_Category, SUM(Profit) AS total_profit
FROM sales
GROUP BY Sub_Category
ORDER BY total_profit ASC
LIMIT 5;


UPDATE sales
SET Order_Year = EXTRACT(YEAR FROM Order_Date),
    Order_Month = EXTRACT(MONTH FROM Order_Date);


SELECT Order_Year, Order_Month, SUM(Sales) AS monthly_sales
FROM sales
GROUP BY Order_Year, Order_Month
ORDER BY Order_Year, Order_Month;
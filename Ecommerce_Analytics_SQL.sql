CREATE DATABASE ecommerce_analytics;
USE ecommerce_analytics;
SHOW TABLES;
SELECT COUNT(*) FROM superstore;
SELECT * FROM superstore LIMIT 5;

SELECT ROUND(SUM(Sales), 2) AS Total_Sales
FROM superstore;

SELECT ROUND(SUM(Profit), 2) AS Total_Profit
FROM superstore;

SELECT COUNT(DISTINCT `Order ID`) AS Total_Orders
FROM superstore;

SELECT COUNT(DISTINCT `Customer ID`) AS Total_Customers
FROM superstore;

SELECT ROUND(
    SUM(Sales) / COUNT(DISTINCT `Order ID`),
    2
) AS Average_Order_Value
FROM superstore;

SELECT 
    Category,
    ROUND(SUM(Sales), 2) AS Total_Sales
FROM superstore
GROUP BY Category
ORDER BY Total_Sales DESC;

SELECT 
    Category,
    ROUND(SUM(Profit), 2) AS Total_Profit
FROM superstore
GROUP BY Category
ORDER BY Total_Profit DESC;

SELECT 
    Region,
    ROUND(SUM(Sales), 2) AS Total_Sales
FROM superstore
GROUP BY Region
ORDER BY Total_Sales DESC;

SELECT 
    Region,
    ROUND(SUM(Profit), 2) AS Total_Profit
FROM superstore
GROUP BY Region
ORDER BY Total_Profit DESC;

SELECT 
    Segment,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit
FROM superstore
GROUP BY Segment
ORDER BY Total_Sales DESC;

SELECT
    `Product Name`,
    ROUND(SUM(Sales), 2) AS Total_Sales
FROM superstore
GROUP BY `Product Name`
ORDER BY Total_Sales DESC
LIMIT 10;

SELECT
    `Product Name`,
    ROUND(SUM(Profit), 2) AS Total_Profit
FROM superstore
GROUP BY `Product Name`
ORDER BY Total_Profit DESC
LIMIT 10;

SELECT
    `Product Name`,
    ROUND(SUM(Profit), 2) AS Total_Profit
FROM superstore
GROUP BY `Product Name`
HAVING SUM(Profit) < 0
ORDER BY Total_Profit ASC
LIMIT 10;

SELECT
    `Sub-Category`,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit
FROM superstore
GROUP BY `Sub-Category`
ORDER BY Total_Profit DESC;

SELECT
    `Customer Name`,
    ROUND(SUM(Sales), 2) AS Total_Sales
FROM superstore
GROUP BY `Customer Name`
ORDER BY Total_Sales DESC
LIMIT 10;

SELECT
    YEAR(`Order Date`) AS Order_Year,
    ROUND(SUM(Sales), 2) AS Total_Sales
FROM superstore
GROUP BY YEAR(`Order Date`)
ORDER BY Order_Year;

SELECT
    YEAR(`Order Date`) AS Order_Year,
    ROUND(SUM(Profit), 2) AS Total_Profit
FROM superstore
GROUP BY YEAR(`Order Date`)
ORDER BY Order_Year;

SELECT
    MONTH(`Order Date`) AS Order_Month,
    ROUND(SUM(Sales), 2) AS Total_Sales
FROM superstore
GROUP BY MONTH(`Order Date`)
ORDER BY Order_Month;

SELECT
    Discount,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit
FROM superstore
GROUP BY Discount
ORDER BY Discount;

SELECT
    Category,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    ROUND((SUM(Profit) / SUM(Sales)) * 100, 2) AS Profit_Margin
FROM superstore
GROUP BY Category
ORDER BY Profit_Margin DESC;

SELECT
    City,
    ROUND(SUM(Sales), 2) AS Total_Sales
FROM superstore
GROUP BY City
ORDER BY Total_Sales DESC
LIMIT 5;

SELECT
    City,
    ROUND(SUM(Profit), 2) AS Total_Profit
FROM superstore
GROUP BY City
ORDER BY Total_Profit DESC
LIMIT 5;

SELECT
    `Ship Mode`,
    COUNT(*) AS Total_Orders,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit
FROM superstore
GROUP BY `Ship Mode`
ORDER BY Total_Sales DESC;

SELECT
    Region,
    Category,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit
FROM superstore
GROUP BY Region, Category
ORDER BY Region, Total_Sales DESC;

SELECT
    Category,
    ROUND(SUM(Profit), 2) AS Total_Profit
FROM superstore
GROUP BY Category
HAVING SUM(Profit) < 0;

SELECT
    Category,
    ROUND(AVG(Discount) * 100, 2) AS Average_Discount_Percent
FROM superstore
GROUP BY Category
ORDER BY Average_Discount_Percent DESC;

SELECT
    Segment,
    ROUND(SUM(Sales) / COUNT(DISTINCT `Order ID`), 2) AS Average_Order_Value
FROM superstore
GROUP BY Segment
ORDER BY Average_Order_Value DESC;

SELECT
    `Sub-Category`,
    ROUND(SUM(Profit), 2) AS Total_Profit
FROM superstore
GROUP BY `Sub-Category`
ORDER BY Total_Profit DESC
LIMIT 10;

SELECT
    `Sub-Category`,
    ROUND(SUM(Profit), 2) AS Total_Profit
FROM superstore
GROUP BY `Sub-Category`
ORDER BY Total_Profit ASC
LIMIT 10;

SELECT
    `Customer Name`,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit
FROM superstore
GROUP BY `Customer Name`
ORDER BY Total_Profit DESC
LIMIT 10;

SELECT
    `Product Name`,
    Discount,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit
FROM superstore
WHERE Discount >= 0.5
GROUP BY `Product Name`, Discount
HAVING SUM(Profit) < 0
ORDER BY Total_Profit ASC
LIMIT 10;

SELECT
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    COUNT(DISTINCT `Order ID`) AS Total_Orders,
    COUNT(DISTINCT `Customer ID`) AS Total_Customers,
    ROUND(SUM(Sales) / COUNT(DISTINCT `Order ID`), 2) AS Average_Order_Value,
    ROUND((SUM(Profit) / SUM(Sales)) * 100, 2) AS Profit_Margin
FROM superstore;  
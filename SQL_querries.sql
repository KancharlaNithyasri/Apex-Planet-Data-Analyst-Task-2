create database apex;
use apex;
-- Query-1: Top 5 Highest Revenue-Generating Products
SELECT 
    `Product Name`, 
    ROUND(SUM(Sales), 2) AS Total_Revenue
FROM apex.`sample - superstore`
GROUP BY `Product Name`
ORDER BY Total_Revenue DESC

LIMIT 5;
-- Query-2: Total Profitability by Product Category and Sub-Category
SELECT 
    Category, 
    `Sub-Category`, 
    ROUND(SUM(Profit), 2) AS Total_Net_Profit
FROM apex.`sample - superstore`
GROUP BY Category, `Sub-Category`
ORDER BY Total_Net_Profit DESC;
-- Query-3: Top 5 Worst Loss-Making States
SELECT 
    State, 
    ROUND(SUM(Profit), 2) AS Total_Net_Profit
FROM apex.`sample - superstore`
GROUP BY State
HAVING Total_Net_Profit < 0
ORDER BY Total_Net_Profit ASC
LIMIT 5;
-- Query-4: Performance and Profit Margins by Customer Segment
SELECT 
    Segment,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    ROUND((SUM(Profit) / SUM(Sales)) * 100, 2) AS Profit_Margin_Percent
FROM apex.`sample - superstore`
GROUP BY Segment
ORDER BY Total_Sales DESC;
-- Query-5:Shipping Mode Efficiency and Order Volumes
SELECT 
    `Ship Mode`,
    COUNT(`Order ID`) AS Total_Orders_Shipped,
    AVG(Quantity) AS Average_Items_Per_Order,
    ROUND(AVG(Discount) * 100, 2) AS Average_Discount_Percentage
FROM apex.`sample - superstore`
GROUP BY `Ship Mode`
ORDER BY Total_Orders_Shipped DESC;

-- Query-5:Shipping Mode Efficiency and Order Volumes
SELECT 
    `Ship Mode`,
    COUNT(`Order ID`) AS Total_Orders_Shipped,
    AVG(Quantity) AS Average_Items_Per_Order,
    ROUND(AVG(Discount) * 100, 2) AS Average_Discount_Percentage
FROM apex.`sample - superstore`
GROUP BY `Ship Mode`
ORDER BY Total_Orders_Shipped DESC;

-- Query-6:Top 5 VIP High-Value Customers
SELECT 
    `Customer ID`,
    `Customer Name`,
    ROUND(SUM(Sales), 2) AS Customer_Lifetime_Value,
    COUNT(DISTINCT `Order ID`) AS Total_Unique_Visits
FROM apex.`sample - superstore`
GROUP BY `Customer ID`, `Customer Name`
ORDER BY Customer_Lifetime_Value DESC
LIMIT 5;

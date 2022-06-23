USE [Global Superstore];

--The total dataset count
SELECT COUNT(*)
FROM ORDERS;

SELECT * 
FROM ORDERS;

--Checking if Order ID column is unique by randomly selecting an Order ID
SELECT *
FROM ORDERS
WHERE [Order ID] = 'ES-2012-2080192';

--Checking if Row ID and Order ID are unique with each other
SELECT [Row ID], [Order ID], COUNT(*)
FROM ORDERS 
GROUP BY [Row ID], [Order ID]
HAVING COUNT(*)>1;

--Checking if Order Date is after Ship Date, as orders cannot be placed after being shipped
SELECT *
FROM ORDERS
WHERE [Ship Date] < [Order Date];

--Type of shipment modes present
SELECT DISTINCT [Ship Mode]
FROM ORDERS;

--Number of days taken to ship, where Ship Mode is Second Class
SELECT DATEDIFF(DAY, [Order Date], [Ship Date]) AS NumOfDays, *
FROM ORDERS
WHERE [Ship Mode] = 'Second Class';

--Checking the date range between the no of days to taken to ship the order where Ship Mode is Second Class
SELECT MIN(a.NumOfDays) AS MIN, MAX(a.NumOfDays) AS MAX
FROM(
SELECT DATEDIFF(DAY, [Order Date], [Ship Date]) AS NumOfDays, *
FROM ORDERS
WHERE [Ship Mode] = 'Second Class') AS a;

--Run the above query with different Ship Modes
SELECT MIN(a.NumOfDays) AS MIN, MAX(a.NumOfDays) AS MAX
FROM(
SELECT DATEDIFF(DAY, [Order Date], [Ship Date]) AS NumOfDays, *
FROM ORDERS
WHERE [Ship Mode] = 'First Class') AS a;

SELECT MIN(a.NumOfDays) AS MIN, MAX(a.NumOfDays) AS MAX
FROM(
SELECT DATEDIFF(DAY, [Order Date], [Ship Date]) AS NumOfDays, *
FROM ORDERS
WHERE [Ship Mode] = 'Same Day') AS a;

SELECT MIN(a.NumOfDays) AS MIN, MAX(a.NumOfDays) AS MAX
FROM(
SELECT DATEDIFF(DAY, [Order Date], [Ship Date]) AS NumOfDays, *
FROM ORDERS
WHERE [Ship Mode] = 'Standard Class') AS a;

--Checking if ustomers have done multiple orders with the same Order ID
SELECT [Customer ID], [Order ID], COUNT(*)
FROM ORDERS
GROUP BY [Customer ID], [Order ID]
ORDER BY [Customer ID];

SELECT *
FROM ORDERS
WHERE [Order ID] = 'CA-2011-138100';

--Type of Segment of Customers
SELECT DISTINCT Segment, COUNT(*) AS Count
FROM ORDERS
GROUP BY [Segment];



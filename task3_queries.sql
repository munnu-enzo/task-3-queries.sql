
-- 1. SELECT + WHERE + ORDER BY
SELECT FirstName, LastName, Country 
FROM Customers 
WHERE Country = 'USA' 
ORDER BY LastName;

-- 2. INNER JOIN Orders with Customers
SELECT o.OrderID, c.FirstName, c.LastName, o.OrderDate 
FROM Orders o
JOIN Customers c ON o.CustomerID = c.CustomerID;

-- 3. Aggregate with GROUP BY
SELECT CustomerID, SUM(Amount) AS TotalSpent 
FROM Payments 
GROUP BY CustomerID;

-- 4. Subquery: Customers who spent more than 1000
SELECT FirstName, LastName 
FROM Customers 
WHERE CustomerID IN (
    SELECT CustomerID 
    FROM Payments 
    GROUP BY CustomerID 
    HAVING SUM(Amount) > 1000
);

-- 5. Create a View for High Spenders
CREATE VIEW HighSpenders AS
SELECT CustomerID, SUM(Amount) AS TotalSpent
FROM Payments
GROUP BY CustomerID
HAVING TotalSpent > 1000;

-- 6. Create an Index on Country
CREATE INDEX idx_customer_country ON Customers(Country);

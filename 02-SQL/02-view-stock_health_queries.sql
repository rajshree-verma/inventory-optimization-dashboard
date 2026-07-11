SELECT
    ProductID,
    CurrentStock,
    ReorderLevel,
    CASE
        WHEN CurrentStock <= ReorderLevel THEN 'Low Stock'
        ELSE 'Healthy'
    END AS Stock_Status
FROM inventory;



-- 2. Products below reorder level

SELECT
    ProductID,
    CurrentStock,
    ReorderLevel
FROM inventory
WHERE CurrentStock <= ReorderLevel;



-- 3. Highest stocked products

SELECT
    ProductID,
    CurrentStock
FROM inventory
ORDER BY CurrentStock DESC;



-- 4. Total stock available by warehouse

SELECT
    Warehouse,
    SUM(CurrentStock) AS Total_Stock
FROM inventory
GROUP BY Warehouse
ORDER BY Total_Stock DESC;



-- 5. Product details with inventory information

SELECT
    p.ProductName,
    p.Category,
    p.Brand,
    i.CurrentStock,
    i.Warehouse
FROM products p
JOIN inventory i
ON p.ProductID = i.ProductID;
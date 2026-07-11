--1. Products requiring reorder with supplier details

SELECT
    p.ProductName,
    p.Supplier,
    i.CurrentStock,
    i.ReorderLevel
FROM products p
JOIN inventory i
ON p.ProductID = i.ProductID
WHERE i.CurrentStock <= i.ReorderLevel;



-- 2. Recommended order quantity

SELECT
    p.ProductName,
    i.CurrentStock,
    i.MaxStock,
    (i.MaxStock - i.CurrentStock) AS Recommended_Order_Qty
FROM products p
JOIN inventory i
ON p.ProductID = i.ProductID
WHERE i.CurrentStock <= i.ReorderLevel;



-- 3. Products with longest supplier lead time

SELECT
    p.ProductName,
    p.Supplier,
    po.LeadTimeDays
FROM purchaseorders po
JOIN products p
ON po.ProductID = p.ProductID
ORDER BY po.LeadTimeDays DESC;



-- 4. Inventory value calculation

SELECT
    p.ProductName,
    i.CurrentStock,
    p.UnitCost,
    (i.CurrentStock * p.UnitCost) AS Inventory_Value
FROM inventory i
JOIN products p
ON i.ProductID = p.ProductID
ORDER BY Inventory_Value DESC;



-- 5. Stock shortage severity

SELECT
    p.ProductName,
    i.CurrentStock,
    i.ReorderLevel,
    (i.ReorderLevel - i.CurrentStock) AS Stock_Deficit
FROM inventory i
JOIN products p
ON i.ProductID = p.ProductID
WHERE i.CurrentStock < i.ReorderLevel
ORDER BY Stock_Deficit DESC;
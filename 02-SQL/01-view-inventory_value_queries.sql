-- 1. Finding Sum of Inventory Value.

SELECT 
SUM(Inventory_Value) AS Total_Inventory_Value
FROM Inventory_Value;

-- 2. Ordering.

SELECT *
FROM Inventory_Value
ORDER BY Inventory_Value DESC;

-- Or,

SELECT *
FROM Inventory_Value
ORDER BY PRODUCTID DESC;
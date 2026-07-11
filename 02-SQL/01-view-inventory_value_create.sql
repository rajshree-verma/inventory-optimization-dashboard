CREATE VIEW Inventory_Value AS

SELECT

    p.ProductID,
    p.ProductName,
    p.Category,
    p.Brand,

    i.CurrentStock,

    p.UnitCost,

    (i.CurrentStock * p.UnitCost) AS Inventory_Value


FROM Products p

JOIN Inventory i

ON p.ProductID = i.ProductID;

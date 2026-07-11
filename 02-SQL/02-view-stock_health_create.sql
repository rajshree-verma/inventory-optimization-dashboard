CREATE OR REPLACE VIEW stock_health AS
SELECT
    i.ProductID,
    p.ProductName,
    p.Category,
    p.Brand,
    i.Warehouse,
    i.CurrentStock,
    i.ReorderLevel,
    i.MaxStock,

    CASE
        WHEN i.CurrentStock <= i.ReorderLevel THEN 'Low Stock'
        WHEN i.CurrentStock >= i.MaxStock THEN 'Over Stock'
        ELSE 'Healthy'
    END AS Stock_Status,

    i.LastRestockDate

FROM inventory i
JOIN products p
ON i.ProductID = p.ProductID;
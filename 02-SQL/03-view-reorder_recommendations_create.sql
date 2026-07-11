CREATE OR REPLACE VIEW reorder_recommendations AS
SELECT
    i.ProductID,
    p.ProductName,
    p.Category,
    p.Supplier,

    i.CurrentStock,
    i.ReorderLevel,
    i.MaxStock,

    (i.MaxStock - i.CurrentStock) AS Recommended_Order_Qty,

    CASE
        WHEN i.CurrentStock <= i.ReorderLevel
        THEN 'REORDER'
        ELSE 'NO ACTION'
    END AS Recommendation

FROM inventory i
JOIN products p
ON i.ProductID = p.ProductID;
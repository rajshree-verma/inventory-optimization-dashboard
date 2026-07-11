CREATE VIEW Inventory_Dashboard AS

SELECT

    p.ProductID,
    p.ProductName,
    p.Category,
    p.Brand,
    p.Supplier,

    i.CurrentStock,
    i.ReorderLevel,
    i.MaxStock,

    sh.Stock_Status,

    pm.Total_Units_Sold,
    pm.Movement_Category,

    rr.Recommended_Order_Quantity,
    rr.Reorder_Status,

    iv.Inventory_Value,

    sl.Average_Lead_Time,
    sl.Supply_Risk


FROM Products p

LEFT JOIN Inventory i
ON p.ProductID = i.ProductID

LEFT JOIN Stock_Health sh
ON p.ProductID = sh.ProductID

LEFT JOIN Product_Movement pm
ON p.ProductID = pm.ProductID

LEFT JOIN Reorder_Recommendations rr
ON p.ProductID = rr.ProductID

LEFT JOIN Inventory_Value iv
ON p.ProductID = iv.ProductID

LEFT JOIN Supplier_LeadTime_Analysis sl
ON p.ProductID = sl.ProductID;
CREATE VIEW Supplier_LeadTime_Analysis AS

SELECT

    p.ProductID,
    p.ProductName,
    p.Supplier,

    AVG(po.LeadTimeDays) AS Average_Lead_Time,

    SUM(po.QuantityOrdered) AS Total_Quantity_Ordered,


    CASE

        WHEN AVG(po.LeadTimeDays) >= 30
            THEN 'High Risk'

        WHEN AVG(po.LeadTimeDays) BETWEEN 15 AND 29
            THEN 'Medium Risk'

        ELSE 'Low Risk'

    END AS Supply_Risk


FROM Products p

JOIN PurchaseOrders po

ON p.ProductID = po.ProductID


GROUP BY

    p.ProductID,
    p.ProductName,
    p.Supplier;
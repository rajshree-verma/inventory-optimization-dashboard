--
SELECT * FROM SUPPLIER_LEADTIME_ANALYSIS

-- Update
--


UPDATE PurchaseOrders
SET LeadTimeDays =
CASE

--         High Risk suppliers/products
WHEN ProductID IN ('P001','P009','P017','P025','P033')
THEN 35


--         Medium Risk
WHEN ProductID IN ('P002','P006','P010','P014','P018',
                   'P022','P026','P030')
THEN 20


--          Low Risk
ELSE 7

END;

--
-- Group by and Order By


SELECT

Supplier,

AVG(Average_Lead_Time) AS Supplier_Average_Delivery

FROM Supplier_LeadTime_Analysis

GROUP BY Supplier

ORDER BY Supplier_Average_Delivery DESC;


--
--


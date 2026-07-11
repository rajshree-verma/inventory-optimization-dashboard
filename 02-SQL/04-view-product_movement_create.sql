REPLACE VIEW Product_Movement AS

WITH ProductSales AS
(
    SELECT
        ProductID,
        SUM(QuantitySold) AS Total_Units_Sold,
        COUNT(SaleID) AS Sales_Frequency
    FROM Sales
    GROUP BY ProductID
),

RankedProducts AS
(
    SELECT
        ProductID,
        Total_Units_Sold,
        Sales_Frequency,

        NTILE(10) OVER(
            ORDER BY Total_Units_Sold DESC
        ) AS Sales_Decile

    FROM ProductSales
)

SELECT

    ProductID,

    Total_Units_Sold,

    Sales_Frequency,

    Sales_Decile,

    CASE

        WHEN Sales_Decile <= 3
            THEN 'Fast Mover'

        WHEN Sales_Decile <= 7
            THEN 'Medium Mover'

        ELSE 'Slow Mover'

    END AS Movement_Category

FROM RankedProducts;
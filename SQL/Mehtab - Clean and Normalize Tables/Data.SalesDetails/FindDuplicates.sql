/* FindDuplicates.sql */
WITH RowHash AS (
    SELECT SalesDetailsID,
           HASHBYTES('SHA2_256',
               CONCAT_WS('|',
                   SalesID,
                   LineItemNumber,
                   StockID,
                   SalePrice,
                   LineItemDiscount
               )
           ) AS RowDigest
    FROM [PrestigeCars].[Data].[SalesDetails]
)
SELECT RowDigest,
       COUNT(*)                    AS duplicates,
       STRING_AGG(SalesDetailsID, ',') AS DuplicateIDs
FROM RowHash
GROUP BY RowDigest
HAVING COUNT(*) > 1;

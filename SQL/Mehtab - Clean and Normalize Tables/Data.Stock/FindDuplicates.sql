/* Author: Mehtab Mahir */
USE PrestigeCars;
GO
WITH RowHash AS (
    SELECT StockCode,
           HASHBYTES('SHA2_256',
               CONCAT_WS('|',
                   ModelID,
                   Cost,
                   RepairsCost,
                   PartsCost,
                   TransportInCost,
                   IsRHD,
                   UPPER(ISNULL(Color, N'')),
                   UPPER(ISNULL(BuyerComments, N'')),
                   DateBought,
                   TimeBought
               )
           ) AS RowDigest
    FROM [PrestigeCars].[Data].[Stock]
)
SELECT RowDigest,
       COUNT(*) AS duplicates,
       STRING_AGG(StockCode, ',') AS DuplicateIDs
FROM RowHash
GROUP BY RowDigest
HAVING COUNT(*) > 1;

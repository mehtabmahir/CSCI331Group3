/* Author: Mehtab Mahir */
USE PrestigeCars;
GO
WITH RowHash AS (
    SELECT MakeID,
           HASHBYTES('SHA2_256',
               CONCAT_WS('|',
                   UPPER(MakeName),
                   UPPER(MakeCountry)
               )
           ) AS RowDigest
    FROM [PrestigeCars].[Data].[Make]
)
SELECT RowDigest,
       COUNT(*) AS duplicates,
       STRING_AGG(MakeID, ',') AS DuplicateIDs
FROM RowHash
GROUP BY RowDigest
HAVING COUNT(*) > 1;

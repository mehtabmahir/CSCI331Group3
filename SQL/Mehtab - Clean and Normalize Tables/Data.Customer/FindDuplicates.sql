/* === 1. Compute a digest of each row (all columns except the surrogate key) === */
WITH RowHash AS (
    SELECT
        CustomerID,
        /* Normalise text: TRIM + UPPER so ‘Birmingham ’ = ‘birmingham’   */
        HASHBYTES(
            'SHA2_256',
            CONCAT_WS('|',
                UPPER(RTRIM(LTRIM(CustomerName))),
                UPPER(RTRIM(LTRIM(Address1))),
                UPPER(RTRIM(LTRIM(ISNULL(Address2,'')))),
                UPPER(RTRIM(LTRIM(Town))),
                UPPER(RTRIM(LTRIM(ISNULL(PostCode,'')))),
                UPPER(RTRIM(LTRIM(Country))),
                IsReseller,         -- bit 0/1
                IsCreditRisk        -- bit 0/1
            )
        ) AS RowDigest
    FROM [PrestigeCars].[Data].[Customer]
)

/* === 2. Show only digests that occur more than once === */
SELECT
    RowDigest,
    COUNT(*)              AS DuplicateCount,
    STRING_AGG(CustomerID, ',') WITHIN GROUP (ORDER BY CustomerID) AS DuplicateIDs
FROM RowHash
GROUP BY RowDigest
HAVING COUNT(*) > 1
ORDER BY DuplicateCount DESC;

## Steps for Data.SalesDetails Normalization, UDTs, and Constraints

*Author: Mehtab Mahir*

---

### Step 1 — FindDuplicates.sql

**Goal:** Surface any exact duplicates before touching data.

```sql
/* Author: Mehtab Mahir */
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
       COUNT(*) AS duplicates,
       STRING_AGG(SalesDetailsID, ',') AS DuplicateIDs
FROM RowHash
GROUP BY RowDigest
HAVING COUNT(*) > 1;
```

*Result: returned **0 rows** – no exact duplicates.*

---

### Step 2 — Normalize.sql

**Goal:** Trim, upper-case, and clean up legacy data.

```sql
/* Author: Mehtab Mahir */
USE PrestigeCars;
GO
UPDATE [PrestigeCars].[Data].[SalesDetails]
SET
    SalesID           = UPPER(RTRIM(LTRIM(SalesID))),
    LineItemNumber    = LineItemNumber,
    StockID           = UPPER(RTRIM(LTRIM(StockID))),
    SalePrice         = SalePrice,
    LineItemDiscount  = LineItemDiscount;
GO
```

---

### Step 3 — AlterColumnsToUDTs.sql

**Goal:** Migrate all table columns to the correct UDTs.

```sql
/* Author: Mehtab Mahir */
USE PrestigeCars;
GO

ALTER TABLE [PrestigeCars].[Data].[SalesDetails]
    ALTER COLUMN SalesDetailsID    dbo.UDT_SalesDetailsID    NOT NULL;
ALTER TABLE [PrestigeCars].[Data].[SalesDetails]
    ALTER COLUMN SalesID           dbo.UDT_SalesID           NOT NULL;
ALTER TABLE [PrestigeCars].[Data].[SalesDetails]
    ALTER COLUMN LineItemNumber    dbo.UDT_LineItemNumber    NOT NULL;
ALTER TABLE [PrestigeCars].[Data].[SalesDetails]
    ALTER COLUMN StockID           dbo.UDT_StockCode         NOT NULL;
ALTER TABLE [PrestigeCars].[Data].[SalesDetails]
    ALTER COLUMN SalePrice         dbo.UDT_SalePrice         NOT NULL;
ALTER TABLE [PrestigeCars].[Data].[SalesDetails]
    ALTER COLUMN LineItemDiscount  dbo.UDT_LineItemDiscount  NOT NULL;
GO
```

---

### Step 4 — DefaultConstraints.sql

**Goal:** Add defaults for all columns and ensure no legacy NULLs remain.

```sql
/* Author: Mehtab Mahir */
USE PrestigeCars;
GO

-- Backfill NULLs before adding constraints
UPDATE [PrestigeCars].[Data].[SalesDetails]
SET
    SalesID = ISNULL(SalesID, 0),
    LineItemNumber = ISNULL(LineItemNumber, 1),
    StockID = ISNULL(StockID, N''),
    SalePrice = ISNULL(SalePrice, 0.00),
    LineItemDiscount = ISNULL(LineItemDiscount, 0.00);

-- Add defaults (idempotent)
IF NOT EXISTS (
    SELECT 1 FROM sys.default_constraints 
    WHERE parent_object_id = OBJECT_ID('[PrestigeCars].[Data].[SalesDetails]') 
      AND name = 'DF_SalesDetails_SalesID'
)
    ALTER TABLE [PrestigeCars].[Data].[SalesDetails] 
    ADD CONSTRAINT DF_SalesDetails_SalesID DEFAULT(0) FOR SalesID;

IF NOT EXISTS (
    SELECT 1 FROM sys.default_constraints 
    WHERE parent_object_id = OBJECT_ID('[PrestigeCars].[Data].[SalesDetails]') 
      AND name = 'DF_SalesDetails_LineItemNumber'
)
    ALTER TABLE [PrestigeCars].[Data].[SalesDetails] 
    ADD CONSTRAINT DF_SalesDetails_LineItemNumber DEFAULT(1) FOR LineItemNumber;

IF NOT EXISTS (
    SELECT 1 FROM sys.default_constraints 
    WHERE parent_object_id = OBJECT_ID('[PrestigeCars].[Data].[SalesDetails]') 
      AND name = 'DF_SalesDetails_StockID'
)
    ALTER TABLE [PrestigeCars].[Data].[SalesDetails] 
    ADD CONSTRAINT DF_SalesDetails_StockID DEFAULT(N'') FOR StockID;

IF NOT EXISTS (
    SELECT 1 FROM sys.default_constraints 
    WHERE parent_object_id = OBJECT_ID('[PrestigeCars].[Data].[SalesDetails]') 
      AND name = 'DF_SalesDetails_SalePrice'
)
    ALTER TABLE [PrestigeCars].[Data].[SalesDetails] 
    ADD CONSTRAINT DF_SalesDetails_SalePrice DEFAULT(0.00) FOR SalePrice;

IF NOT EXISTS (
    SELECT 1 FROM sys.default_constraints 
    WHERE parent_object_id = OBJECT_ID('[PrestigeCars].[Data].[SalesDetails]') 
      AND name = 'DF_SalesDetails_LineItemDiscount'
)
    ALTER TABLE [PrestigeCars].[Data].[SalesDetails] 
    ADD CONSTRAINT DF_SalesDetails_LineItemDiscount DEFAULT(0.00) FOR LineItemDiscount;

GO
```

---

### Step 5 — CheckBlanks.sql

**Goal:** Verify there are no NULLs/blanks after all prior steps.

```sql
/* Author: Mehtab Mahir */
USE PrestigeCars;
GO

SELECT
    SUM(CASE WHEN SalesID IS NULL OR SalesID = 0 THEN 1 ELSE 0 END)                 AS blank_salesid,
    SUM(CASE WHEN LineItemNumber IS NULL OR LineItemNumber = 0 THEN 1 ELSE 0 END)   AS blank_lineitemnumber,
    SUM(CASE WHEN StockID IS NULL OR StockID = N'' THEN 1 ELSE 0 END)               AS blank_stockid,
    SUM(CASE WHEN SalePrice IS NULL OR SalePrice = 0 THEN 1 ELSE 0 END)             AS blank_saleprice,
    SUM(CASE WHEN LineItemDiscount IS NULL THEN 1 ELSE 0 END)                       AS blank_discount
FROM [PrestigeCars].[Data].[SalesDetails];
```

*Result: All counts should be 0 if table is fully clean.*

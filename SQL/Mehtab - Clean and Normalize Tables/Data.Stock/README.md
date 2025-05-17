
## Steps for Data.Stock Normalization, UDTs, and Constraints

*Author: Mehtab Mahir*

---

### Step 1 — FindDuplicates.sql

**Goal:** Surface any exact duplicates before touching data.

```sql
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
```

*Result: returned **0 rows** – no exact duplicates.*

---

### Step 2 — Normalize.sql

**Goal:** Clean, trim, and upper-case data.

```sql
/* Author: Mehtab Mahir */
USE PrestigeCars;
GO
UPDATE [PrestigeCars].[Data].[Stock]
SET
    Color         = UPPER(RTRIM(LTRIM(Color))),
    BuyerComments = RTRIM(LTRIM(BuyerComments));
GO
```

---

### Step 3 — AlterColumnsToUDTs.sql

**Goal:** Convert all columns to use their UDT types.
*Note: If you are running on a fresh/original backup (with no custom constraints yet added), you do NOT need to drop constraints before altering column types. If constraints already exist, drop/re-add as needed.*

```sql
/* AlterColumnsToUDTs.sql */
/* Author: Mehtab Mahir */
USE PrestigeCars;
GO

-- Backfill NULLs in all NOT NULL columns before altering types
UPDATE [PrestigeCars].[Data].[Stock] SET ModelID           = 0            WHERE ModelID IS NULL;
UPDATE [PrestigeCars].[Data].[Stock] SET Cost              = 0.00         WHERE Cost IS NULL;
UPDATE [PrestigeCars].[Data].[Stock] SET RepairsCost       = 0.00         WHERE RepairsCost IS NULL;
UPDATE [PrestigeCars].[Data].[Stock] SET PartsCost         = 0.00         WHERE PartsCost IS NULL;
UPDATE [PrestigeCars].[Data].[Stock] SET TransportInCost   = 0.00         WHERE TransportInCost IS NULL;
UPDATE [PrestigeCars].[Data].[Stock] SET IsRHD             = 0            WHERE IsRHD IS NULL;
UPDATE [PrestigeCars].[Data].[Stock] SET Color             = N''          WHERE Color IS NULL;
UPDATE [PrestigeCars].[Data].[Stock] SET DateBought        = '2000-01-01' WHERE DateBought IS NULL;
UPDATE [PrestigeCars].[Data].[Stock] SET TimeBought        = '00:00:00'   WHERE TimeBought IS NULL;

ALTER TABLE [PrestigeCars].[Data].[Stock]
    ALTER COLUMN StockCode         dbo.UDT_StockCode       NOT NULL;
ALTER TABLE [PrestigeCars].[Data].[Stock]
    ALTER COLUMN ModelID           dbo.UDT_ModelID         NOT NULL;
ALTER TABLE [PrestigeCars].[Data].[Stock]
    ALTER COLUMN Cost              dbo.UDT_Cost            NOT NULL;
ALTER TABLE [PrestigeCars].[Data].[Stock]
    ALTER COLUMN RepairsCost       dbo.UDT_RepairsCost     NOT NULL;
ALTER TABLE [PrestigeCars].[Data].[Stock]
    ALTER COLUMN PartsCost         dbo.UDT_PartsCost       NOT NULL;
ALTER TABLE [PrestigeCars].[Data].[Stock]
    ALTER COLUMN TransportInCost   dbo.UDT_TransportCost   NOT NULL;
ALTER TABLE [PrestigeCars].[Data].[Stock]
    ALTER COLUMN IsRHD             dbo.UDT_IsRHD           NOT NULL;
ALTER TABLE [PrestigeCars].[Data].[Stock]
    ALTER COLUMN Color             dbo.UDT_Color           NOT NULL;
ALTER TABLE [PrestigeCars].[Data].[Stock]
    ALTER COLUMN BuyerComments     dbo.UDT_BuyerComments   NULL;
ALTER TABLE [PrestigeCars].[Data].[Stock]
    ALTER COLUMN DateBought        dbo.UDT_DateBought      NOT NULL;
ALTER TABLE [PrestigeCars].[Data].[Stock]
    ALTER COLUMN TimeBought        dbo.UDT_TimeBought      NOT NULL;
GO
```

---

### Step 4 — DefaultConstraints.sql

**Goal:** Add defaults for all columns and ensure no legacy NULLs remain.

```sql
/* DefaultConstraints.sql */
/* Author: Mehtab Mahir */
USE PrestigeCars;
GO
-- Backfill existing NULLs to default values before applying constraints
UPDATE [PrestigeCars].[Data].[Stock]
SET
    Cost            = ISNULL(Cost, 0.00),
    RepairsCost     = ISNULL(RepairsCost, 0.00),
    PartsCost       = ISNULL(PartsCost, 0.00),
    TransportInCost = ISNULL(TransportInCost, 0.00),
    IsRHD           = ISNULL(IsRHD, 0),
    Color           = ISNULL(Color, N''),
    BuyerComments   = ISNULL(BuyerComments, N''),
    DateBought      = ISNULL(DateBought, '2000-01-01'),
    TimeBought      = ISNULL(TimeBought, '00:00:00');
GO
-- Add default constraints (idempotent)
IF NOT EXISTS (SELECT 1 FROM sys.default_constraints WHERE parent_object_id = OBJECT_ID('[PrestigeCars].[Data].[Stock]') AND name='DF_Stock_Cost')
    ALTER TABLE [PrestigeCars].[Data].[Stock] ADD CONSTRAINT DF_Stock_Cost DEFAULT(0.00) FOR Cost;
IF NOT EXISTS (SELECT 1 FROM sys.default_constraints WHERE parent_object_id = OBJECT_ID('[PrestigeCars].[Data].[Stock]') AND name='DF_Stock_RepairsCost')
    ALTER TABLE [PrestigeCars].[Data].[Stock] ADD CONSTRAINT DF_Stock_RepairsCost DEFAULT(0.00) FOR RepairsCost;
IF NOT EXISTS (SELECT 1 FROM sys.default_constraints WHERE parent_object_id = OBJECT_ID('[PrestigeCars].[Data].[Stock]') AND name='DF_Stock_PartsCost')
    ALTER TABLE [PrestigeCars].[Data].[Stock] ADD CONSTRAINT DF_Stock_PartsCost DEFAULT(0.00) FOR PartsCost;
IF NOT EXISTS (SELECT 1 FROM sys.default_constraints WHERE parent_object_id = OBJECT_ID('[PrestigeCars].[Data].[Stock]') AND name='DF_Stock_TransportInCost')
    ALTER TABLE [PrestigeCars].[Data].[Stock] ADD CONSTRAINT DF_Stock_TransportInCost DEFAULT(0.00) FOR TransportInCost;
IF NOT EXISTS (SELECT 1 FROM sys.default_constraints WHERE parent_object_id = OBJECT_ID('[PrestigeCars].[Data].[Stock]') AND name='DF_Stock_IsRHD')
    ALTER TABLE [PrestigeCars].[Data].[Stock] ADD CONSTRAINT DF_Stock_IsRHD DEFAULT(0) FOR IsRHD;
IF NOT EXISTS (SELECT 1 FROM sys.default_constraints WHERE parent_object_id = OBJECT_ID('[PrestigeCars].[Data].[Stock]') AND name='DF_Stock_Color')
    ALTER TABLE [PrestigeCars].[Data].[Stock] ADD CONSTRAINT DF_Stock_Color DEFAULT(N'') FOR Color;
IF NOT EXISTS (SELECT 1 FROM sys.default_constraints WHERE parent_object_id = OBJECT_ID('[PrestigeCars].[Data].[Stock]') AND name='DF_Stock_BuyerComments')
    ALTER TABLE [PrestigeCars].[Data].[Stock] ADD CONSTRAINT DF_Stock_BuyerComments DEFAULT(N'') FOR BuyerComments;
IF NOT EXISTS (SELECT 1 FROM sys.default_constraints WHERE parent_object_id = OBJECT_ID('[PrestigeCars].[Data].[Stock]') AND name='DF_Stock_DateBought')
    ALTER TABLE [PrestigeCars].[Data].[Stock] ADD CONSTRAINT DF_Stock_DateBought DEFAULT('2000-01-01') FOR DateBought;
IF NOT EXISTS (SELECT 1 FROM sys.default_constraints WHERE parent_object_id = OBJECT_ID('[PrestigeCars].[Data].[Stock]') AND name='DF_Stock_TimeBought')
    ALTER TABLE [PrestigeCars].[Data].[Stock] ADD CONSTRAINT DF_Stock_TimeBought DEFAULT('00:00:00') FOR TimeBought;
GO
```

---

### Step 5 — CheckBlanks.sql

**Goal:**
Accurately report only true blanks (NULLs) for numbers/dates, and blanks or empty strings for text.
*Note: No longer flags zeros as blanks for numeric columns.*

```sql
/* CheckBlanks.sql */
/* Author: Mehtab Mahir */
USE PrestigeCars;
GO
SELECT
    SUM(CASE WHEN Cost            IS NULL THEN 1 ELSE 0 END) AS blank_cost,
    SUM(CASE WHEN RepairsCost     IS NULL THEN 1 ELSE 0 END) AS blank_repairs,
    SUM(CASE WHEN PartsCost       IS NULL THEN 1 ELSE 0 END) AS blank_parts,
    SUM(CASE WHEN TransportInCost IS NULL THEN 1 ELSE 0 END) AS blank_transport,
    SUM(CASE WHEN IsRHD           IS NULL THEN 1 ELSE 0 END) AS blank_isrhd,
    SUM(CASE WHEN Color           IS NULL OR Color = N'' THEN 1 ELSE 0 END) AS blank_color,
    SUM(CASE WHEN BuyerComments   IS NULL OR BuyerComments = N'' THEN 1 ELSE 0 END) AS blank_buyercomments,
    SUM(CASE WHEN DateBought      IS NULL THEN 1 ELSE 0 END) AS blank_datebought,
    SUM(CASE WHEN TimeBought      IS NULL THEN 1 ELSE 0 END) AS blank_timebought
FROM [PrestigeCars].[Data].[Stock];
```

*Result: all counts = 0 (expected) if your data is clean.
**Note:** This step now only reports true blanks/NULLs, not zeros for numeric fields.*

---
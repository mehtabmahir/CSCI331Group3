## Steps for Data.Customer Normalization, UDTs, and Constraints

*Author: Mehtab Mahir*

---

### Step 1 — FindDuplicates.sql

**Goal:** Surface any exact duplicates before touching data.

```sql
/* Author: Mehtab Mahir */
USE PrestigeCars;
GO
WITH RowHash AS (
    SELECT CustomerID,
           HASHBYTES('SHA2_256',
               CONCAT_WS('|',
                   UPPER(CustomerName),
                   UPPER(Address1),
                   UPPER(ISNULL(Address2,N'')),
                   UPPER(Town),
                   UPPER(ISNULL(PostCode,N'')),
                   UPPER(Country),
                   IsReseller,
                   IsCreditRisk)
           ) AS RowDigest
    FROM [PrestigeCars].[Data].[Customer]
)
SELECT RowDigest,
       COUNT(*)                    AS duplicates,
       STRING_AGG(CustomerID, ',') AS DuplicateIDs
FROM RowHash
GROUP BY RowDigest
HAVING COUNT(*) > 1;
```

*Result: returned **0 rows** – no exact duplicates.*

---

### Step 2 — Normalize.sql

**Goal:** Trim, upper-case, de-null legacy data.

```sql
/* Author: Mehtab Mahir */
USE PrestigeCars;
GO
UPDATE [PrestigeCars].[Data].[Customer]
SET CustomerID   = UPPER(RTRIM(LTRIM(CustomerID))),
    CustomerName = RTRIM(LTRIM(CustomerName)),
    Address1     = RTRIM(LTRIM(Address1)),
    Address2     = NULLIF(RTRIM(LTRIM(Address2)), ''),
    Town         = RTRIM(LTRIM(Town)),
    PostCode     = UPPER(REPLACE(PostCode,' ','')),
    Country      = UPPER(RTRIM(LTRIM(Country))),
    IsReseller   = ISNULL(IsReseller,0),
    IsCreditRisk = ISNULL(IsCreditRisk,0);
GO
```

---

### Step 3 — AlterColumnsToUDTs.sql

**Goal:** Convert all columns to use their UDT types.
*Note: If you are running on a fresh/original backup (with no custom constraints yet added), you do NOT need to drop constraints before altering column types. If constraints already exist, drop/re-add as shown earlier.*

```sql
/* AlterColumnsToUDTs.sql */
/* Author: Mehtab Mahir */
USE PrestigeCars;
GO

ALTER TABLE [PrestigeCars].[Data].[Customer]
    ALTER COLUMN CustomerID    dbo.UDT_CustomerID     NOT NULL;
ALTER TABLE [PrestigeCars].[Data].[Customer]
    ALTER COLUMN CustomerName  dbo.UDT_CustomerName   NOT NULL;
ALTER TABLE [PrestigeCars].[Data].[Customer]
    ALTER COLUMN Address1      dbo.UDT_Address        NOT NULL;
ALTER TABLE [PrestigeCars].[Data].[Customer]
    ALTER COLUMN Address2      dbo.UDT_Address        NULL;
ALTER TABLE [PrestigeCars].[Data].[Customer]
    ALTER COLUMN Town          dbo.UDT_Address        NOT NULL;
ALTER TABLE [PrestigeCars].[Data].[Customer]
    ALTER COLUMN PostCode      dbo.UDT_CountryISO2    NOT NULL;
ALTER TABLE [PrestigeCars].[Data].[Customer]
    ALTER COLUMN Country       dbo.UDT_CountryName    NOT NULL;
ALTER TABLE [PrestigeCars].[Data].[Customer]
    ALTER COLUMN IsReseller    dbo.UDT_IsReseller     NOT NULL;
ALTER TABLE [PrestigeCars].[Data].[Customer]
    ALTER COLUMN IsCreditRisk  dbo.UDT_IsCreditRisk   NOT NULL;
GO
```

---

---

### Step 4 — DefaultConstraints.sql

**Goal:** Add defaults for all columns and ensure no legacy NULLs remain.

```sql
/* DefaultConstraints.sql */
/* Author: Mehtab Mahir */
USE PrestigeCars;
GO
-- Backfill existing NULLs to default values before applying constraints
UPDATE [PrestigeCars].[Data].[Customer]
SET
    CustomerName = ISNULL(CustomerName, N''),
    Address1     = ISNULL(Address1, N''),
    Address2     = ISNULL(Address2, N''),
    Town         = ISNULL(Town, N'Unknown'),
    PostCode     = ISNULL(PostCode, N'Unknown'),
    Country      = ISNULL(Country, N''),
    IsReseller   = ISNULL(IsReseller, 0),
    IsCreditRisk = ISNULL(IsCreditRisk, 0);
GO
-- Add default constraints (idempotent)
IF NOT EXISTS (SELECT 1 FROM sys.default_constraints WHERE parent_object_id = OBJECT_ID('[PrestigeCars].[Data].[Customer]') AND name='DF_Customer_CustomerName')
    ALTER TABLE [PrestigeCars].[Data].[Customer] ADD CONSTRAINT DF_Customer_CustomerName DEFAULT(N'')         FOR CustomerName;
IF NOT EXISTS (SELECT 1 FROM sys.default_constraints WHERE parent_object_id = OBJECT_ID('[PrestigeCars].[Data].[Customer]') AND name='DF_Customer_Address1')
    ALTER TABLE [PrestigeCars].[Data].[Customer] ADD CONSTRAINT DF_Customer_Address1     DEFAULT(N'')         FOR Address1;
IF NOT EXISTS (SELECT 1 FROM sys.default_constraints WHERE parent_object_id = OBJECT_ID('[PrestigeCars].[Data].[Customer]') AND name='DF_Customer_Address2')
    ALTER TABLE [PrestigeCars].[Data].[Customer] ADD CONSTRAINT DF_Customer_Address2     DEFAULT(N'')         FOR Address2;
IF NOT EXISTS (SELECT 1 FROM sys.default_constraints WHERE parent_object_id = OBJECT_ID('[PrestigeCars].[Data].[Customer]') AND name='DF_Customer_Town')
    ALTER TABLE [PrestigeCars].[Data].[Customer] ADD CONSTRAINT DF_Customer_Town         DEFAULT(N'Unknown')  FOR Town;
IF NOT EXISTS (SELECT 1 FROM sys.default_constraints WHERE parent_object_id = OBJECT_ID('[PrestigeCars].[Data].[Customer]') AND name='DF_Customer_PostCode')
    ALTER TABLE [PrestigeCars].[Data].[Customer] ADD CONSTRAINT DF_Customer_PostCode     DEFAULT(N'Unknown')  FOR PostCode;
IF NOT EXISTS (SELECT 1 FROM sys.default_constraints WHERE parent_object_id = OBJECT_ID('[PrestigeCars].[Data].[Customer]') AND name='DF_Customer_Country')
    ALTER TABLE [PrestigeCars].[Data].[Customer] ADD CONSTRAINT DF_Customer_Country      DEFAULT(N'')         FOR Country;
IF NOT EXISTS (SELECT 1 FROM sys.default_constraints WHERE parent_object_id = OBJECT_ID('[PrestigeCars].[Data].[Customer]') AND name='DF_Customer_IsReseller')
    ALTER TABLE [PrestigeCars].[Data].[Customer] ADD CONSTRAINT DF_Customer_IsReseller   DEFAULT(0)           FOR IsReseller;
IF NOT EXISTS (SELECT 1 FROM sys.default_constraints WHERE parent_object_id = OBJECT_ID('[PrestigeCars].[Data].[Customer]') AND name='DF_Customer_IsCreditRisk')
    ALTER TABLE [PrestigeCars].[Data].[Customer] ADD CONSTRAINT DF_Customer_IsCreditRisk DEFAULT(0)           FOR IsCreditRisk;
IF NOT EXISTS (SELECT 1 FROM sys.check_constraints WHERE parent_object_id = OBJECT_ID('[PrestigeCars].[Data].[Customer]') AND name='CK_Customer_PostCodeLen')
    ALTER TABLE [PrestigeCars].[Data].[Customer] ADD CONSTRAINT CK_Customer_PostCodeLen CHECK (LEN(PostCode) <= 8 OR PostCode IS NULL);
GO
```

---

### Step 5 — CheckBlanks.sql

**Goal:** verify no legacy NULL / blank values after back-fill.

```sql
/* CheckBlanks.sql */
/* Author: Mehtab Mahir */
USE PrestigeCars;
GO
SELECT
    SUM(CASE WHEN CustomerName IS NULL OR CustomerName = N'' THEN 1 ELSE 0 END) AS blank_name,
    SUM(CASE WHEN Address1     IS NULL OR Address1     = N'' THEN 1 ELSE 0 END) AS blank_addr1,
    SUM(CASE WHEN Town         IS NULL OR Town         = N'' THEN 1 ELSE 0 END) AS blank_town,
    SUM(CASE WHEN PostCode     IS NULL OR PostCode     = N'' THEN 1 ELSE 0 END) AS blank_postcode,
    SUM(CASE WHEN Country      IS NULL OR Country      = N'' THEN 1 ELSE 0 END) AS blank_country,
    SUM(CASE WHEN IsReseller   IS NULL OR IsReseller  NOT IN (0,1) THEN 1 ELSE 0 END) AS bad_reseller,
    SUM(CASE WHEN IsCreditRisk IS NULL OR IsCreditRisk NOT IN (0,1) THEN 1 ELSE 0 END) AS bad_credit
FROM [PrestigeCars].[Data].[Customer];
```

*Result: all counts = 0 (expected). Had to fix PostCode initially.*

---

### Step 1 — FindDuplicates.sql

**Goal:** surface any exact duplicates before touching data.

```sql
/* FindDuplicates.sql */
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

**Goal:** trim, upper-case, de-null legacy data.

```sql
/* Normalize.sql */
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

### Step 3 — CheckUDTs.sql

**Goal:** create the alias types you need (idempotent).

```sql
/* CheckUDTs.sql */
USE PrestigeCars;
GO
IF NOT EXISTS (SELECT 1 FROM sys.types WHERE name='UDT_CustomerID')
    CREATE TYPE dbo.UDT_CustomerID      FROM NVARCHAR(5)   NOT NULL;
IF NOT EXISTS (SELECT 1 FROM sys.types WHERE name='UDT_CustomerName')
    CREATE TYPE dbo.UDT_CustomerName    FROM NVARCHAR(150) NOT NULL;
IF NOT EXISTS (SELECT 1 FROM sys.types WHERE name='UDT_Address')
    CREATE TYPE dbo.UDT_Address         FROM NVARCHAR(50)  NULL;
IF NOT EXISTS (SELECT 1 FROM sys.types WHERE name='UDT_IsReseller')
    CREATE TYPE dbo.UDT_IsReseller      FROM BIT           NOT NULL;
IF NOT EXISTS (SELECT 1 FROM sys.types WHERE name='UDT_IsCreditRisk')
    CREATE TYPE dbo.UDT_IsCreditRisk    FROM BIT           NOT NULL;
IF NOT EXISTS (SELECT 1 FROM sys.types WHERE name='UDT_CountryISO2')
    CREATE TYPE dbo.UDT_CountryISO2     FROM NCHAR(10)     NULL;  -- keep 10 or change to CHAR(2)
GO
```

*(Nine* `ALTER TABLE … ALTER COLUMN …` *statements then converted every column to its UDT.)*

---

### Step 4 — DefaultConstraints.sql

**Goal:** add **all** defaults—final values shown; idempotent.

```sql
/* DefaultConstraints.sql */
USE PrestigeCars;
GO
-- CustomerName ''
IF NOT EXISTS (SELECT 1 FROM sys.default_constraints WHERE parent_object_id = OBJECT_ID('[PrestigeCars].[Data].[Customer]') AND name='DF_Customer_CustomerName')
    ALTER TABLE [PrestigeCars].[Data].[Customer] ADD CONSTRAINT DF_Customer_CustomerName DEFAULT(N'')         FOR CustomerName;

-- Address1 ''
IF NOT EXISTS (SELECT 1 FROM sys.default_constraints WHERE parent_object_id = OBJECT_ID('[PrestigeCars].[Data].[Customer]') AND name='DF_Customer_Address1')
    ALTER TABLE [PrestigeCars].[Data].[Customer] ADD CONSTRAINT DF_Customer_Address1     DEFAULT(N'')         FOR Address1;

-- Address2 ''
IF NOT EXISTS (SELECT 1 FROM sys.default_constraints WHERE parent_object_id = OBJECT_ID('[PrestigeCars].[Data].[Customer]') AND name='DF_Customer_Address2')
    ALTER TABLE [PrestigeCars].[Data].[Customer] ADD CONSTRAINT DF_Customer_Address2     DEFAULT(N'')         FOR Address2;

-- Town 'Unknown'
IF NOT EXISTS (SELECT 1 FROM sys.default_constraints WHERE parent_object_id = OBJECT_ID('[PrestigeCars].[Data].[Customer]') AND name='DF_Customer_Town')
    ALTER TABLE [PrestigeCars].[Data].[Customer] ADD CONSTRAINT DF_Customer_Town         DEFAULT(N'Unknown')  FOR Town;

-- PostCode 'Unknown'
IF NOT EXISTS (SELECT 1 FROM sys.default_constraints WHERE parent_object_id = OBJECT_ID('[PrestigeCars].[Data].[Customer]') AND name='DF_Customer_PostCode')
    ALTER TABLE [PrestigeCars].[Data].[Customer] ADD CONSTRAINT DF_Customer_PostCode     DEFAULT(N'Unknown')  FOR PostCode;

-- Country ''
IF NOT EXISTS (SELECT 1 FROM sys.default_constraints WHERE parent_object_id = OBJECT_ID('[PrestigeCars].[Data].[Customer]') AND name='DF_Customer_Country')
    ALTER TABLE [PrestigeCars].[Data].[Customer] ADD CONSTRAINT DF_Customer_Country      DEFAULT(N'')         FOR Country;

-- IsReseller 0
IF NOT EXISTS (SELECT 1 FROM sys.default_constraints WHERE parent_object_id = OBJECT_ID('[PrestigeCars].[Data].[Customer]') AND name='DF_Customer_IsReseller')
    ALTER TABLE [PrestigeCars].[Data].[Customer] ADD CONSTRAINT DF_Customer_IsReseller   DEFAULT(0)           FOR IsReseller;

-- IsCreditRisk 0
IF NOT EXISTS (SELECT 1 FROM sys.default_constraints WHERE parent_object_id = OBJECT_ID('[PrestigeCars].[Data].[Customer]') AND name='DF_Customer_IsCreditRisk')
    ALTER TABLE [PrestigeCars].[Data].[Customer] ADD CONSTRAINT DF_Customer_IsCreditRisk DEFAULT(0)           FOR IsCreditRisk;

-- Postcode length ≤ 8
IF NOT EXISTS (SELECT 1 FROM sys.check_constraints WHERE parent_object_id = OBJECT_ID('[PrestigeCars].[Data].[Customer]') AND name='CK_Customer_PostCodeLen')
    ALTER TABLE [PrestigeCars].[Data].[Customer] ADD CONSTRAINT CK_Customer_PostCodeLen CHECK (LEN(PostCode) <= 8 OR PostCode IS NULL);
GO
```

---

### Step 5 — CheckBlanks.sql

**Goal:** verify no legacy NULL / blank values after back-fill.

```sql
/* CheckBlanks.sql */
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


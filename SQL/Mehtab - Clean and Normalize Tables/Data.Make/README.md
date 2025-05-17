## Steps for Data.Make Normalization, UDTs, and Constraints

*Author: Mehtab Mahir*

---

### Step 1 — FindDuplicates.sql

**Goal:** Surface any exact duplicates before touching data.

```sql
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
```

*Result: returned **0 rows** – no exact duplicates.*

---

### Step 2 — Normalize.sql

**Goal:** Trim, upper-case, and clean up legacy data.

```sql
/* Author: Mehtab Mahir */
USE PrestigeCars;
GO
UPDATE [PrestigeCars].[Data].[Make]
SET
    MakeName     = RTRIM(LTRIM(MakeName)),
    MakeCountry  = UPPER(RTRIM(LTRIM(MakeCountry)));
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

ALTER TABLE [PrestigeCars].[Data].[Make]
    ALTER COLUMN MakeID        dbo.UDT_MakeID        NOT NULL;
ALTER TABLE [PrestigeCars].[Data].[Make]
    ALTER COLUMN MakeName      dbo.UDT_MakeName      NOT NULL;
ALTER TABLE [PrestigeCars].[Data].[Make]
    ALTER COLUMN MakeCountry   dbo.UDT_MakeCountry   NOT NULL;
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
UPDATE [PrestigeCars].[Data].[Make]
SET
    MakeName     = ISNULL(MakeName, N''),
    MakeCountry  = ISNULL(MakeCountry, N'');
GO
-- Add default constraints (idempotent)
IF NOT EXISTS (SELECT 1 FROM sys.default_constraints WHERE parent_object_id = OBJECT_ID('[PrestigeCars].[Data].[Make]') AND name='DF_Make_MakeName')
    ALTER TABLE [PrestigeCars].[Data].[Make] ADD CONSTRAINT DF_Make_MakeName DEFAULT(N'')     FOR MakeName;
IF NOT EXISTS (SELECT 1 FROM sys.default_constraints WHERE parent_object_id = OBJECT_ID('[PrestigeCars].[Data].[Make]') AND name='DF_Make_MakeCountry')
    ALTER TABLE [PrestigeCars].[Data].[Make] ADD CONSTRAINT DF_Make_MakeCountry DEFAULT(N'')  FOR MakeCountry;
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
    SUM(CASE WHEN MakeName    IS NULL OR MakeName = N'' THEN 1 ELSE 0 END) AS blank_makename,
    SUM(CASE WHEN MakeCountry IS NULL OR MakeCountry = N'' THEN 1 ELSE 0 END) AS blank_makecountry
FROM [PrestigeCars].[Data].[Make];
```

*Result: all counts = 0 (expected).*

---

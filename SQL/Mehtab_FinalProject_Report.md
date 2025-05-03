# Prestige Cars Normalized Database – Initial Work Report

**Prepared by:** Mehtab Mahir
**Environment:** SQL Server (Docker on WSL2), SSMS
**Work Completed:** Initial database and setup scripts created

---

## Files Created

### `CreateDB.sql`

Creates the original working database:

```sql
CREATE DATABASE PrestigeCars;
GO
```

Used to load the instructor-provided `PrestigeCarsDatabaseScript.sql` file containing raw data and denormalized schema.

---

### `CreateNormDB.sql`

Creates the final working database for the normalized version:

```sql
CREATE DATABASE PrestigeCarsNorm;
GO

USE PrestigeCarsNorm;
GO

CREATE SCHEMA process;
GO
```

---

### `CreateSchemas.sql`

Stored procedure to create the schemas needed for organizing the final database:

```sql
CREATE PROCEDURE process.CreateSchemas
AS
BEGIN
    EXEC('CREATE SCHEMA data');
    EXEC('CREATE SCHEMA reference');
    EXEC('CREATE SCHEMA output');
    EXEC('CREATE SCHEMA staging');
END;
GO
```

Executed using:

```sql
EXEC process.CreateSchemas;
```

---

### `CreateUDTs.sql`

Stored procedure to define all user-defined data types:

```sql
CREATE PROCEDURE process.CreateUDTs
AS
BEGIN
    CREATE TYPE LongString FROM NVARCHAR(50);
    CREATE TYPE ShortString FROM NVARCHAR(20);
    CREATE TYPE CurrencyCode FROM CHAR(3);
    CREATE TYPE ISOCountryCode FROM CHAR(2);
    CREATE TYPE YesNoBit FROM BIT;
    CREATE TYPE StandardDate FROM DATE;
    CREATE TYPE MoneyAmount FROM DECIMAL(18,4);
    CREATE TYPE LargeDescription FROM NVARCHAR(255);
END;
GO
```

Executed using:

```sql
EXEC process.CreateUDTs;
```

---

## Summary

* `PrestigeCars` database created and populated with initial data
* `PrestigeCarsNorm` database created as the target for normalization
* All required schemas scripted and generated
* UDTs defined to standardize column types

All procedures executed successfully. Ready to begin defining tables in the `data` and `reference` schemas.

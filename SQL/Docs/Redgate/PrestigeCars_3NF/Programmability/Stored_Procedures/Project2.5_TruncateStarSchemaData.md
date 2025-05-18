#### 

[Project](../../../../../index.md) > [localhost,13001](../../../../index.md) > [User databases](../../../index.md) > [PrestigeCars_3NF](../../index.md) > Programmability > [Stored Procedures](Stored_Procedures.md) > Project2.5.TruncateStarSchemaData

# ![Stored Procedures](../../../../../Images/StoredProcedure32.png) [Project2.5].[TruncateStarSchemaData]

---

## <a name="#properties"></a>Properties

| Property | Value |
|---|---|
| ANSI Nulls On | YES |
| Quoted Identifier On | YES |


---

## <a name="#parameters"></a>Parameters

| Name | Data Type | Max Length (Bytes) |
|---|---|---|
| @UserAuthorizationKey | int | 4 |


---

## <a name="#sqlscript"></a>SQL Script

```sql
CREATE PROCEDURE [Project2.5].[TruncateStarSchemaData]
    @UserAuthorizationKey INT
AS
BEGIN
    SET NOCOUNT ON;
    DECLARE TableCursor CURSOR FOR
        SELECT DISTINCT '[' + TABLE_SCHEMA + '].[' + TABLE_NAME + ']' AS FullyQualifiedTableName
        FROM INFORMATION_SCHEMA.TABLES
        WHERE TABLE_TYPE = 'BASE TABLE' AND TABLE_SCHEMA LIKE 'Project3%';  -- adjust schema filter as needed

    OPEN TableCursor;
    DECLARE @TableName NVARCHAR(255);
    DECLARE @SQL NVARCHAR(MAX);

    FETCH NEXT FROM TableCursor INTO @TableName;
    WHILE @@FETCH_STATUS = 0
    BEGIN
        SET @SQL = 'TRUNCATE TABLE ' + @TableName;
        EXEC(@SQL);
        FETCH NEXT FROM TableCursor INTO @TableName;
    END

    CLOSE TableCursor;
    DEALLOCATE TableCursor;

    -- Log workflow step (calls tracking proc if exists)
    EXEC [Process].[usp_TrackWorkFlow]
         @WorkFlowStepDescription = 'Truncate Star Schema Data.',
         @UserAuthorizationKey = @UserAuthorizationKey,
         @WorkFlowStepTableRowCount = -1;
END;
GO

```


---

## <a name="#uses"></a>Uses

* [Project2.5](../../Security/Schemas/dbo_Project2.5.md)


---

###### Author:  m3

###### Copyright 2025 - All Rights Reserved

###### Created: Sunday, 18 May 2025 6:12:50 pm


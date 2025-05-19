#### 

[Project](../../../../../index.md) > [localhost,13001](../../../../index.md) > [User databases](../../../index.md) > [PrestigeCars_3NF](../../index.md) > Programmability > [Stored Procedures](Stored_Procedures.md) > Project2.5.DropForeignKeysFromStarSchemaData

# ![Stored Procedures](../../../../../Images/StoredProcedure32.png) [Project2.5].[DropForeignKeysFromStarSchemaData]

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
CREATE PROCEDURE [Project2.5].[DropForeignKeysFromStarSchemaData]
    @UserAuthorizationKey INT
AS
BEGIN
    SET NOCOUNT ON;
    DECLARE @ForeignKeyName VARCHAR(255);
    DECLARE @TableName NVARCHAR(255);
    DECLARE @SQL NVARCHAR(MAX);
    DECLARE ForeignKeyCursor CURSOR FOR 
        SELECT fk.name AS ForeignKeyName,
               QUOTENAME(OBJECT_SCHEMA_NAME(fk.parent_object_id)) + '.' + t.name AS TableName
        FROM sys.foreign_keys AS fk
        INNER JOIN sys.tables AS t 
            ON fk.parent_object_id = t.object_id;

    OPEN ForeignKeyCursor;
    FETCH NEXT FROM ForeignKeyCursor INTO @ForeignKeyName, @TableName;
    WHILE @@FETCH_STATUS = 0 
    BEGIN
        SET @SQL = 'ALTER TABLE ' + @TableName + ' DROP CONSTRAINT ' + QUOTENAME(@ForeignKeyName) + ';';
        EXEC(@SQL);
        FETCH NEXT FROM ForeignKeyCursor INTO @ForeignKeyName, @TableName;
    END

    CLOSE ForeignKeyCursor;
    DEALLOCATE ForeignKeyCursor;

    -- Log workflow step
    EXEC [Process].[usp_TrackWorkFlow]
         @WorkFlowStepDescription = 'Drop Foreign Keys.',
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

###### Created: Sunday, 18 May 2025 10:09:04 pm


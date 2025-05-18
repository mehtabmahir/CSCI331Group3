USE PrestigeCars_3NF
GO

SET ANSI_NULLS ON;
GO
SET QUOTED_IDENTIFIER ON;
GO

-- =============================================
-- Author: Nayem Sarker
-- Purpose: Truncate all tables in key schemas after dropping FKs
-- =============================================

-- Drop the Truncate Procedure if it exists
DROP PROCEDURE IF EXISTS [Project2.5].[TruncateStarSchemaData];
GO

-- Recreate Truncate Procedure
CREATE PROCEDURE [Project2.5].[TruncateStarSchemaData]
    @UserAuthorizationKey INT
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE TableCursor CURSOR FOR
        SELECT DISTINCT '[' + TABLE_SCHEMA + '].[' + TABLE_NAME + ']' AS FullyQualifiedTableName
        FROM INFORMATION_SCHEMA.TABLES
        WHERE TABLE_TYPE = 'BASE TABLE'
          AND TABLE_SCHEMA IN ('Data', 'Reference', 'DataTransfer', 'SourceData', 'Output'); -- updated schema list

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

    EXEC [Process].[usp_TrackWorkFlow]
         @WorkFlowStepDescription = 'Truncate Star Schema Data.',
         @UserAuthorizationKey = @UserAuthorizationKey,
         @WorkFlowStepTableRowCount = -1;
END;
GO


-- =============================================
-- Author: Nayem Sarker
-- Purpose: Drop all foreign keys in the 3NF database
-- =============================================

-- Drop the Drop-FKs Procedure if it exists
DROP PROCEDURE IF EXISTS [Project2.5].[DropForeignKeysFromStarSchemaData];
GO

-- Recreate Drop-FKs Procedure
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
               QUOTENAME(OBJECT_SCHEMA_NAME(fk.parent_object_id)) + '.' + QUOTENAME(OBJECT_NAME(fk.parent_object_id)) AS TableName
        FROM sys.foreign_keys AS fk
        INNER JOIN sys.tables AS t 
            ON fk.parent_object_id = t.object_id
        WHERE OBJECT_SCHEMA_NAME(fk.parent_object_id) IN ('Data', 'Reference', 'DataTransfer', 'SourceData', 'Output');  -- match same schema filter

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

    EXEC [Process].[usp_TrackWorkFlow]
         @WorkFlowStepDescription = 'Drop Foreign Keys.',
         @UserAuthorizationKey = @UserAuthorizationKey,
         @WorkFlowStepTableRowCount = -1;
END;
GO
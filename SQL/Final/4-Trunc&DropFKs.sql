USE PrestigeCars_3NF
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author: Nayem Sarker
-- Create date: 5/14/2025
-- Description:	Truncate Star Schema
-- =============================================

DROP PROCEDURE IF EXISTS [Project2.5].[TruncateStarSchemaData]
GO 

CREATE PROCEDURE [Project2.5].[TruncateStarSchemaData]
	@UserAuthorizationKey int
AS 
BEGIN 
	SET NOCOUNT ON
	DECLARE TableCursor CURSOR FOR
	SELECT DISTINCT 
		'[' + TABLE_SCHEMA + '].[' + TABLE_NAME + ']' as FullyQualifiedTableName
	FROM INFORMATION_SCHEMA.TABLES
	WHERE TABLE_TYPE = 'Base Table' AND TABLE_SCHEMA LIKE '%Project3%'

	OPEN TableCursor
	DECLARE @TableName NVARCHAR(255)
	DECLARE @SQL VARCHAR(MAX)

	FETCH NEXT FROM TableCursor INTO @TableName

	WHILE @@FETCH_STATUS = 0
	BEGIN 
		SET @SQL = 'TRUNCATE TABLE ' + @TableName
		EXEC(@SQL)

		FETCH NEXT FROM TableCursor INTO @TableName
	END

	CLOSE TableCursor

	DEALLOCATE TableCursor

	EXEC [Process].[usp_TrackWorkFlow]
        @WorkFlowStepDescription = 'Truncate Star Schema Data.',
        @UserAuthorizationKey = @UserAuthorizationKey,
        @WorkFlowStepTableRowCount = -1;
END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author: Nayem Sarker
-- Create date: 5/14/2025
-- Description:	Drop the Foreign Keys From the Star Schema
-- =============================================

DROP PROCEDURE IF EXISTS [Project2.5].[DropForeignKeysFromStarSchemaData]

GO

CREATE PROCEDURE [Project2.5].[DropForeignKeysFromStarSchemaData]
    @UserAuthorizationKey INT
AS
BEGIN
    SET NOCOUNT ON;

    Declare @ForeignKeyName VARCHAR(255)
    DECLARE @SQL VARCHAR(MAX)
    DECLARE @TableName VARCHAR(255)
    DECLARE ForeignKeyCursor CURSOR FOR 
    
    SELECT fk.name as ForeignKeyName,
        QUOTENAME(OBJECT_SCHEMA_NAME(fk.parent_object_id)) + '.'+t.name as TableName
    FROM sys.foreign_keys as fk
    INNER JOIN sys.tables as t on fk.parent_object_id = t.object_id

    OPEN ForeignKeyCursor

    FETCH NEXT FROM ForeignKeyCursor INTO @ForeignKeyName, @TableName

    WHILE @@FETCH_STATUS = 0 
    BEGIN
        SET @SQL = 'ALTER TABLE ' + @TableName + ' DROP CONSTRAINT IF EXISTS ' + @ForeignKeyName + ';'
        EXEC(@SQL)
        
        FETCH NEXT FROM ForeignKeyCursor INTO @ForeignKeyName, @TableName
    END

    CLOSE ForeignKeyCursor
    DEALLOCATE ForeignKeyCursor

    EXEC [Process].[usp_TrackWorkFlow]
        @WorkFlowStepDescription = 'Drop Foreign Keys.',
        @UserAuthorizationKey = @UserAuthorizationKey,
        @WorkFlowStepTableRowCount = -1;

END;
GO

USE PrestigeCars_3NF
GO

-- ============================================================
-- Authors: ASHLY FELIX, Mehtab
-- Final Cleanup: Drop reference tables replaced by views, staging tables, and obsolete columns
-- ============================================================

-- Drop reference tables that have been replaced by views
DROP TABLE IF EXISTS Reference.SalesCategory;
DROP TABLE IF EXISTS Reference.Staff;
DROP TABLE IF EXISTS Reference.StaffHierarchy;
DROP TABLE IF EXISTS Reference.YearlySales;
DROP TABLE IF EXISTS Reference.SalesBudgets; -- Only if fully replaced and unused
GO

-- Drop staging/flat table no longer needed in normalized schema
DROP TABLE IF EXISTS Data.Country;
GO

-- Remove default constraints and drop obsolete columns from Reference.Country
-- Only if these columns are no longer needed anywhere

-- Find and drop default constraints for columns to be removed
DECLARE @sql NVARCHAR(MAX) = N'';

SELECT @sql = @sql + 'ALTER TABLE Reference.Country DROP CONSTRAINT [' + dc.name + '];' + CHAR(13)
FROM sys.default_constraints dc
JOIN sys.columns c ON dc.parent_object_id = c.object_id AND dc.parent_column_id = c.column_id
JOIN sys.tables t ON t.object_id = c.object_id
WHERE t.name = 'Country' AND t.schema_id = SCHEMA_ID('Reference')
  AND c.name IN ('FlagFileName', 'FlagFileType', 'CountryFlag');

EXEC sp_executesql @sql;

-- Now drop the columns themselves
ALTER TABLE Reference.Country
DROP COLUMN CountryFlag, FlagFileName, FlagFileType;
GO

-- Final Cleanup: Drop DataTransfer staging tables that are no longer needed

DROP TABLE IF EXISTS DataTransfer.Sales2015;
DROP TABLE IF EXISTS DataTransfer.Sales2016;
DROP TABLE IF EXISTS DataTransfer.Sales2017;
DROP TABLE IF EXISTS DataTransfer.Sales2018;
GO

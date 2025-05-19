USE PrestigeCars_3NF
GO

-- Final cleanup: Drop reference tables that have been replaced by views

DROP TABLE IF EXISTS Reference.SalesCategory;
DROP TABLE IF EXISTS Reference.Staff;
DROP TABLE IF EXISTS Reference.StaffHierarchy;
DROP TABLE IF EXISTS Reference.YearlySales;
DROP TABLE IF EXISTS Reference.SalesBudgets
GO

-- We should keep DataTransfer and SourceData tables for future refernence and backup

--AUTHOR: ASHLY FELIX 

--Drop EMPTY COLUMNS
--FIND CONSTRAINS: 
SELECT 
    t.name AS TableName,
    c.name AS ColumnName,
    dc.name AS ConstraintName
FROM 
    sys.default_constraints dc
JOIN 
    sys.columns c ON dc.parent_object_id = c.object_id AND dc.parent_column_id = c.column_id
JOIN 
    sys.tables t ON t.object_id = c.object_id
WHERE 
    t.name = 'Country' AND c.name IN ('FlagFileName', 'FlagFileType', 'CountryFlag');

--DROP CONSTRAINS: 
-- Drop all default constraints first
ALTER TABLE Data.Country DROP CONSTRAINT DF__Country__Country__19DFD96B;
ALTER TABLE Data.Country DROP CONSTRAINT DF__Country__FlagFil__1AD3FDA4;
ALTER TABLE Data.Country DROP CONSTRAINT DF__Country__FlagFil__1BC821DD;
ALTER TABLE Data.Country DROP CONSTRAINT DF__Country__Country__286302EC;
ALTER TABLE Data.Country DROP CONSTRAINT DF__Country__FlagFil__29572725;
ALTER TABLE Data.Country DROP CONSTRAINT DF__Country__FlagFil__2A4B4B5E;

-- Now drop the columns
ALTER TABLE Data.Country 
DROP COLUMN FlagFileName, FlagFileType, CountryFlag;

--DROP COLUMNS 
ALTER TABLE Data.Country
DROP COLUMN FlagFileName, FlagFileType, CountryFlag;

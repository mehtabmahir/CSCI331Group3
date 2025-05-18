USE PrestigeCars_3NF
GO

-- Final cleanup: Drop reference tables that have been replaced by views

DROP TABLE IF EXISTS Reference.SalesCategory;
DROP TABLE IF EXISTS Reference.Staff;
DROP TABLE IF EXISTS Reference.StaffHierarchy;
DROP TABLE IF EXISTS Reference.YearlySales;
GO

-- We should keep DataTransfer and SourceData tables for future refernence and backup
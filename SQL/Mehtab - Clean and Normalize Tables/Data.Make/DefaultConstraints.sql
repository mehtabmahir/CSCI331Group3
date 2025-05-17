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

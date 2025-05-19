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

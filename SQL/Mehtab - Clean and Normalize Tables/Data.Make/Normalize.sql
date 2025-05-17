/* Author: Mehtab Mahir */
USE PrestigeCars;
GO
UPDATE [PrestigeCars].[Data].[Make]
SET
    MakeName     = RTRIM(LTRIM(MakeName)),
    MakeCountry  = UPPER(RTRIM(LTRIM(MakeCountry)));
GO
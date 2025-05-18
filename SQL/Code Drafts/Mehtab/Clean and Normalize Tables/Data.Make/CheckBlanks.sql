/* CheckBlanks.sql */
/* Author: Mehtab Mahir */
USE PrestigeCars;
GO
SELECT
    SUM(CASE WHEN MakeName    IS NULL OR MakeName = N'' THEN 1 ELSE 0 END) AS blank_makename,
    SUM(CASE WHEN MakeCountry IS NULL OR MakeCountry = N'' THEN 1 ELSE 0 END) AS blank_makecountry
FROM [PrestigeCars].[Data].[Make];

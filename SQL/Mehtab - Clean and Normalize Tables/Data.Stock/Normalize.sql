/* Author: Mehtab Mahir */
USE PrestigeCars;
GO
UPDATE [PrestigeCars].[Data].[Stock]
SET
    Color         = UPPER(RTRIM(LTRIM(Color))),
    BuyerComments = RTRIM(LTRIM(BuyerComments));
GO

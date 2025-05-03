USE PrestigeCarsNorm;
GO
CREATE SCHEMA process;
GO

CREATE PROCEDURE process.CreateSchemas
AS
BEGIN
    EXEC('CREATE SCHEMA data');
    EXEC('CREATE SCHEMA reference');
    EXEC('CREATE SCHEMA output');
    EXEC('CREATE SCHEMA staging');
END;
GO

EXEC process.CreateSchemas;

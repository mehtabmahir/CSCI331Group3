--DATA.MODEL NORMALIZATION
--STEP1:
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Data].[Model](
	[ModelID] [dbo].[UDT_ModelID] NOT NULL,
	[MakeID] [dbo].[UDT_MakeID] NULL,
	[ModelName] [dbo].[UDT_ModelName] NULL
) ON [PRIMARY]
GO
ALTER TABLE [Data].[Model] ADD PRIMARY KEY CLUSTERED 
(
	[ModelID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [Data].[Model] ADD  DEFAULT (N'Unknown Model') FOR [ModelName]
GO
ALTER TABLE [Data].[Model]  WITH CHECK ADD FOREIGN KEY([MakeID])
REFERENCES [Data].[Make] ([MakeID])
GO

--STEP2:
INSERT INTO Data.Country (CountryID, CountryName, CountryISO2, CountryISO3, SalesRegion)
VALUES 
(1, N'Belgium', N'BE', N'BEL', N'EMEA'),
(2, N'France', N'FR', N'FRA', N'EMEA'),
(3, N'Germany', N'DE', N'DEU', N'EMEA'),
(4, N'Italy', N'IT', N'ITA', N'EMEA'),
(5, N'Spain', N'ES', N'ESP', N'EMEA'),
(6, N'United Kingdom', N'GB', N'GBR', N'EMEA'),
(7, N'United States', N'US', N'USA', N'North America'),
(8, N'China', N'CN', N'CHN', N'Asia'),
(9, N'India', N'IN', N'IND', N'Asia'),
(10, N'Switzerland', N'CH', N'CHF', N'EMEA');
GO
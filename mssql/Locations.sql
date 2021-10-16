--
-- Version: A specific place on earth.  Designed for Azure SQL Server. 
-- URL: http://ostlog.org/schema/Calendar_dates.json
--
CREATE TABLE [dbo].[Locations]
(
	[location_id] INT IDENTITY (1,1) NOT NULL, 
	[name] NVARCHAR (200) NOT NULL,
	[country_iso3_code] NVARCHAR (3) NOT NULL,
	[latitude] FLOAT NULL,
	[longitude] FLOAT NULL,
	[custom_group_1] NVARCHAR (200) NULL,
	[remarks] NVARCHAR(2056) NULL,
	CONSTRAINT [PK Location] PRIMARY KEY ([location_id]),
)
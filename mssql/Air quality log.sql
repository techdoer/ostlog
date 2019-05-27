--
-- Version: Each entry records air-quality related measures at a particular location.  Supports Azure SQL Server.
-- URL: http://ostlog.org/schema/Air_quality_log.json
--
CREATE TABLE [dbo].[Air quality log]
(
	[id] INT IDENTITY (1,1) NOT NULL,
	[meta_id] INT NULL,
	[calendar_date_id] INT DEFAULT CONVERT (char(8), GETDATE(), 112) NOT NULL,
	[timestamp] TIME(0) NOT NULL,
	[domain] NVARCHAR (15) NOT NULL,
	[location_id] INT NOT NULL, 
	[o3_ug_m3] FLOAT NULL,
	[no2_ug_m3] FLOAT NULL,
	[so2_ug_m3] FLOAT NULL,
	[co_ug_m3] FLOAT NULL,
	[hcho_mg_m3] FLOAT NULL,
	[tvoc_mg_m3] FLOAT NULL,
	[pm10_ug_m3] FLOAT NULL,
	[pm25_ug_m3] FLOAT NULL,
	[pm1_ug_m3] FLOAT NULL,
	[usaqi] FLOAT NULL,
	[remarks] NVARCHAR (4000) NULL,
	CONSTRAINT [PK_Air quality log] PRIMARY KEY CLUSTERED ([id] ASC),
	CONSTRAINT [FK_Air quality log-Calendar_date] FOREIGN KEY ([calendar_date_id]) REFERENCES [dbo].[Calendar dates] ([date_id]),
	CONSTRAINT [FK_Air quality log-People] FOREIGN KEY ([location_id]) REFERENCES [dbo].[Location] ([location_id]),
	CONSTRAINT [FK_Air quality8 log-Meta log] FOREIGN KEY ([meta_id]) REFERENCES [dbo].[Meta log] ([id]),
	CONSTRAINT [FK_Air quality log-Location] FOREIGN KEY ([location_id]) REFERENCES [dbo].[Location] ([location_id]),

	CHECK ([domain] = 'spiritual' OR [domain] = 'social' OR [domain] = 'physical' OR [domain] = 'intellectual' OR [domain] = 'financial' OR [domain] = 'emotional' OR [domain] = 'environmental')
)

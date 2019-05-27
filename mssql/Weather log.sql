--
-- Version: Each entry records weather-related measures at a particular location.  Supports Azure SQL Server.
-- URL: http://ostlog.org/schema/Weather_log.json
--
CREATE TABLE [dbo].[Weather log]
(
	[id] INT IDENTITY (1,1) NOT NULL,
	[meta_id] INT NULL,
	[calendar_date_id] INT DEFAULT CONVERT (char(8), GETDATE(), 112) NOT NULL,
	[timestamp] TIME(0) NOT NULL,
	[location_id] INT NOT NULL, 
	[domain] NVARCHAR (15) NOT NULL,
	[condition] NVARCHAR (512) NULL,
	[temperature_celsius] FLOAT NULL,
	[humidity_relative_%] FLOAT NULL,
	[pressure_mb] FLOAT NULL,
	[remarks] NVARCHAR (4000) NULL,
	CONSTRAINT [PK_Weather log] PRIMARY KEY CLUSTERED ([id] ASC),
	CONSTRAINT [FK_Weather log-Calendar_date] FOREIGN KEY ([calendar_date_id]) REFERENCES [dbo].[Calendar dates] ([date_id]),
	CONSTRAINT [FK_Weather log-People] FOREIGN KEY ([location_id]) REFERENCES [dbo].[Location] ([location_id]),
	CONSTRAINT [FK_Weather log-Meta log] FOREIGN KEY ([meta_id]) REFERENCES [dbo].[Meta log] ([id]),
	CONSTRAINT [FK_Weather log-Location] FOREIGN KEY ([location_id]) REFERENCES [dbo].[Location] ([location_id]),

	CHECK ([domain] = 'spiritual' OR [domain] = 'social' OR [domain] = 'physical' OR [domain] = 'intellectual' OR [domain] = 'financial' OR [domain] = 'emotional' OR [domain] = 'environmental')
)

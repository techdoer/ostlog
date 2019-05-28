--
-- Version: Each entry records an act of worship. For example, attending mass.  Supports Azure SQL Server.
-- URL: http://ostlog.org/schema/Worship_log.json
--
CREATE TABLE [dbo].[Worship log]
(
	[id] INT IDENTITY (1,1) NOT NULL,
	[meta_id] INT NULL,
	[calendar_date_id] INT DEFAULT CONVERT (char(8), GETDATE(), 112) NOT NULL,
	[timestamp] TIME(0) NOT NULL,
	[location_id] INT NULL,
	[domain] NVARCHAR (15) DEFAULT 'spiritual' NOT NULL,
	[person_id] INT NOT NULL, 
	[remarks] NVARCHAR (4000) NULL,
	CONSTRAINT [PK_Worship log] PRIMARY KEY CLUSTERED ([id] ASC),
	CONSTRAINT [FK_Worship log-Calendar_date] FOREIGN KEY ([calendar_date_id]) REFERENCES [dbo].[Calendar dates] ([date_id]),
	CONSTRAINT [FK_Worship log-People] FOREIGN KEY ([person_id]) REFERENCES [dbo].[People] ([id]),
	CONSTRAINT [FK_Worship log-Meta log] FOREIGN KEY ([meta_id]) REFERENCES [dbo].[Meta log] ([id]),
	CONSTRAINT [FK_Worship log-Location] FOREIGN KEY ([location_id]) REFERENCES [dbo].[Location] ([location_id]),

	CHECK ([domain] = 'spiritual' OR [domain] = 'social' OR [domain] = 'physical' OR [domain] = 'intellectual' OR [domain] = 'financial' OR [domain] = 'emotional' OR [domain] = 'environmental')
)

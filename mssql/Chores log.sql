--
-- Version: Each entry records the status of a planned or completed chore.  Supports Azure SQL Server.
-- URL: http://ostlog.org/schema/Chores_log.json
--
CREATE TABLE [dbo].[Chores log]
(
	[id] INT IDENTITY (1,1) NOT NULL,
	[meta_id] INT NULL,
	[calendar_date_id] INT DEFAULT CONVERT (char(8), GETDATE(), 112) NOT NULL,
	[timestamp] TIME(0) NOT NULL,
	[location_id] INT NULL,
	[domain] NVARCHAR (15) NOT NULL,
	[person_id] INT NOT NULL, 
	[min_per_day] INT NULL,
	[avg_per_day] INT NULL,
	[max_per_day] INT NULL,
	[remarks] NVARCHAR (4000) NULL,
	CONSTRAINT [PK_Chores log] PRIMARY KEY CLUSTERED ([id] ASC),
	CONSTRAINT [FK_Chores log-Calendar_date] FOREIGN KEY ([calendar_date_id]) REFERENCES [dbo].[Calendar dates] ([date_id]),
	CONSTRAINT [FK_Chores log-People] FOREIGN KEY ([person_id]) REFERENCES [dbo].[People] ([id]),
	CONSTRAINT [FK_Chores log-Location] FOREIGN KEY ([location_id]) REFERENCES [dbo].[Location] ([location_id]),
	CONSTRAINT [FK_Chores log-Meta log] FOREIGN KEY ([meta_id]) REFERENCES [dbo].[Meta log] ([id]),
	CHECK ([domain] = 'spiritual' OR [domain] = 'social' OR [domain] = 'physical' OR [domain] = 'intellectual' OR [domain] = 'financial' OR [domain] = 'emotional' OR [domain] = 'environmental'),
)
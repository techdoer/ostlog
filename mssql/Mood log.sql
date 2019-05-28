--
-- Version: Each entry records a person's assessment of their mood and a sentiment score on the response on a day in time.  Supports Azure SQL Server.
-- URL: http://ostlog.org/schema/Sleep_log.json
--
CREATE TABLE [dbo].[Mood log]
(
	[id] INT IDENTITY (1,1) NOT NULL,
	[meta_id] INT NULL,
	[calendar_date_id] INT DEFAULT CONVERT (char(8), GETDATE(), 112) NOT NULL,
	[timestamp] TIME (0) NOT NULL,
	[location_id] INT NULL,
	[domain] NVARCHAR (15) DEFAULT 'emotional' NOT NULL,
	[person_id] INT NOT NULL,
	[feeling_term] NVARCHAR(50) NULL,
	[high_energy] NVARCHAR (20) NULL,
	[remarks] NVARCHAR(4000) NULL,   
	CONSTRAINT [PK_Mood log] PRIMARY KEY CLUSTERED ([id] ASC),
	CONSTRAINT [FK_Mood log-Calendar_date1] FOREIGN KEY ([calendar_date_id]) REFERENCES [dbo].[Calendar dates] ([date_id]),
	CONSTRAINT [FK_Mood log-People] FOREIGN KEY ([person_id]) REFERENCES [dbo].[People] ([id]),
	CONSTRAINT [FK_Mood log-Location] FOREIGN KEY ([location_id]) REFERENCES [dbo].[Location] ([location_id]),
	CONSTRAINT [FK_Mood log-Meta log] FOREIGN KEY ([meta_id]) REFERENCES [dbo].[Meta log] ([id]),
	
	CHECK ([high_energy] = 'strongly disagree' OR [high_energy] = 'disagree' OR [high_energy] = 'neutral' OR [high_energy] = 'agree' OR [high_energy] = 'strongly agree'),
	CHECK ([domain] = 'spiritual' OR [domain] = 'social' OR [domain] = 'physical' OR [domain] = 'intellectual' OR [domain] = 'financial' OR [domain] = 'emotional' OR [domain] = 'environmental'),
)

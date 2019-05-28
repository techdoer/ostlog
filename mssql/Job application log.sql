--
-- Version: Each entry records a submitted job application.  Supports Azure SQL Server.
-- URL: http://ostlog.org/schema/Chores_log.json
--
CREATE TABLE [dbo].[Job application log]
(
	[id] INT IDENTITY (1,1) NOT NULL,
	[meta_id] INT NULL,
	[calendar_date_id] INT DEFAULT CONVERT (char(8), GETDATE(), 112) NOT NULL,
	[timestamp] TIME(0) NOT NULL,
	[location_id] INT NOT NULL,
	[employer_location_id] INT NOT NULL,
	[domain] NVARCHAR (15) DEFAULT 'intellectual' NOT NULL,
	[person_id] INT NOT NULL, 
	[job_description] NVARCHAR (4000) NOT NULL,
	[remarks] NVARCHAR (4000) NULL,
	CONSTRAINT [PK_Job application log] PRIMARY KEY CLUSTERED ([id] ASC),
	CONSTRAINT [FK_Job application log-Calendar_date] FOREIGN KEY ([calendar_date_id]) REFERENCES [dbo].[Calendar dates] ([date_id]),
	CONSTRAINT [FK_Job application log-People] FOREIGN KEY ([person_id]) REFERENCES [dbo].[People] ([id]),
	CONSTRAINT [FK_Job application log-Location] FOREIGN KEY ([location_id]) REFERENCES [dbo].[Location] ([location_id]),
	CONSTRAINT [FK_Job application log-Meta log] FOREIGN KEY ([meta_id]) REFERENCES [dbo].[Meta log] ([id]),

	CHECK ([domain] = 'spiritual' OR [domain] = 'social' OR [domain] = 'physical' OR [domain] = 'intellectual' OR [domain] = 'financial' OR [domain] = 'emotional' OR [domain] = 'environmental'),
)
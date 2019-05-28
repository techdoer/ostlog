--
-- Version: Each entry records a project with a defined start and end date.  Supports Azure SQL Server.
-- URL: http://ostlog.org/schema/Projects_log.json
--
CREATE TABLE [dbo].[Projects log]
(
	[id] INT IDENTITY (1,1) NOT NULL,
	[meta_id] INT NULL,
	[start_date_id] INT DEFAULT CONVERT (char(8), GETDATE(), 112) NOT NULL,
	[end_date_id] INT NULL,
	[location_id] INT NULL,
	[domain] NVARCHAR (15) DEFAULT 'physical' NOT NULL,
	[person_id] INT NOT NULL,
	[name] NVARCHAR(100) NOT NUll,
	[status] NVARCHAR(20) NOT NULL,
	[is_successful] NVARCHAR(20) NULL,
	[remarks] NVARCHAR(4000) NULL,   

	CONSTRAINT [PK_Projects log] PRIMARY KEY CLUSTERED ([id] ASC),
	CONSTRAINT [FK_Projects log-Calendar_date2] FOREIGN KEY ([start_date_id]) REFERENCES [dbo].[Calendar dates] ([date_id]),
	CONSTRAINT [FK_Projects log-Calendar_date3] FOREIGN KEY ([end_date_id]) REFERENCES [dbo].[Calendar dates] ([date_id]),
	CONSTRAINT [FK_Projects log-People] FOREIGN KEY ([person_id]) REFERENCES [dbo].[People] ([id]),
	CONSTRAINT [FK_Projects log-Meta log] FOREIGN KEY ([meta_id]) REFERENCES [dbo].[Meta log] ([id]),
	CONSTRAINT [FK_Projects log-Location] FOREIGN KEY ([location_id]) REFERENCES [dbo].[Location] ([location_id]),
	
	CHECK ([status] = 'planned' OR [status] = 'in-progress' OR [status] = 'completed' OR [status] = 'cancelled'),
	CHECK ([is_successful] = 'strongly disagree' OR [is_successful] = 'disagree' OR [is_successful] = 'neutral' OR [is_successful] = 'agree' OR [is_successful] = 'strongly agree'),
	CHECK ([domain] = 'spiritual' OR [domain] = 'social' OR [domain] = 'physical' OR [domain] = 'intellectual' OR [domain] = 'financial' OR [domain] = 'emotional' OR [domain] = 'environmental'),
)
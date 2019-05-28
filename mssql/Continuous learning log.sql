--
-- Version: Each entry records the a continuous learning activity.  Supports Azure SQL Server.
-- URL: http://ostlog.org/schema/Continuous_learning_log.json
--
CREATE TABLE [dbo].[Continuous learning log]
(
	[id] INT IDENTITY (1,1) NOT NULL,
	[meta_id] INT NULL,
	[start_date_id] INT DEFAULT CONVERT (char(8), GETDATE(), 112) NOT NULL,
	[start_time] TIME (0) NOT NULL,
	[end_date_id] INT NULL,
	[end_time] TIME (0) NULL,
	[location_id] INT NULL,
	[domain] NVARCHAR (15) DEFAULT 'physical' NOT NULL,
	[person_id] INT NOT NULL,
	[name] NVARCHAR(100) NOT NUll,
	[type] NVARCHAR (10) NOT NULL,
	[status] NVARCHAR(20) NOT NULL,
	[is_successful] NVARCHAR(20) NULL,
	[remarks] NVARCHAR(4000) NULL,   

	CONSTRAINT [PK_Continuous learning log] PRIMARY KEY CLUSTERED ([id] ASC),
	CONSTRAINT [FK_Continuous learning log-Calendar_date2] FOREIGN KEY ([start_date_id]) REFERENCES [dbo].[Calendar dates] ([date_id]),
	CONSTRAINT [FK_Continuous learning log-Calendar_date3] FOREIGN KEY ([end_date_id]) REFERENCES [dbo].[Calendar dates] ([date_id]),
	CONSTRAINT [FK_Continuous learning log-People] FOREIGN KEY ([person_id]) REFERENCES [dbo].[People] ([id]),
	CONSTRAINT [FK_Continuous learning log-Meta log] FOREIGN KEY ([meta_id]) REFERENCES [dbo].[Meta log] ([id]),
	CONSTRAINT [FK_Continuous learning log-Location] FOREIGN KEY ([location_id]) REFERENCES [dbo].[Location] ([location_id]),

	
	CHECK ([type] = 'reading' OR [type] = 'writing' OR [type] = 'listening' OR [type] = 'doing' OR [type] = 'hybrid'),
	CHECK ([status] = 'planned' OR [status] = 'in-progress' OR [status] = 'completed' OR [status] = 'cancelled'),
	CHECK ([is_successful] = 'strongly disagree' OR [is_successful] = 'disagree' OR [is_successful] = 'neutral' OR [is_successful] = 'agree' OR [is_successful] = 'strongly agree'),
	CHECK ([domain] = 'spiritual' OR [domain] = 'social' OR [domain] = 'physical' OR [domain] = 'intellectual' OR [domain] = 'financial' OR [domain] = 'emotional' OR [domain] = 'environmental'),
)